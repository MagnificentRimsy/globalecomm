<section class="section--homepage" style="padding-top: 30px;">
    <div class="container">
        @if (clean($title))
            <div class="section__header">
                <h3>{!! clean($title) !!}</h3>
            </div>
        @endif
        <div class="section__content">
            @if ($products->count() > 0)
                <div class="row">
                    @foreach($products as $product)
                        <div class="col-md-4 col-6">
                            {!! Theme::partial('product-item', compact('product')) !!}
                        </div>
                    @endforeach
                </div>
                <div class="shop__pagination">
                    {!! $products->withQueryString()->links() !!}
                </div>
            @endif
        </div>
    </div>
</section>
