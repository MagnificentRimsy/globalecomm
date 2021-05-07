<div class="cart--mini">
    <div class="cart__items">
        @if (Cart::instance('cart')->count() > 0)
            @php
                $products = [];
                $productIds = Cart::instance('cart')->content()->pluck('id')->toArray();

                if ($productIds) {
                    $products = get_products([
                        'condition' => [
                            ['ec_products.id', 'IN', $productIds],
                        ],
                        'with' => ['slugable'],
                    ]);
                }
            @endphp
            @if (count($products))
                @foreach(Cart::instance('cart')->content() as $key => $cartItem)
                    @php
                        $product = $products->where('id', $cartItem->id)->first();
                    @endphp

                    @if (!empty($product))
                        <article class="product--on-cart">
                            <div class="product__thumbnail"><a href="{{ $product->original_product->url }}"><img src="{{ $cartItem->options['image'] }}" alt="{{ $product->name }}"></a></div>
                            <div class="product__content">
                                <a class="product__remove remove-cart-button" href="{{ route('public.cart.remove', $cartItem->rowId) }}">
                                    <i class="feather icon icon-x"></i>
                                </a>
                                <a href="{{ $product->original_product->url }}">
                                    {{ $product->name }}</a>
                                <p style="margin-bottom: 0;">
                                    <small style="font-weight: normal; font-size: 85%;">{{ $cartItem->options['attributes'] ?? '' }}</small>
                                </p>
                                @if (!empty($cartItem->options['extras']) && is_array($cartItem->options['extras']))
                                    @foreach($cartItem->options['extras'] as $option)
                                        @if (!empty($option['key']) && !empty($option['value']))
                                            <p style="margin-bottom: 0;"><small>{{ $option['key'] }}: <strong> {{ $option['value'] }}</strong></small></p>
                                        @endif
                                    @endforeach
                                @endif
                                <small>{{ $cartItem->qty }} x <span class="cart-price">{{ format_price($cartItem->price) }}</span></small>
                            </div>
                        </article>
                    @endif
                @endforeach
            @endif
        @else
            <p class="text-center">{{ __('Your cart is empty!') }}</p>
        @endif
    </div>
    @if (Cart::instance('cart')->count() > 0)
        <div class="cart__footer">
            <div class="cart__summary">
                @if (EcommerceHelper::isTaxEnabled())
                    <p>{{ __('Sub Total') }}:<span>{{ format_price(Cart::instance('cart')->rawSubTotal()) }}</span></p>
                    <p>{{ __('Tax') }}:<span>{{ format_price(Cart::instance('cart')->rawTax()) }}</span></p>
                    <p><strong>{{ __('Total') }}:</strong><span><strong>{{ format_price(Cart::instance('cart')->rawSubTotal() + Cart::instance('cart')->rawTax()) }}</strong></span></p>
                @else
                    <p><strong>{{ __('Sub Total') }}:</strong><span><strong>{{ format_price(Cart::instance('cart')->rawSubTotal()) }}</strong></span></p>
                @endif
            </div>
            @if (Cart::instance('cart')->rawTotal())
                <div class="cart__actions">
                    @if (session('tracked_start_checkout'))
                        <p><a class="btn--custom btn--rounded" href="{{ route('public.checkout.information', session('tracked_start_checkout')) }}">{{ __('Checkout') }} <i class="feather icon-arrow-right"></i></a></p>
                    @endif
                    <p><a class="btn--custom btn--outline btn--rounded" href="{{ route('public.cart') }}">{{ __('View cart') }} <i class="feather icon-arrow-right"></i></a></p>
                </div>
            @endif
        </div>
    @endif
</div>
