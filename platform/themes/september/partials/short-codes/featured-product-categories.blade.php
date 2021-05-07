<section class="section--homepage">
    <div class="container">
        <div class="section__header">
            <h3>{!! clean($title) !!}</h3>
            <p>{!! clean($description) !!}</p>
        </div>
        <div class="section__content row align-items-center">
            <featured-product-categories-component url="{{ route('public.ajax.featured-product-categories') }}"></featured-product-categories-component>
        </div>
    </div>
</section>
