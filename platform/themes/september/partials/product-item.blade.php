@if ($product)
    <div class="product">
        <div class="product__wrapper">
            <div class="product__thumbnail">
                @if ($product->front_sale_price !== $product->price)
                    <div class="product__badges">
                        <span class="badge badge--sale">{{ get_sale_percentage($product->price, $product->front_sale_price) }}</span>
                    </div>
                @endif
                <a class="product__overlay" href="{{ $product->url }}"></a>
                <img src="{{ RvMedia::getImageUrl($product->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $product->url }}" />
                <a class="product__favorite js-add-to-wishlist-button" href="{{ route('public.wishlist.add', $product->id) }}">
                    <i class="fa fa-heart-o"></i>
                </a>
                <ul class="product__actions">
                    @if (EcommerceHelper::isCartEnabled())
                        <li><a class="add-to-cart-button" data-id="{{ $product->id }}" href="{{ route('public.cart.add-to-cart') }}">{{ __('Add to cart') }}</a></li>
                    @endif
                </ul>
                @if (count($product->variationAttributeSwatchesForProductList))
                    <ul class="product__variants color-swatch">
                        @foreach($product->variationAttributeSwatchesForProductList->unique('attribute_id') as $attribute)
                            @if ($attribute->display_layout == 'visual')
                                <li>
                                    <div class="custom-checkbox">
                                        <span style="{{ $attribute->image ? 'background-image: url(' . RvMedia::getImageUrl($attribute->image) . ');' : 'background-color: ' . $attribute->color . ';' }}; cursor: initial;"></span>
                                    </div>
                                </li>
                            @endif
                        @endforeach
                    </ul>
                @endif
            </div>
            <div class="product__content" data-mh="product-item">
                <a class="product__title" href="{{ $product->url }}">{{ $product->name }}</a>
                <p class="product__price @if ($product->front_sale_price !== $product->price) sale @endif">
                    <span>{{ format_price($product->front_sale_price) }}</span>
                    @if ($product->front_sale_price !== $product->price)
                        <del><span>{{ format_price($product->price) }}</span></del>
                    @endif
                </p>
                @if (EcommerceHelper::isReviewEnabled())
                    @php $countRating = get_count_reviewed_of_product($product->id) @endphp
                    @if ($countRating > 0)
                        <div class="rating_wrap">
                            <div class="rating">
                                <div class="product_rate" style="width: {{ get_average_star_of_product($product->id) * 20 }}%"></div>
                            </div>
                            <span class="rating_num">({{ $countRating }})</span>
                        </div>
                    @endif
                @endif
            </div>
        </div>
    </div>
@endif
