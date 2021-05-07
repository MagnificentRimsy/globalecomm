<?php

Route::group(['namespace' => 'Theme\September\Http\Controllers', 'middleware' => 'web'], function () {
    Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {

        Route::get('ajax/cart', [
            'as'   => 'public.ajax.cart',
            'uses' => 'SeptemberController@ajaxCart',
        ]);

        Route::get('ajax/featured-products', 'SeptemberController@getFeaturedProducts')
            ->name('public.ajax.featured-products');

        Route::get('ajax/posts', 'SeptemberController@ajaxGetPosts')->name('public.ajax.posts');

        Route::get('ajax/featured-product-categories', 'SeptemberController@getFeaturedProductCategories')
            ->name('public.ajax.featured-product-categories');

        Route::get('ajax/featured-brands', 'SeptemberController@ajaxGetFeaturedBrands')
            ->name('public.ajax.featured-brands');

        Route::get('ajax/trending-products', 'SeptemberController@ajaxGetTrendingProducts')
            ->name('public.ajax.trending-products');

        Route::get('ajax/related-products/{id}', 'SeptemberController@ajaxGetRelatedProducts')
            ->name('public.ajax.related-products');

        Route::get('ajax/product-reviews/{id}', 'SeptemberController@ajaxGetProductReviews')
            ->name('public.ajax.product-reviews');
    });
});

Theme::routes();

Route::group(['namespace' => 'Theme\September\Http\Controllers', 'middleware' => 'web'], function () {
    Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {

        Route::get('/', 'SeptemberController@getIndex')->name('public.index');

        Route::get('sitemap.xml', [
            'as'   => 'public.sitemap',
            'uses' => 'SeptemberController@getSiteMap',
        ]);

        Route::get('{slug?}' . config('core.base.general.public_single_ending_url'), [
            'as'   => 'public.single',
            'uses' => 'SeptemberController@getView',
        ]);

    });

});
