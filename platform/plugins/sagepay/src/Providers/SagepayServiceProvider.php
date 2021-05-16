<?php

namespace Botble\Sagepay\Providers;

use Botble\Base\Supports\Helper;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Support\ServiceProvider;

class SagepayServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register()
    {
        Helper::autoload(__DIR__ . '/../../helpers');
    }

    /**
     * @throws FileNotFoundException
     * @throws \Illuminate\Contracts\Container\BindingResolutionException
     */
    public function boot()
    {
        if (is_plugin_active('payment')) {
            $this->setNamespace('plugins/sagepay')
                ->loadAndPublishConfigurations(['sagepay'])
                ->loadRoutes(['web'])
                ->loadAndPublishViews()
                ->publishAssets();
            $this->app->register(HookServiceProvider::class);


            $this->app->make('config')->set([
                'plugins.sagepay.sagepay.apiCredentials.vendor_id' => get_payment_setting('vendor_id', SAGEPAY_PAYMENT_METHOD_NAME),
                'plugins.sagepay.sagepay.apiCredentials.public_secret_id' => get_payment_setting('public_secret_id', SAGEPAY_PAYMENT_METHOD_NAME),
                'plugins.sagepay.sagepay.apiCredentials.private_secret_id' => get_payment_setting('private_secret_id', SAGEPAY_PAYMENT_METHOD_NAME),
                'plugins.sagepay.sagepay.apiCredentials.callback_url' => get_payment_setting('callback_url', SAGEPAY_PAYMENT_METHOD_NAME),
                'plugins.sagepay.sagepay.connect_from_localhost' => get_payment_setting('mode', SAGEPAY_PAYMENT_METHOD_NAME) == 0,
                'plugins.sagepay.sagepay.apiDomain' => get_payment_setting('mode', SAGEPAY_PAYMENT_METHOD_NAME) == 0 ? 'https://sandbox.sagepay.com' : 'https://securepay.sagepay.com',
            ]);
        }
    }
}
