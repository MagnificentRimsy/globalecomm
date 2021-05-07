@php
    $brands = get_all_brands(['status' => \Botble\Base\Enums\BaseStatusEnum::PUBLISHED], ['slugable'], ['products']);
    $categories = get_product_categories(['status' => \Botble\Base\Enums\BaseStatusEnum::PUBLISHED], ['slugable'], ['products'], true);
    $tags = app(\Botble\Ecommerce\Repositories\Interfaces\ProductTagInterface::class)->allBy(['status' => \Botble\Base\Enums\BaseStatusEnum::PUBLISHED], ['slugable']);
@endphp

<aside class="widget widget--shop">
    <h4 class="widget__title">{{ __('Product Categories') }}</h4>
    <div class="widget__content">
        <ul class="widget__links list--plus">
            <li @if (URL::current() == route('public.products')) class="active" @endif><a href="{{ route('public.products') }}">{{ __('All Products') }}</a></li>
            @foreach($categories as $category)
                <li @if (URL::current() == $category->url) class="active" @endif><a href="{{ $category->url }}">{{ $category->name }} ({{ $category->products_count }})</a></li>
            @endforeach
        </ul>
    </div>
</aside>
@if (count($brands) > 0)
    <aside class="widget widget--shop">
        <h4 class="widget__title">{{ __('Brands') }}</h4>
        <div class="widget__content">
            <ul class="widget__links list--plus">
                @foreach($brands as $brand)
                    <li @if (URL::current() == $brand->url) class="active" @endif><a href="{{ $brand->url }}">{{ $brand->name }} ({{ $brand->products_count }})</a></li>
                @endforeach
            </ul>
        </div>
    </aside>
@endif
<aside class="widget widget--shop widget--tags">
    <h4 class="widget__title">{{ __('Product Tags') }}</h4>
    <div class="widget__content">
        <ul class="list--tags">
            @foreach($tags as $tag)
                <li @if (URL::current() == $tag->url) class="active" @endif><a href="{{ $tag->url }}">{{ $tag->name }}</a></li>
            @endforeach
        </ul>
    </div>
</aside>
<aside class="widget widget--shop">
    <h4 class="widget__title">{{ __('By Price') }}</h4>
    <div class="widget__content nonlinear-wrapper">
        <div class="nonlinear" data-min="0" data-max="{{ theme_option('max_filter_price', 100000) }}"></div>
        <div class="ps-slider__meta">
        <div data-current-exchange-rate="{{ get_current_exchange_rate() }}"></div>
            <input class="product-filter-item product-filter-item-price-0" name="min_price" value="{{ request()->input('min_price', 0) }}" type="hidden">
            <input class="product-filter-item product-filter-item-price-1" name="max_price" value="{{ request()->input('max_price', theme_option('max_filter_price', 100000)) }}" type="hidden">
            <span class="ps-slider__value">
                <span class="ps-slider__min"></span> {{ get_application_currency()->title }}</span> - <span class="ps-slider__value"><span class="ps-slider__max"></span> {{ get_application_currency()->title }}
            </span>
        </div>
    </div>

    {!! render_product_swatches_filter([
        'view' => Theme::getThemeNamespace() . '::views.ecommerce.attributes.attributes-filter-renderer'
    ]) !!}
</aside>
