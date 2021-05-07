<section class="section--homepage home-products">
    <div class="container">
        <div class="section__header">
            <h3>{!! clean($title) !!}</h3>
            <p>{!! clean($description) !!}</p>
        </div>
        <div class="section__content">
            <featured-products-component url="{{ route('public.ajax.trending-products', ['limit' => $limit]) }}"></featured-products-component>
        </div>
    </div>
</section>
