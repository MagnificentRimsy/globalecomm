<?php
namespace Botble\Sagepay\Http\Controllers;

use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Payment\Services\Traits\PaymentTrait;
use Illuminate\Support\Str;
use OrderHelper;
use Illuminate\Http\Request;
//use Omnipay\Omnipay;
use Paystack;
use Throwable;

class SagepayController extends BaseController
{
    use PaymentTrait;

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws Throwable
     */
    public function getPaymentStatus(Request $request, BaseHttpResponse $response)
    {

//
//        $result = Sagepay::getPaymentData();
//        $this->storeLocalPayment([
//            'amount'          =>  $result['data']['amount'] / 100,
//            'currency'        => $result['data']['currency'],
//            'charge_id'       => $request->input('reference'),
//            'payment_channel' => SAGEPAY_PAYMENT_METHOD_NAME,
//            'status'          => $result['status'] ? PaymentStatusEnum::COMPLETED : PaymentStatusEnum::FAILED,
//            'customer_id'     => $request->input('customer_id'),
//            'customer_type'   => $request->input('customer_type'),
//            'payment_type'    => 'direct',
//            'order_id'        => $result['data']['metadata']['order_id'],
//        ]);
//
//        OrderHelper::processOrder($result['data']['metadata']['order_id'], $request->input('reference'));
        $result['status'] = true;
        $result['message'] = "Payment was successful.";

        if (!$result['status']) {
            return $response
                ->setError()
                ->setNextUrl(route('public.checkout.success', session('tracked_start_checkout')))
                ->setMessage($result['message']);
        }

        return $response
            ->setNextUrl(route('public.checkout.success', session('tracked_start_checkout')))
            ->setMessage(__('Checkout successfully!'));
    }
}
