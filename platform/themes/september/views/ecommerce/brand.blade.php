@php
    Theme::layout('full-width');
@endphp

<main class="page--shop">
    <div class="page__hero bg--cover" data-background="{{ theme_option('product_page_banner_image') ? RvMedia::getImageUrl(theme_option('product_page_banner_image')) : Theme::asset()->url('img/bg/shop.jpg') }}">
        <h1>{{ theme_option('product_page_banner_title') ? theme_option('product_page_banner_title') : __('Enjoy Shopping with us') }}</h1>
    </div>
    <div class="page__content">
        <div class="container">
            <div class="shop shop--sidebar">
                <div class="container">
                    <form action="{{ URL::current() }}" method="GET">
                        <div class="shop__header">
                            @include(Theme::getThemeNamespace() . '::views/ecommerce/includes/sort')
                            <a class="panel-trigger btn--custom btn--rounded btn--outline" href="#filter-product">{{ __('Filter Products') }}</a>
                        </div>
                        <div class="shop__content">
                            <div class="shop__left">
                                @include(Theme::getThemeNamespace() . '::views/ecommerce/includes/filters')
                            </div>
                            <div class="shop__right">
                                <div class="shop__products">
                                    @if ($products->count() > 0)
                                        <div class="row">
                                            @foreach($products as $product)
                                                <div class="col-md-4 col-sm-6">
                                                    {!! Theme::partial('product-item', compact('product')) !!}
                                                </div>
                                            @endforeach
                                        </div>
                                        <div class="shop__pagination">
                                            {!! $products->withQueryString()->links() !!}
                                        </div>
                                    @else
                                        <br>
                                        <p class="text-center">{{ __('No products!') }}</p>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </form>
                    <form action="{{ URL::current() }}" method="GET">
                        @include(Theme::getThemeNamespace() . '::views/ecommerce/includes/filters-modal')
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

