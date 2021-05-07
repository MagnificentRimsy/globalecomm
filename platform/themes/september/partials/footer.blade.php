        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-12">
                        {!! dynamic_sidebar('footer_sidebar') !!}
                    </div>
                    @if (theme_option('address') || theme_option('hotline'))
                        <div class="col-md-4 col-sm-6 col-12">
                            <aside class="widget widget--footer">
                                <h3 class="widget__title">{{ theme_option('site_title') }}</h3>
                                <div class="widget__content">
                                    @if (theme_option('address'))
                                        <p><strong>{{ __('Address') }}: </strong>{{ theme_option('address') }}</p>
                                    @endif
                                    @if (theme_option('hotline'))
                                        <p><strong>{{ __('Hotline') }}: </strong>{{ theme_option('hotline') }}</p>
                                    @endif
                                    @if (theme_option('email'))
                                        <p><strong>{{ __('Email') }}: </strong>{{ theme_option('email') }}</p>
                                    @endif
                                </div>
                            </aside>
                        </div>
                    @endif
                    <div class="col-md-4 col-sm-6 col-12">
                        @if (is_plugin_active('newsletter'))
                            <aside class="widget widget--footer">
                                <h3 class="widget__title">{{ __('Subscribe & Receive 10% off your first order') }}</h3>
                                <form class="generic-form" method="POST" action="{{ route('public.newsletter.subscribe') }}">
                                    @csrf
                                    <div class="form--subscribe">
                                        <input class="form-control" type="email" name="email" placeholder="{{ __('Please enter your email address') }}">
                                        <button type="submit">{{ __('Go') }}</button>
                                    </div>
                                    @if (setting('enable_captcha') && is_plugin_active('captcha'))
                                        {!! Captcha::display() !!}
                                    @endif
                                    <br>
                                    <div class="success-message text-success" style="display: none;">
                                        <span></span>
                                    </div>
                                    <div class="error-message text-danger" style="display: none;">
                                        <span></span>
                                    </div>
                                </form>
                            </aside>
                        @endif
                        <aside class="widget widget--footer">
                            <h3 class="widget__title">{{ __('Connect with us') }}</h3>
                            <ul class="list--social">
                                @if (theme_option('facebook'))
                                    <li><a href="{{ theme_option('facebook') }}"><i class="fa fa-facebook"></i></a></li>
                                @endif
                                @if (theme_option('twitter'))
                                    <li><a href="{{ theme_option('twitter') }}"><i class="fa fa-twitter"></i></a></li>
                                @endif
                                @if (theme_option('instagram'))
                                    <li><a href="{{ theme_option('instagram') }}"><i class="fa fa-instagram"></i></a></li>
                                @endif
                                @if (theme_option('pinterest'))
                                    <li><a href="{{ theme_option('pinterest') }}"><i class="fa fa-pinterest"></i></a></li>
                                @endif
                                @if (theme_option('linkedin'))
                                    <li><a href="{{ theme_option('linkedin') }}"><i class="fa fa-linkedin"></i></a></li>
                                @endif
                                @if (theme_option('youtube'))
                                    <li><a href="{{ theme_option('youtube') }}"><i class="fa fa-youtube"></i></a></li>
                                @endif
                            </ul>
                        </aside>
                    </div>
                </div>
            </div>
        </footer>
        <div class="site-mask"></div>
        @if (is_plugin_active('ecommerce'))
            <div class="panel--search" id="site-search"><a class="panel__close" href="#"><i class="feather icon icon-x"></i></a>
                <div class="container">
                    <form class="form--primary-search" action="{{ route('public.products') }}" method="GET">
                        <input class="form-control" name="q" type="text" value="{{ request()->query('q') }}" placeholder="{{ __('Search for') }}...">
                        <button><i class="fa fa-search"></i></button>
                    </form>
                </div>
            </div>
        @endif
        @if (is_plugin_active('ecommerce') && EcommerceHelper::isCartEnabled())
            <aside class="panel--sidebar" id="panel-cart">
                <div class="panel__header">
                    <h4>{{ __('Shopping Cart') }}</h4><span class="panel__close"></span>
                </div>
                <div class="panel__content">
                    {!! Theme::partial('cart-panel') !!}
                </div>
            </aside>
        @endif
        <aside class="panel--sidebar" id="panel-menu">
            <div class="panel__header">
                <h4>Menu</h4><span class="panel__close"></span>
            </div>
            <div class="panel__content">
                {!!
                    Menu::renderMenuLocation('main-menu', [
                        'options' => ['class' => 'menu menu--mobile'],
                        'view'    => 'main-menu',
                    ])
                !!}
            </div>
        </aside>

        @if (is_plugin_active('ecommerce') && EcommerceHelper::isCartEnabled())
            <div id="remove-item-modal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">{{ __('Warning') }}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>{{ __('Are you sure you want to remove this product from cart?') }}</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn--custom btn--outline btn--rounded btn--sm" data-dismiss="modal">{{ __('Cancel') }}</button>
                            <button type="button" class="btn--custom btn--rounded confirm-remove-item-cart btn--sm">{{ __('Yes, remove it!') }}</button>
                        </div>
                    </div>
                </div>
            </div>
        @endif

        <script>
            window.siteUrl = "{{ url('') }}";
        </script>

        {!! Theme::footer() !!}

        @if (theme_option('facebook_comment_enabled_in_post', 'yes') == 'yes' || theme_option('facebook_comment_enabled_in_product', 'yes') == 'yes' || (theme_option('facebook_chat_enabled', 'yes') == 'yes' && theme_option('facebook_page_id')))
            <div id="fb-root"></div>
            <script>
                window.fbAsyncInit = function() {
                    FB.init({
                        xfbml            : true,
                        version          : 'v7.0'
                    });
                };

                (function(d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) return;
                    js = d.createElement(s); js.id = id;
                    js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));</script>

            @if (theme_option('facebook_chat_enabled', 'yes') == 'yes' && theme_option('facebook_page_id'))
                <div class="fb-customerchat"
                     attribution="install_email"
                     page_id="{{ theme_option('facebook_page_id') }}"
                     theme_color="{{ theme_option('primary_color', '#026e94') }}">
                </div>
            @endif
        @endif

        {!! Theme::place('footer') !!}
    </body>
</html>
