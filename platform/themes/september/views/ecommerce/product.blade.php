@php
    $originalProduct = $product;
    $selectedAttrs = [];
    $productImages = $product->images;
    if ($product->is_variation) {
        $product = get_parent_product($product->id);
        $selectedAttrs = app(\Botble\Ecommerce\Repositories\Interfaces\ProductVariationInterface::class)
            ->getAttributeIdsOfChildrenProduct($originalProduct->id);
        if (count($productImages) == 0) {
            $productImages = $product->images;
        }
    } else {
        $selectedAttrs = $product->defaultVariation->productAttributes->pluck('id')->all();
    }

    if (EcommerceHelper::isReviewEnabled()) {
        $ratingAvg = get_average_star_of_product($originalProduct->id);
        $countRating = get_count_reviewed_of_product($originalProduct->id);
    }

@endphp

@php
    Theme::layout('full-width')
@endphp

<main class="page--inner page--product--detail">
    <div class="container">
        <article class="product--detail">
            <div class="product__header">
                <div class="product__thumbnail">
                    <figure>
                        <div class="wrapper">
                            <div class="product__gallery" data-arrow="true">
                                @foreach ($productImages as $img)
                                    <div class="item">
                                        <img src="{{ RvMedia::getImageUrl($img) }}" alt="{{ $originalProduct->name }}" />
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </figure>
                    <div class="product__variants product__thumbs" data-vertical="true" data-item="5" data-md="3" data-sm="3" data-arrow="false">
                        @foreach ($productImages as $thumb)
                            <div class="item">
                                <img src="{{ RvMedia::getImageUrl($thumb, 'thumb') }}" alt="{{ $originalProduct->name }}" />
                            </div>
                        @endforeach
                    </div>
                </div>
                <div class="product__info">
                    <div class="product__info-header">
                        <h2 class="product__title">{{ $product->name }}</h2> (<span id="is-out-of-stock">@if (!$originalProduct->isOutOfStock())<span class="text-success">{{ __('In stock') }}</span>@else<span class="text-danger">{{ __('Out of stock') }}</span>@endif</span>)
                    </div>
                    <div>
                        <div>
                            @if ($originalProduct->sku)
                                {{ __('SKU') }}: <span id="product-sku" class="sku" itemprop="sku">{{ $originalProduct->sku }}</span>
                            @endif

                            @if (EcommerceHelper::isReviewEnabled())
                                @if ($countRating > 0)
                                    @if ($originalProduct->sku) - @endif
                                    <div class="rating_wrap d-inline-block">
                                        <div class="rating">
                                            <div class="product_rate" style="width: {{ $ratingAvg * 20 }}%"></div>
                                        </div>
                                        <span class="rating_num">({{ $countRating }})</span>
                                    </div>
                                @endif
                            @endif
                        </div>
                    </div>

                    <div class="product__price @if ($product->front_sale_price !== $product->price) sale @endif">
                        <p>
                            <span class="product-sale-price-text">{{ format_price($product->front_sale_price) }}</span>
                            <small><del class="product-price-text" @if ($product->front_sale_price == $product->price) style="display: none" @endif>{{ format_price($product->price) }}</del></small>
                        </p>
                        <p>
                            <a class="product__add-wishlist add-to-wishlist-button" href="{{ route('public.wishlist.add', $product->id) }}" data-add-text="{{ __('Add to wishlist') }}" data-added-text="{{ __('Added to wishlist') }}"><i class="fa fa-heart-o"></i>
                                <span>{{ __('Add to wishlist') }}</span>
                            </a>
                        </p>
                    </div>
                    <div class="product__desc">
                        <p>{!! clean($product->description) !!}</p>
                    </div>
                    <div class="product__shopping">
                        <div class="row">
                            @if ($product->variations()->count() > 0)
                                <div class="col-sm-12 col-12">
                                    {!! render_product_swatches($product, [
                                        'selected' => $selectedAttrs,
                                        'view'     => Theme::getThemeNamespace() . '::views.ecommerce.attributes.swatches-renderer'
                                    ]) !!}
                                </div>
                            @endif
                        </div>
                        @if (EcommerceHelper::isCartEnabled())
                            <form class="single-variation-wrap add-to-cart-form" method="POST" action="{{ route('public.cart.add-to-cart') }}">
                                @csrf
                                {!! apply_filters(ECOMMERCE_PRODUCT_DETAIL_EXTRA_HTML, null) !!}
                                <input type="hidden" name="id" class="hidden-product-id" value="{{ ($originalProduct->is_variation || !$originalProduct->defaultVariation->product_id) ? $originalProduct->id : $originalProduct->defaultVariation->product_id }}"/>
                                <div class="form-group product__attribute product__qty">
                                    <label for="qty-input">{{ __('Qty') }}</label>
                                    <div class="form-group__content">
                                        <div class="form-group--number">
                                            <button type="button" class="up"></button>
                                            <input class="form-control qty-input" name="qty" type="number" value="1" id="qty-input">
                                            <button type="button" class="down"></button>
                                        </div>

                                        <div class="float-right number-items-available" style="display: none; line-height: 45px;"></div>
                                    </div>
                                </div>
                                <button type="submit" @if ($originalProduct->isOutOfStock()) disabled @endif class="btn--custom btn--outline btn--rounded btn-add-cart @if (!EcommerceHelper::isQuickBuyButtonEnabled()) btn--fullwidth @endif @if ($originalProduct->isOutOfStock()) btn-disabled @endif">
                                    {{ __('Add to cart') }}
                                </button>
                                @if (EcommerceHelper::isQuickBuyButtonEnabled())
                                    &nbsp;
                                    <button type="submit" name="checkout" @if ($originalProduct->isOutOfStock()) disabled @endif class="btn--custom btn--rounded btn-add-cart @if ($originalProduct->isOutOfStock()) btn-disabled @endif">
                                        {{ __('Quick Buy') }}
                                    </button>
                                @endif
                                <div class="success-message text-success" style="display: none;">
                                    <span></span>
                                </div>
                                <div class="error-message text-danger" style="display: none;">
                                    <span></span>
                                </div>
                            </form>
                        @endif
                    </div>

                    @if (!$product->tags->isEmpty())
                        <figure class="product__tags">
                            <figcaption>{{ __('Tags') }}:</figcaption>
                            @foreach ($product->tags as $tag)
                                <a href="{{ $tag->url }}">
                                    {{ $tag->name }}
                                </a>
                            @endforeach
                        </figure>
                    @endif
                    <figure class="product__sharing">
                        <figcaption>{{ __('Share') }}:</figcaption>
                        <ul class="list--social">
                            <li><a href="https://www.facebook.com/sharer/sharer.php?u={{ urlencode(url()->current()) }}&title={{ rawurldecode($product->description) }}" target="_blank" title="{{ __('Share on Facebook') }}"><i class="feather icon icon-facebook"></i></a></li>
                            <li><a href="https://twitter.com/intent/tweet?url={{ urlencode(url()->current()) }}&text={{ rawurldecode($product->description) }}" target="_blank" title="{{ __('Share on Twitter') }}"><i class="feather icon icon-twitter"></i></a></li>
                            <li><a href="https://www.linkedin.com/shareArticle?mini=true&url={{ urlencode(url()->current()) }}&summary={{ rawurldecode($product->description) }}&source=Linkedin" title="{{ __('Share on Linkedin') }}" target="_blank"><i class="feather icon icon-linkedin"></i></a></li>
                        </ul>
                    </figure>
                </div>
            </div>
            <div class="product__content tab-root">
                <ul class="tab-list">
                    <li class="active"><a href="#tab-description">{{ __('Description') }}</a></li>
                    @if (EcommerceHelper::isReviewEnabled())
                        <li><a href="#tab-reviews">{{ __('Reviews') }}({{ $countRating }})</a></li>
                    @endif
                </ul>
                <div class="tabs">
                    <div class="tab active" id="tab-description">
                        <div class="document">
                            {!! clean($product->content, 'youtube') !!}
                        </div>
                    </div>
                    @if (EcommerceHelper::isReviewEnabled())
                        <div class="tab" id="tab-reviews">
                        <div class="block--product-reviews">
                                <div class="block__header">
                                    <h4>{{ __('Reviews for ":product"', ['product' => $product->name]) }}</h4>
                                    @if ($countRating > 0)
                                        <div class="rating_wrap">
                                            <div class="rating">
                                                <div class="product_rate" style="width: {{ $ratingAvg * 20 }}%"></div>
                                            </div>
                                            <span class="rating_num"> {{ $ratingAvg }} ({{ $countRating }} {{ __('reviews') }})</span>
                                        </div>
                                    @endif
                                </div>
                                <product-reviews-component url="{{ route('public.ajax.product-reviews', $product->id) }}"></product-reviews-component>
                        </div>

                        @if (!auth('customer')->check() || !check_if_reviewed_product($product->id))
                            {!! Form::open(['route' => 'public.reviews.create', 'method' => 'post', 'class' => 'form--review-product']) !!}
                                <h3>{{ __('Review') }}:</h3>
                                @if (!auth('customer')->check())
                                    <p class="text-danger">{{ __('Please') }} <a href="{{ route('customer.login') }}">{{ __('login') }}</a> {{ __('to write review!') }}</p>
                                @endif
                                <div class="form__content">
                                    <input type="hidden" name="product_id" value="{{ $originalProduct->id }}">
                                    <div class="form__rating">
                                        <label for="select-star">{{ __('Add your rate') }}:</label>
                                        <select class="rating" name="star" id="select-star" data-read-only="false" @if (!auth('customer')->check()) disabled @endif>
                                            <option value="0">0</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="txt-comment">{{ __('Review') }} <sup>*</sup></label>
                                        <textarea class="form-control" name="comment" id="txt-comment" rows="6" placeholder="{{ __('Write your review') }}" @if (!auth('customer')->check()) disabled @endif></textarea>
                                    </div>
                                    <div class="success-message text-success" style="display: none;">
                                        <span></span>
                                    </div>
                                    <div class="error-message text-danger" style="display: none;">
                                        <span></span>
                                    </div>
                                    <div class="form__submit text-right">
                                        <button type="submit" class="btn--custom btn--rounded btn--outline @if (!auth('customer')->check()) btn-disabled @endif" @if (!auth('customer')->check()) disabled @endif>{{ __('Submit') }}</button>
                                    </div>
                                </div>
                           {!! Form::close() !!}
                        @endif
                    </div>
                    @endif
                </div>
            </div>
        </article>
        @if (theme_option('facebook_comment_enabled_in_product', 'yes') == 'yes')
            <br />
            {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, Theme::partial('comments')) !!}
        @endif

        @php
            $crossSellProducts = array_slice(get_cross_sale_products($originalProduct), 0, 4);
        @endphp
        @if (!empty($crossSellProducts))
            <section class="section--related-posts">
                <div class="section__header">
                    <h3>{{ __('Customers who bought this item also bought') }}:</h3>
                </div>
                <div class="section__content">
                    <div class="row">
                        @foreach ($crossSellProducts as $crossId)
                            <div class="col-lg-3 col-md-4 col-6">
                                {!! Theme::partial('product-item', ['product' => get_product_by_id($crossId)]) !!}
                            </div>
                        @endforeach
                    </div>
                </div>
            </section>
        @endif

        <section class="section--related-posts">
            <div class="section__header">
                <h3>{{ __('Related Products') }}:</h3>
            </div>
            <related-products-component url="{{ route('public.ajax.related-products', $product->id) }}?limit=4"></related-products-component>
        </section>
    </div>
</main>
