/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

import NewsComponent from './components/NewsComponent';
import FeaturedProductComponent from './components/FeaturedProductComponent';
import FeaturedProductCategoriesComponent from './components/FeaturedProductCategoriesComponent';
import FeaturedBrandsComponent from './components/FeaturedBrandsComponent';
import TrendingProductsComponent from './components/TrendingProductsComponent';
import RelatedProductsComponent from './components/RelatedProductsComponent';
import ProductReviewsComponent from './components/ProductReviewsComponent';
import Vue from 'vue';

window.axios = require('axios');

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('featured-products-component', FeaturedProductComponent);
Vue.component('news-component', NewsComponent);
Vue.component('featured-product-categories-component', FeaturedProductCategoriesComponent);
Vue.component('featured-brands-component', FeaturedBrandsComponent);
Vue.component('trending-products-component', TrendingProductsComponent);
Vue.component('related-products-component', RelatedProductsComponent);
Vue.component('product-reviews-component', ProductReviewsComponent);

/**
 * This let us access the `__` method for localization in VueJS templates
 * ({{ __('key') }})
 */
Vue.prototype.__ = key => {
    window.trans = window.trans || {};

    return window.trans[key] !== 'undefined' && window.trans[key] ? window.trans[key] : key;
};

Vue.prototype.themeUrl = url => {
    return window.themeUrl + '/' + url;
}

Vue.directive('carousel', {
    inserted: function (el) {
        $(el).owlCarousel({
            rtl: $('body').prop('dir') === 'rtl',
            dots : $(el).data('dots'),
            loop : $(el).data('loop'),
            items: $(el).data('items'),
            margin: $(el).data('margin'),
            mouseDrag: $(el).data('mouse-drag'),
            touchDrag: $(el).data('touch-drag'),
            autoHeight: $(el).data('autoheight'),
            center: $(el).data('center'),
            nav: $(el).data('nav'),
            rewind: $(el).data('rewind'),
            navText: ['<i class="ion-ios-arrow-left"></i>', '<i class="ion-ios-arrow-right"></i>'],
            autoplay : $(el).data('autoplay'),
            animateIn : $(el).data('animate-in'),
            animateOut: $(el).data('animate-out'),
            autoplayTimeout : $(el).data('autoplay-timeout'),
            smartSpeed: $(el).data('smart-speed'),
            responsive: $(el).data('responsive')
        })
    },
});

new Vue({
    el: '#app'
});
