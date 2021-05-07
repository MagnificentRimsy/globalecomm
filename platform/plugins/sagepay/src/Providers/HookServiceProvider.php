<?php

namespace Botble\Sagepay\Providers;

use Botble\Ecommerce\Repositories\Interfaces\OrderAddressInterface;
use Botble\Ecommerce\Repositories\Interfaces\StoreLocatorInterface;
use Botble\Payment\Enums\PaymentMethodEnum;
use Html;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\ServiceProvider;
//use Omnipay\Omnipay;
use Illuminate\Support\Str;
use Omnipay\Common\CreditCard;
use Omnipay\Omnipay;
use Throwable;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        add_filter(PAYMENT_FILTER_ADDITIONAL_PAYMENT_METHODS, [$this, 'registerSagepayMethod'], 19, 2);
        add_filter(PAYMENT_FILTER_AFTER_POST_CHECKOUT, [$this, 'checkoutWithSagepay'], 19, 2);

        add_filter(PAYMENT_METHODS_SETTINGS_PAGE, [$this, 'addPaymentSettings'], 100);

        add_filter(BASE_FILTER_ENUM_ARRAY, function ($values, $class) {
            if ($class == PaymentMethodEnum::class) {
                $values['SAGEPAY'] = SAGEPAY_PAYMENT_METHOD_NAME;
            }

            return $values;
        }, 34543, 2);

        add_filter(BASE_FILTER_ENUM_LABEL, function ($value, $class) {
            if ($class == PaymentMethodEnum::class && $value == SAGEPAY_PAYMENT_METHOD_NAME) {
                $value = 'Sagepay';
            }

            return $value;
        }, 34543, 2);

        add_filter(BASE_FILTER_ENUM_HTML, function ($value, $class) {
            if ($class == PaymentMethodEnum::class && $value == SAGEPAY_PAYMENT_METHOD_NAME) {
                $value = Html::tag('span', PaymentMethodEnum::getLabel($value),
                    ['class' => 'label-success status-label'])
                    ->toHtml();
            }

            return $value;
        }, 34543, 2);
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
    public  function  checkoutWithSagepay(array $data, Request $request){
        if ($request->input('payment_method') == SAGEPAY_PAYMENT_METHOD_NAME) {
            $configure = config('plugins.sagepay.sagepay');

            $body = [];
            $body['total_amount'] = $request->input('amount'); // You cant not pay less than 10
            $body['currency'] = $request->input('currency');
            $body['tran_id'] = uniqid(); // tran_id must be unique

            $orderAddress = $this->app->make(OrderAddressInterface::class)
                ->getFirstBy(['order_id' => $request->input('order_id')]);

            $body['cus_add2'] = '';
            $body['cus_city'] = '';
            $body['cus_state'] = '';
            $body['cus_postcode'] = '';
            $body['cus_fax'] = '';

            $body['cus_name'] = 'Not set';
            $body['cus_email'] = 'Not set';
            $body['cus_add1'] = 'Not set';
            $body['cus_country'] = 'Not set';
            $body['cus_phone'] = 'Not set';

            // CUSTOMER INFORMATION
            if ($orderAddress) {
                $body['cus_name'] = $orderAddress->name;
                $body['cus_email'] = $orderAddress->email;
                $body['cus_add1'] = $orderAddress->address;
                $body['cus_country'] = $orderAddress->country_name;
                $body['cus_phone'] = $orderAddress->phone;
            }

            $primaryStore = $this->app->make(StoreLocatorInterface::class)->getFirstBy(['is_primary' => 1]);

            $body['ship_name'] = 'Not set';
            $body['ship_add1'] = 'Not set';
            $body['ship_add2'] = 'Not set';
            $body['ship_city'] = 'Not set';
            $body['ship_state'] = 'Not set';
            $body['ship_postcode'] = 'Not set';
            $body['ship_phone'] = 'Not set';
            $body['ship_country'] = 'Not set';

            # SHIPMENT INFORMATION
            if ($primaryStore) {
                $body['ship_name'] = $primaryStore->name;
                $body['ship_add1'] = $primaryStore->address;
                $body['ship_add2'] = '';
                $body['ship_city'] = $primaryStore->city;
                $body['ship_state'] = $primaryStore->state;
                $body['ship_postcode'] = '';
                $body['ship_phone'] = $primaryStore->phone;
                $body['ship_country'] = $primaryStore->country_name;
            }

            $body['shipping_method'] = 'NO';

            $body['product_category'] = 'Goods';
            $body['product_name'] = 'Order #' . $request->input('order_id');
            $body['product_profile'] = 'physical-goods';

            $body['value_a'] = $request->input('order_id');
            $body['value_b'] = session('tracked_start_checkout');
            $body['value_c'] = $request->input('customer_id');
            $body['value_d'] = urlencode($request->input('customer_type'));

            $gateway = OmniPay::create('SagePay\Direct')->initialize([
                'vendor' =>  $configure['apiCredentials']['vendor_id'],
                'testMode' => true,
            ]);


            $card = new CreditCard([
                'firstName' => 'Michael',
                'lastName' => 'Ameyaw',

                'number' => '4929000000006',
                'expiryMonth' => '12',
                'expiryYear' => '2022',
                'CVV' => '123',

                // Billing address details are required.
                //...
                'billingFirstName' => 'Mike',
                'billingLastName' => 'Ameyaw',
                'billingAddress1' => 'Billing Address 1',
                'billingAddress2' => 'Billing Address 2',
                //'billingState' => 'TX',
                'billingCity' => 'Billing City',
                'billingPostcode' => 'BPOSTC',
                'billingCountry' => 'GH',
                'billingPhone' => '01234 567 890',
                //...

               'email' =>  $orderAddress ? $orderAddress->email : 'no-email@domain.com', //'michaelameyaw7@gmail.com',
               'clientIp' => '192.168.8.102',

                //...
                'shippingFirstName' => 'Mike',
                'shippingLastName' => 'Ameyaw',
                'shippingAddress1' => '99',
//                'shippingState' => 'GH',
                'shippingCity' => 'Accra',
                'shippingPostcode' => 'SPOSTC',
                'shippingCountry' => 'GH',
                'shippingPhone' => '0553771219'

            ]);


            // Create the minimal request message.
            $requestMessage = $gateway->purchase([
                'amount' => $body['total_amount'],//(int)$request->input('amount') * 100,
                'currency' => $body['currency'],//'GBP',
                'card' => $card,
                'transactionId' => $body['tran_id'],
                'description' => 'Pizzas for everyone at PHPNE',


                'returnUrl' => $configure['apiCredentials']['callback_url']
            ]);

            // Send the request message.
            $responseMessage = $requestMessage->send();


            if ($responseMessage->isSuccessful()) {
                // payment is complete
                header('Location: ' .  $configure['apiCredentials']['callback_url']);
                exit;
            } elseif ($responseMessage->isRedirect()) {
                $responseMessage->redirect(); // this will automatically forward the customer
            } else {
                // not successful
                $paymentData['error'] = true;

                $paymentData['message'] = $responseMessage->getMessage();


                //return back()->with($paymentData);
                dd($responseMessage->getMessage());
            }


//            dd($gateway);
//            echo '<br>';
//           dd($body);
//           echo '<br>';
           //dd(config('plugins.sagepay.sagepay'));
        }

        return $data;
    }

