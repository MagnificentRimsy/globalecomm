@php
    SeoHelper::setTitle(__('404 - Not found'));
    Theme::fire('beforeRenderTheme', app(\Botble\Theme\Contracts\Theme::class));
@endphp

{!! Theme::partial('header') !!}

<main class="page--inner error-inner">
    <div class="container">
        <h1>{{ SeoHelper::getTitle() }}</h1>
        <h4>{{ __('This may have occurred because of several reasons') }}</h4>
        <ul>
            <li>{{ __('The page you requested does not exist.') }}</li>
            <li>{{ __('The link you clicked is no longer.') }}</li>
            <li>{{ __('The page may have moved to a new location.') }}</li>
            <li>{{ __('An error may have occurred.') }}</li>
            <li>{{ __('You are not authorized to view the requested resource.') }}</li>
        </ul>
        <p>{!! clean(__('Please try again in a few minutes, or alternatively return to the homepage by <a href=":link">clicking here</a>.', ['link' => url('/')])) !!}</p>
    </div>
</main>

{!! Theme::partial('footer') !!}
