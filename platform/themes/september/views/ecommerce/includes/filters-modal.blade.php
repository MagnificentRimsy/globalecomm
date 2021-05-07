<aside class="panel--sidebar" id="filter-product">
    <div class="panel__header">
        <h4>{{ __('Filter Products') }}</h4><span class="panel__close"></span>
    </div>
    <div class="panel__content panel__scroll">
        @include(Theme::getThemeNamespace() . '::views/ecommerce/includes/filters')
    </div>
</aside>
