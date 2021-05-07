<?php

if (!defined('SAGEPAY_PAYMENT_METHOD_NAME')) {
    define('SAGEPAY_PAYMENT_METHOD_NAME', 'sagepay');
}

return [
    // For Sandbox, use "https://sandbox.sagepay.com"
    // For Live, use "https://securepay.sagepay.com"
    'apiDomain'              => env('API_DOMAIN_URL', 'https://sandbox.sagepay.com'),
    'apiCredentials'         => [
        'vendor_id'       => env('VENDOR_ID'),
        'public_secret_id' => env('PUBLIC_SECRET_ID'),
        'private_secret_id' => env('PRIVATE_SECRET_ID'),
        'callback_url' => env('CALLBACK_URL'),
    ],
    'apiUrl'                 => [
        'make_payment'       => '/gwprocess/v4/api.php',
        'transaction_status' => '/validator/api/merchantTransIDvalidationAPI.php',
        'order_validate'     => '/validator/api/validationserverAPI.php',
        'refund_payment'     => '/validator/api/merchantTransIDvalidationAPI.php',
        'refund_status'      => '/validator/api/merchantTransIDvalidationAPI.php',
    ],
    'connect_from_localhost' => env('IS_LOCALHOST', true), // For Sandbox, use "true", For Live, use "false"
    'success_url'            => '/sagepay/payment/success',
    'failed_url'             => '/sagepay/payment/fail',
    'cancel_url'             => '/sagepay/payment/cancel',
    'ipn_url'                => '/sagepay/payment/ipn',
];
