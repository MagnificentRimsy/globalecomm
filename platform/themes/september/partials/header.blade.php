<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=5, user-scalable=1" name="viewport"/>

        <meta name="csrf-token" content="{{ csrf_token() }}">

        <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700,900&display=swap" rel="stylesheet">

        <style>
            :root {
                --color-1st: {{ theme_option('primary_color', '#026e94') }};
                --color-2nd: {{ theme_option('secondary_color', '#2c1dff') }};
                --primary-font: '{{ theme_option('primary_font', 'Poppins') }}', sans-serif;
            }
        </style>

        {!! Theme::header() !!}
    </head>
    <body @if (BaseHelper::siteLanguageDirection() == 'rtl') dir="rtl" @endif>
        <div id="alert-container"></div>
        <header class="header header--mobile">
            <nav class="navigation--mobile">
                <div class="navigation__left">
                    @if (theme_option('logo'))
                        <a class="logo" href="{{ route('public.single') }}">
                            <img src="{{ RvMedia::getImageUrl(theme_option('logo')) }}" alt="{{ theme_option('site_title') }}" height="60">
                        </a>
                    @endif
                </div>
                <div class="navigation__right">
                    <div class="header__actions">
                        <a class="search-btn" href="#"><i class="feather icon icon-search"></i></a>
                        @if (is_plugin_active('ecommerce'))
                            <a href="{{ route('customer.login') }}"><i class="feather icon icon-user"></i></a>
                            <a class="btn-shopping-cart btn-wishlist" href="{{ route('public.wishlist') }}"><i class="feather icon icon-heart"></i>@if (auth('customer')->check())<span>{{ auth('customer')->user()->wishlist()->count() }}</span> @else <span>{{ Cart::instance('wishlist')->count() }}</span>@endif</a>
                            @if (EcommerceHelper::isCartEnabled())
                                <a class="btn-shopping-cart panel-trigger" href="#panel-cart">
                                    <i class="feather icon icon-shopping-cart"></i><span>{{ Cart::instance('cart')->count() }}</span>
                                </a>
                            @endif
                        @endif
                        <a class="panel-trigger" href="#panel-menu"><i class="feather icon icon-menu"></i></a></div>
                </div>
            </nav>
        </header>
        <header class="header">
            <div class="top-header d-none d-md-block">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="d-flex align-items-center justify-content-center justify-content-md-start">
                                <ul class="contact-detail text-center text-lg-left">
                                    @if (theme_option('hotline'))
                                        <li><i class="feather icon icon-phone"></i> <span>{{ theme_option('hotline') }}</span></li>
                                    @endif
                                    @if (theme_option('email'))
                                        <li><i class="feather icon icon-mail"></i> <a href="mailto:{{ theme_option('email') }}">{{ theme_option('email') }}</a></li>
                                    @endif
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex align-items-center justify-content-center justify-content-md-end">
                                @if (is_plugin_active('ecommerce'))
                                    @php $currencies = get_all_currencies(); @endphp
                                    @if (count($currencies) > 1)
                                        <div class="mr-5 choose-currency">
                                            <span>{{ __('Currency') }}: </span>
                                            @foreach ($currencies as $currency)
                                                <a href="{{ route('public.change-currency', $currency->title) }}" @if (get_application_currency_id() == $currency->id) class="active" @endif><span>{{ $currency->title }}</span></a>&nbsp;
                                            @endforeach
                                        </div>
                                    @endif
                                    <ul class="header_list">
                                        @if (!auth('customer')->check())
                                            <li><a href="{{ route('customer.login') }}"><i class="feather icon icon-user"></i> <span>{{ __('Login') }}</span></a></li>
                                        @else
                                            <li><a href="{{ route('customer.overview') }}"><i class="feather icon icon-user"></i> <span>{{ auth('customer')->user()->name }}</span></a></li>
                                            <li><a href="{{ route('customer.logout') }}"><i class="feather icon icon-lock"></i> <span>{{ __('Logout') }}</span></a></li>
                                        @endif
                                    </ul>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <nav class="navigation">
                <div class="container">
                    <div class="navigation__left">
                        @if (theme_option('logo'))
                            <a class="logo" href="{{ route('public.single') }}">
                                <img src="{{ RvMedia::getImageUrl(theme_option('logo')) }}" alt="{{ theme_option('site_title') }}" height="80">
                            </a>
                        @endif
                    </div>
                    <div class="navigation__center">
                        {!!
                            Menu::renderMenuLocation('main-menu', [
                                'options' => ['class' => 'menu'],
                                'view'    => 'main-menu',
                            ])
                        !!}
                    </div>
                    <div class="navigation__right">
                        <div class="header__actions">
                            <a class="search-btn" href="#"><i class="feather icon icon-search"></i></a>
                            @if (is_plugin_active('ecommerce'))
                                <a class="btn-shopping-cart btn-wishlist" href="{{ route('public.wishlist') }}"><i class="feather icon icon-heart"></i>@if (auth('customer')->check())<span>{{ auth('customer')->user()->wishlist()->count() }}</span>@else <span>{{ Cart::instance('wishlist')->count() }}</span>@endif</a>
                                @if (EcommerceHelper::isCartEnabled())
                                    <a class="btn-shopping-cart panel-trigger" href="#panel-cart"><i class="feather icon icon-shopping-cart"></i><span>{{ Cart::instance('cart')->count() }}</span></a>
                                @endif
                            @endif
                        </div>
                    </div>
                </div>
            </nav>
        </header>
