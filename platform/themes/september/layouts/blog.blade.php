{!! Theme::partial('header') !!}

{!! Theme::partial('breadcrumbs') !!}
<div class="container">
    <section class="section--blog">
        <div class="section__header">
            <h1>{{ SeoHelper::getTitle() }}</h1>
        </div>
        <div class="section__content">
            {!! Theme::content() !!}
        </div>
    </section>
</div>

{!! Theme::partial('footer') !!}
