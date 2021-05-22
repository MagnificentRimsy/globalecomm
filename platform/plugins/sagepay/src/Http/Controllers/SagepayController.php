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

        //dd($request, $response, $request->session()->get('data'));
//
        $result = $request->session()->get('data');
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
        $this->storeLocalPayment([
            'amount'          =>  $result['total_amount'] / 100,
            'currency'        => $result['currency'],
            'charge_id'       => $result['tran_id'],
            'payment_channel' => SAGEPAY_PAYMENT_METHOD_NAME,
            'status'          => $result['status'] ? PaymentStatusEnum::COMPLETED : PaymentStatusEnum::FAILED,
            'customer_id'     => auth('customer')->check() ? auth('customer')->user()->getAuthIdentifier() : null,
            'payment_type'    => 'direct',
            'order_id'        => $result['order_id'],
        ]);
//
        OrderHelper::processOrder($result['order_id'], $result['tran_id']);


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
