<section class="section--blog">
    <div class="section__header">
        <h1>{{ __('Search result for ') . ': "' . Request::input('q') . '"' }}</h1>
    </div>
    <div class="section__content">
        @if ($posts->count() > 0)
            @include(Theme::getThemeNamespace() . '::views.loop', compact('posts'))
        @else
            <p class="text-center">{{ __('There is no data to display!') }}</p>
        @endif
    </div>
</section>
