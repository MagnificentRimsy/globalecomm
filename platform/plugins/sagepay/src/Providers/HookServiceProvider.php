<?php

namespace Botble\Sagepay\Providers;

use Botble\Ecommerce\Repositories\Interfaces\OrderAddressInterface;
use Botble\Ecommerce\Repositories\Interfaces\StoreLocatorInterface;
use Botble\Ecommerce\Supports\OrderHelper;
use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Payment\Repositories\Interfaces\PaymentInterface;
use Html;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;
use Omnipay\Common\CreditCard;
use Omnipay\Omnipay;
use Throwable;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        add_filter(PAYMENT_FILTER_ADDITIONAL_PAYMENT_METHODS, [$this, 'registerSagepayMethod'], 41, 2);
        add_filter(PAYMENT_FILTER_AFTER_POST_CHECKOUT, [$this, 'checkoutWithSagepay'], 41, 2);

        add_filter(PAYMENT_METHODS_SETTINGS_PAGE, [$this, 'addPaymentSettings'], 51);

        add_filter(BASE_FILTER_ENUM_ARRAY, function ($values, $class) {
            if ($class == PaymentMethodEnum::class) {
                $values['SAGEPAY'] = SAGEPAY_PAYMENT_METHOD_NAME;
            }

            return $values;
        }, 60, 2);

        add_filter(BASE_FILTER_ENUM_LABEL, function ($value, $class) {
            if ($class == PaymentMethodEnum::class && $value == SAGEPAY_PAYMENT_METHOD_NAME) {
                $value = 'Sagepay';
            }

            return $value;
        }, 60, 2);

        add_filter(BASE_FILTER_ENUM_HTML, function ($value, $class) {
            if ($class == PaymentMethodEnum::class && $value == SAGEPAY_PAYMENT_METHOD_NAME) {
                $value = Html::tag('span', PaymentMethodEnum::getLabel($value),
                    ['class' => 'label-success status-label'])
                    ->toHtml();
            }

            return $value;
        }, 60, 2);
    }

    /**
     * @param string $settings
     * @return string
     * @throws Throwable
     */
    public function addPaymentSettings($settings)
    {
        return $settings . view('plugins/sagepay::settings')->render();
    }

    /**
     * @param string $html
     * @param array $data
     * @return string
     */
    public function registerSagepayMethod($html, array $data)
    {
        return $html . view('plugins/sagepay::methods', $data)->render();
    }

    /**
     * @param array $data
     * @param Request $request
     * @return array
     * @throws \Illuminate\Contracts\Container\BindingResolutionException
     */
    public function checkoutWithSagepay(array $data, Request $request)
    {
        if ($request->input('payment_method') == SAGEPAY_PAYMENT_METHOD_NAME) {
            $configure = config('plugins.sagepay.sagepay');

            $v = Validator::make($request->all(), [
            'sagepay-number' => 'required|unique|max:255',
            'sagepay-exp' => 'required|date_format:m/y|after:yesterday',
            'sagepay-name' => 'required',
            'sagepay-cvc' => 'required|numeric|min:3|max:3',
            ]);

            if ($v->fails())
            {
                return redirect()->back()->withErrors($v->errors());
            }

            $expArr = explode("/", $request->input(SAGEPAY_PAYMENT_METHOD_NAME . '-exp'));
            $nameArray = explode(" ", $request->input(SAGEPAY_PAYMENT_METHOD_NAME . '-name'));

            $body = [];
            $body['total_amount'] = $request->input('amount'); // You cant not pay less than 10
            $body['currency'] = $request->input('currency');
            $body['tran_id'] = uniqid(); // tran_id must be unique
            $data['charge_id'] = $body['tran_id'];
            $body['order_id'] = $request->input('order_id');

            $orderAddress = $this->app->make(OrderAddressInterface::class)
                ->getFirstBy(['order_id' => $request->input('order_id')]);

            $primaryStore = $this->app->make(StoreLocatorInterface::class)->getFirstBy(['is_primary' => 1]);

            

            $gateway = OmniPay::create('SagePay\Direct')->initialize([
                'vendor' => $configure['apiCredentials']['vendor_id'],
                'testMode' => true,
            ]);

            $requestMessage = $gateway->purchase([
                'amount' => $body['total_amount'] * 100,//(int)$request->input('amount') * 100,
                'currency' => $body['currency'],//'GBP',
                'card' => $this->getCreditCard($request, $nameArray, $expArr, $orderAddress, $primaryStore),
                'transactionId' => $body['tran_id'],
                'description' => 'Pizzas for everyone at PHPNE',


                'returnUrl' => $configure['apiCredentials']['callback_url']
            ]);

             

            $responseMessage = $requestMessage->send();


            if ($responseMessage->isSuccessful()) {

                // payment is complete
                $body['status'] = true;
                $this->createPaymentInterface($data, $request, true);
                $body['message'] = 'Payment was successful';

                return redirect()->to($configure['apiCredentials']['callback_url'])->send()->with(['data' => $body]);
                //header('Location: ' .  $configure['apiCredentials']['callback_url']);
                //exit;
            } else {
                dd($responseMessage->getMessage());
                $body['status'] = false;
                $this->createPaymentInterface($data, $request, false);
                dd($responseMessage->getMessage());
            }

        }

        return $data;
    }

    /**
     * @param Request $request
     * @param array $nameArray
     * @param array $expArr
     * @param $orderAddress
     * @param $primaryStore
     * @return CreditCard
     */
    private function getCreditCard(Request $request, array $nameArray, array $expArr, $orderAddress, $primaryStore)
    {
        $card = new CreditCard([
            'firstName' => $nameArray[0],
            'lastName' => $nameArray[1],

            'number' => $request->input(SAGEPAY_PAYMENT_METHOD_NAME . '-number'),
            'expiryMonth' => $expArr[0],
            'expiryYear' => $expArr[1],
            'CVV' => $request->input(SAGEPAY_PAYMENT_METHOD_NAME . '-cvc'),

            // Billing address details are required.
            //...
            'billingFirstName' => $nameArray[0],
            'billingLastName' => $nameArray[1],
            'billingAddress1' => 'Billing Address 1',
            'billingAddress2' => 'Billing Address 2',
            //'billingState' => 'TX',
            'billingCity' => 'Billing City',
            'billingPostcode' => 'BPOSTC',
            'billingCountry' => 'GH',
            'billingPhone' => '01234 567 890',
            //...

            'email' => $orderAddress ? $orderAddress->email : 'no-email@domain.com', //'michaelameyaw7@gmail.com',
            'clientIp' => '192.168.8.102',

            'shippingFirstName' => $primaryStore->name,
            'shippingLastName' => $primaryStore->name,
            'shippingAddress1' => $primaryStore->address,
//                'shippingState' => $primaryStore->state,
            'shippingCity' => $primaryStore->city,
            'shippingPostcode' => '',
            'shippingCountry' => 'GH', //$primaryStore->country_name,
            'shippingPhone' => $primaryStore->phone

        ]);

        return $card;
    }

    /**
     * @param array $data
     * @param Request $request
     * @param bool $status
     */
    private function createPaymentInterface(array $data, Request $request, bool $status)
    {
        app(PaymentInterface::class)->create([
            'amount' => $data['amount'],
            'currency' => $data['currency'],
            'charge_id' => $data['charge_id'],
            'payment_channel' => SAGEPAY_PAYMENT_METHOD_NAME,
            'status' => $status ? PaymentStatusEnum::COMPLETED : PaymentStatusEnum::FAILED,
            'order_id' => $request->input('order_id'),
        ]);
    }
}
