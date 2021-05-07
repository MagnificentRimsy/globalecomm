@php
Theme::layout('homepage')
@endphp

{!! do_shortcode('[simple-slider key="home-slider"][/simple-slider]') !!}
{!! do_shortcode('[featured-product-categories title="Top Categories" description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim Nullam nunc varius."][/featured-product-categories]') !!}
{!! do_shortcode('[product-collections title="A change of Season" description="Update your wardrobe with new seasonal trend"][/product-collections]') !!}
{!! do_shortcode('[featured-products title="Our Picks For You" description="Always find the best ways for you" limit="8"][/featured-products]') !!}
{!! do_shortcode('[trending-products title="Trending Products" description="Products on trending" limit="4"][/trending-products]') !!}
{!! do_shortcode('[featured-brands title="Our Brands"][/featured-brands]') !!}
{!! do_shortcode('[news title="Visit Our Blog" description="Our Blog updated the newest trend of the world regularly"][/news]') !!}
{!! do_shortcode('[our-features items=\'{"title": "FREE SHIPPING", "description": "Free shipping on all US order or order above $200", "icon": "feather icon icon-truck"}; {"title": "SUPPORT 24/7", "description": "Contact us 24 hours a day, 7 days a week", "icon": "feather icon icon-life-buoy"};{"title": "30 DAYS RETURN", "description": "Simply return it within 30 days for an exchange", "icon": "feather icon icon-refresh-ccw"};{"title": "100% PAYMENT SECURE", "description": "We ensure secure payment with PEV", "icon": "feather icon icon-shield"}\'][/our-features]') !!}
