@php
    Theme::layout('full-width')
@endphp

<main class="page--shop">
    <div class="page__content">
        <div class="container">
            <section class="shop shop--sidebar">
                <div class="container">
                    <div class="section__header">
                        <h3 class="text-center">{{ __('Search result for ":query"', ['query' => request()->query('q')]) }}</h3>
                    </div>
                    <div class="shop__header">
                        @include(Theme::getThemeNamespace() . '::views/ecommerce/includes/sort')
                    </div>
                    <div class="shop__content">
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
                                <p class="text-center">{{ __('No products!') }}</p>
                            @endif
                        </div>
                    </div>
            </section>
        </div>
    </div>
</main>
