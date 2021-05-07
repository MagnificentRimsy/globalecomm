<section class="section--homepage">
    <div class="container">
        <div class="section__header">
            <h3>{!! clean($title) !!}</h3>
        </div>
        <div class="section__content">
            <featured-brands-component  url="{{ route('public.ajax.featured-brands') }}"></featured-brands-component>
        </div>
    </div>
</section>