//    /**
//     * @param Request $request
//     * @param array $data
//     */
//    public function checkoutWithSagepay(array $data, Request $request)
//    {
//        if ($request->input('payment_method') == SAGEPAY_PAYMENT_METHOD_NAME) {
//            $orderAddress = $this->app->make(OrderAddressInterface::class)->getFirstBy(['order_id' => $request->input('order_id')]);
////
////            $this->config = config('plugins.sslcommerz.sslcommerz');
////
////            $this->setStoreId($this->config['apiCredentials']['store_id']);
////            $this->setStorePassword($this->config['apiCredentials']['store_password']);
//
//            $gateway = OmniPay::create('SagePay\Direct')->initialize([
//                'vendor' =>  get_payment_setting('plugins.sagepay.sagepay.apiCredentials.vendor_id', SAGEPAY_PAYMENT_METHOD_NAME),
//                'testMode' => true,
//            ]);
//
//            // Create the credit card object from details entered by the user.
//            $transactionId = Str::random(20);
//            $card = new CreditCard([
//                'firstName' => 'Michael',
//                'lastName' => 'Ameyaw',
//
//                'number' => '4929000000006',
//                'expiryMonth' => '12',
//                'expiryYear' => '2022',
//                'CVV' => '123',
//
//                // Billing address details are required.
//                //...
//                'billingFirstName' => 'Mike',
//                'billingLastName' => 'Ameyaw',
//                'billingAddress1' => 'Billing Address 1',
//                'billingAddress2' => 'Billing Address 2',
//                //'billingState' => 'TX',
//                'billingCity' => 'Billing City',
//                'billingPostcode' => 'BPOSTC',
//                'billingCountry' => 'GH',
//                'billingPhone' => '01234 567 890',
//                //...
//
//               'email' =>  $orderAddress ? $orderAddress->email : 'no-email@domain.com', //'michaelameyaw7@gmail.com',
//               'clientIp' => '192.168.8.102',
//
//                //...
//                'shippingFirstName' => 'Mike',
//                'shippingLastName' => 'Ameyaw',
//                'shippingAddress1' => '99',
////                'shippingState' => 'GH',
//                'shippingCity' => 'Accra',
//                'shippingPostcode' => 'SPOSTC',
//                'shippingCountry' => 'GH',
//                'shippingPhone' => '0553771219'
//
//            ]);
//
//            // Create the minimal request message.
//
//            $requestMessage = $gateway->purchase([
//                'amount' => (int)$request->input('amount') * 100,
//                'currency' => $request->input('currency'),//'GBP',
//                'card' => $card,
//                'transactionId' => $transactionId,
//                'description' => 'Pizzas for everyone at PHPNE',
//
//                // If 3D Secure is enabled, then provide a return URL for
//                // when the user comes back from 3D Secure authentication.
//
//                'returnUrl' => get_payment_setting('plugins.sagepay.sagepay.apiCredentials.callback_url', SAGEPAY_PAYMENT_METHOD_NAME), //'https://example.co.uk/sagepay-complete',
//            ]);
//
//            // Send the request message.
//
//            $responseMessage = $requestMessage->send();
//
//
//            if ($responseMessage->isSuccessful()) {
//                // payment is complete
//                header('Location: ' . get_payment_setting('return_url', SAGEPAY_PAYMENT_METHOD_NAME));
//                exit;
//            } elseif ($responseMessage->isRedirect()) {
//                $responseMessage->redirect(); // this will automatically forward the customer
//            } else {
//                // not successful
//                dd($responseMessage->getMessage());
//            }
//
//            //Sagepay::genTranxRef();
////            $response = Sagepay::getAuthorizationResponse([
////                'reference' => Sagepay::genTranxRef(),
////                'quantity'  => 1,
////                'currency'  => $request->input('currency'),
////                'amount'    => (int)$request->input('amount') * 100,
////                'email'     => $orderAddress ? $orderAddress->email : 'no-email@domain.com',
////                'metadata'  => json_encode(['order_id' => $request->input('order_id')]),
////            ]);
////            dd($response);
////
////            if ($response['status']) {
////                header('Location: ' . $response['data']['authorization_url']);
////                exit;
////            }
//        }
//
//        return $data;
//    }
//



}
