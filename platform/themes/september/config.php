<?php

use Botble\Theme\Theme;

return [

    /*
    |--------------------------------------------------------------------------
    | Inherit from another theme
    |--------------------------------------------------------------------------
    |
    | Set up inherit from another if the file is not exists,
    | this is work with "layouts", "partials" and "views"
    |
    | [Notice] assets cannot inherit.
    |
    */

    'inherit' => null, //default

    /*
    |--------------------------------------------------------------------------
    | Listener from events
    |--------------------------------------------------------------------------
    |
    | You can hook a theme when event fired on activities
    | this is cool feature to set up a title, meta, default styles and scripts.
    |
    | [Notice] these event can be override by package config.
    |
    */

    'events' => [

        // Listen on event before render a theme,
        // this event should call to assign some assets,
        // breadcrumb template.
        'beforeRenderTheme' => function (Theme $theme)
        {
            // You may use this event to set up your assets.
            $theme->asset()->usePath()->add('font-awesome', 'plugins/font-awesome/css/font-awesome.min.css');
            $theme->asset()->usePath()->add('feather-font', 'fonts/feather-font/css/iconfont.css');
            $theme->asset()->usePath()->add('bootstrap-css', 'plugins/bootstrap/css/bootstrap.min.css');
            $theme->asset()->usePath()->add('slick-css', 'plugins/slick/slick.css');
            $theme->asset()->usePath()->add('jquery-bar-rating', 'plugins/jquery-bar-rating/themes/fontawesome-stars.css');
            $theme->asset()->usePath()->add('nouislider-css', 'plugins/nouislider/nouislider.min.css');
            $theme->asset()->usePath()->add('owl.carousel', 'plugins/owl-carousel/css/owl.carousel.min.css');
            $theme->asset()->usePath()->add('owl.theme', 'plugins/owl-carousel/css/owl.theme.css');
            $theme->asset()->usePath()->add('owl.theme.default', 'plugins/owl-carousel/css/owl.theme.default.min.css');
            $theme->asset()->usePath()->add('style', 'css/style.css', [], [], '1.0.15');

            if (BaseHelper::siteLanguageDirection() == 'rtl') {
                $theme->asset()->usePath()->add('rtl-style', 'css/rtl-style.css', [], [], '1.0.15');
            }

            $theme->asset()->container('header')->usePath()->add('jquery', 'plugins/jquery.min.js');
            $theme->asset()->container('footer')->usePath()->add('popper', 'plugins/popper.min.js');
            $theme->asset()->container('footer')->usePath()->add('bootstrap-js', 'plugins/bootstrap/js/bootstrap.min.js');
            $theme->asset()->container('footer')->usePath()->add('slick-js', 'plugins/slick/slick.min.js');
            $theme->asset()->container('footer')->usePath()->add('jquery-bar-rating-js', 'plugins/jquery-bar-rating/jquery.barrating.min.js');
            $theme->asset()->container('footer')->usePath()->add('nouislider-js', 'plugins/nouislider/nouislider.min.js');
            $theme->asset()->container('footer')->usePath()->add('equal-height-js', 'plugins/jquery.matchHeight-min.js');
            $theme->asset()->container('footer')->usePath()->add('carousel-js', 'plugins/owl-carousel/js/owl.carousel.min.js', ['jquery']);
            $theme->asset()->container('footer')->usePath()->add('script', 'js/script.js', [], [], '1.0.15');
            $theme->asset()->container('footer')->usePath()->add('backend-js', 'js/backend.js', [], [], '1.0.15');
            $theme->asset()->container('footer')->usePath()->add('components-js', 'js/components.js', [], [], '1.0.15');

            if (function_exists('shortcode')) {
                $theme->composer(['index', 'page', 'post', 'ecommerce.product'], function (\Botble\Shortcode\View\View $view) {
                    $view->withShortcodes();
                });
            }
        },
    ]
];
