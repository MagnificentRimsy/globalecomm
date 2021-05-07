@php
    Theme::layout('blog')
@endphp

@if ($posts->count() > 0)
    @include(Theme::getThemeNamespace() . '::views.loop', compact('posts'))
@endif

