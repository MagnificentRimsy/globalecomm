@if ($page->template != 'homepage')
    <section class="section--blog">
        <div class="section__header">
            <h1>{{ $page->name }}</h1>
        </div>
        <div class="section__content">
            {!! apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, clean($page->content, 'youtube'), $page) !!}
        </div>
    </section>
@else
    {!! apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, clean($page->content), $page) !!}
@endif
