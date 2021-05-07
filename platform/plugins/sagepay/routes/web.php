<?php

Route::group(['namespace' => 'Botble\Sagepay\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::get('sagepay/payment/callback', [
        'as'   => 'sagepay.payment.callback',
        'uses' => 'SagepayController@getPaymentStatus',
    ]);
});
