@php $crossSellProducts = []; @endphp

<section class="section section--shopping-cart">
    <div class="section__header">
        <h3>{{ __('Shopping Cart') }}</h3>
    </div>
    <div class="section__content">
        @if (Cart::instance('cart')->count() > 0)
            @php
                $productIds = Cart::instance('cart')->content()->pluck('id')->toArray();

                if ($productIds) {
                    $products = get_products([
                        'condition' => [
                            ['ec_products.id', 'IN', $productIds],
                        ],
                    ]);
                }
            @endphp

            @if (session()->has('success_msg'))
                <div class="alert alert-success">
                    <span>{{ session('success_msg') }}</span>
                </div>
                <br>
            @endif

            @if (session()->has('error_msg'))
                <div class="alert alert-warning">
                    <span>{{ session('error_msg') }}</span>
                </div>
                <br>
            @endif

            @if (isset($errors) && count($errors->all()) > 0)
                <div class="alert alert-warning">
                    @foreach ($errors->all() as $error)
                        <p>{{ $error }}</p>
                    @endforeach
                </div>
                <br>
            @endif

            <form class="form--shopping-cart" method="post" action="{{ route('public.cart.update') }}">
                @csrf
                <div class="form__section">
                        <div class="table-responsive">
                            <table class="table table--cart">
                                <thead>
                                <tr>
                                    <th>{{ __('Image') }}</th>
                                    <th>{{ __('Name') }}</th>
                                    <th>{{ __('Price') }}</th>
                                    <th>{{ __('Quantity') }}</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                    @if (isset($products) && $products)
                                        @foreach(Cart::instance('cart')->content() as $key => $cartItem)
                                            @php
                                                $product = $products->where('id', $cartItem->id)->first();
                                                if ($product) {
                                                    $crossSellProducts = array_unique(array_merge($crossSellProducts, get_cross_sale_products($product->original_product)));
                                                }
                                            @endphp

                                            @if (!empty($product))
                                                <tr>
                                                    <td>
                                                        <div class="product--cart">
                                                            <div class="product__thumbnail">
                                                                <a href="{{ $product->original_product->url }}" class="product__overlay">
                                                                    <img src="{{ $cartItem->options['image'] }}" alt="{{ $product->name }}" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="product__content">
                                                            <a href="{{ $product->original_product->url }}" title="{{ $product->name }}">{{ $product->name }}</a>
                                                            <p style="margin-bottom: 0;">
                                                                <small>{{ $cartItem->options['attributes'] ?? '' }}</small>
                                                            </p>
                                                            @if (!empty($cartItem->options['extras']) && is_array($cartItem->options['extras']))
                                                                @foreach($cartItem->options['extras'] as $option)
                                                                    @if (!empty($option['key']) && !empty($option['value']))
                                                                        <p style="margin-bottom: 0;"><small>{{ $option['key'] }}: <strong> {{ $option['value'] }}</strong></small></p>
                                                                    @endif
                                                                @endforeach
                                                            @endif
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <span class="product-price-amount amount">
                                                            <span class="currency-sign">
                                                                <strong>{{ format_price($cartItem->price) }}</strong>
                                                            </span>
                                                            <input type="hidden" name="items[{{ $key }}][rowId]" value="{{ $cartItem->rowId }}">
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <div class="form-group--number product__qty">
                                                            <button type="button" class="up"></button>
                                                            <input class="form-control qty-input" type="number" value="{{ $cartItem->qty }}" name="items[{{ $key }}][values][qty]">
                                                            <button type="button" class="down"></button>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <a href="{{ route('public.cart.remove', $cartItem->rowId) }}" class="btn--remove remove-cart-button"><i class="feather icon icon-trash-2"></i></a>
                                                    </td>
                                                </tr>
                                            @endif
                                        @endforeach
                                    @endif
                                    <tr class="sub-total">
                                        <td colspan="4">
                                            <h5>{{ __('Sub total') }}</h5>
                                        </td>
                                        <td>
                                            <h5>{{ format_price(Cart::instance('cart')->rawSubTotal()) }}</h5>
                                        </td>
                                    </tr>
                                    @if ($promotionDiscountAmount)
                                        <tr class="sub-total">
                                            <td colspan="4">
                                                <h5>{{ __('Discount promotion') }}</h5>
                                            </td>
                                            <td>
                                                <h5 class="promotion-discount-amount-text">{{ format_price($promotionDiscountAmount) }}</h5>
                                            </td>
                                        </tr>
                                    @endif
                                    @if (EcommerceHelper::isTaxEnabled())
                                        <tr class="sub-total">
                                            <td colspan="4">
                                                <h5>{{ __('Tax') }}</h5>
                                            </td>
                                            <td>
                                                <h5 class="promotion-discount-amount-text">{{ format_price(Cart::instance('cart')->rawTax()) }}</h5>
                                            </td>
                                        </tr>
                                    @endif
                                    <tr class="total">
                                        <td colspan="4"><strong>{{ __('Total') }}</strong> <br /> <span>({{ __('Shipping fees not included') }})</span></td>
                                        <td class="total__price product-subtotal">
                                            <span class="amount">{{ format_price(Cart::instance('cart')->rawTotal() - $promotionDiscountAmount - $couponDiscountAmount) }}</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                <div class="form__submit text-right">
                    <button type="submit" class="btn--custom btn--outline btn--rounded">{{ __('Update cart') }}</button>&nbsp;&nbsp;&nbsp;
                    <button type="submit" class="btn--custom btn--outline btn--rounded" name="checkout">{{ __('Checkout') }}</button>
                </div>
            </form>

            @php
                $crossSellProducts = array_slice($crossSellProducts, 0, 4);
            @endphp
            @if (!empty($crossSellProducts))
                <section class="section--related-posts" style="border: none; padding-top: 60px;">
                    <div class="section__header text-left" style="padding-bottom: 0">
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
        @else
            <p class="text-center">{{ __('Your cart is empty!') }}</p>
        @endif
    </div>
</section>
