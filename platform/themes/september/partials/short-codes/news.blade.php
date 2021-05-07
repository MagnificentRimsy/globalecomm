<section class="section--homepage home-blog">
    <div class="container">
        <div class="section__header">
            <h3>{!! clean($title) !!}</h3>
            <p>{!! clean($description) !!}</p>
        </div>
        <div class="section__content">
            <news-component url="{{ route('public.ajax.posts') }}"></news-component>
        </div>
    </div>
</section>
