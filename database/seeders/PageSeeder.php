<?php

namespace Database\Seeders;

use Botble\Base\Models\MetaBox as MetaBoxModel;
use Botble\Base\Supports\BaseSeeder;
use Botble\Page\Models\Page;
use Botble\Slug\Models\Slug;
use Html;
use Illuminate\Support\Str;
use SlugHelper;

class PageSeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $pages = [
            [
                'name'     => 'Homepage',
                'content'  =>
                    Html::tag('div', '[simple-slider key="home-slider"][/simple-slider]') .
                    Html::tag('div',
                        '[featured-product-categories title="Top Categories" description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim Nullam nunc varius."][/featured-product-categories]') .
                    Html::tag('div',
                        '[product-collections title="A change of Season" description="Update your wardrobe with new seasonal trend"][/product-collections]') .
                    Html::tag('div',
                        '[featured-products title="Our Picks For You" description="Always find the best ways for you" limit="8"][/featured-products]') .
                    Html::tag('div',
                        '[trending-products title="Trending Products" description="Products on trending" limit="4"][/trending-products]') .
                    Html::tag('div', '[featured-brands title="Our Brands"][/featured-brands]') .
                    Html::tag('div',
                        '[news title="Visit Our Blog" description="Our Blog updated the newest trend of the world regularly"][/news]') .
                    Html::tag('div',
                        '[our-features items=\'{"title": "FREE SHIPPING", "description": "Free shipping on all US order or order above $200", "icon": "feather icon icon-truck"}; {"title": "SUPPORT 24/7", "description": "Contact us 24 hours a day, 7 days a week", "icon": "feather icon icon-life-buoy"};{"title": "30 DAYS RETURN", "description": "Simply return it within 30 days for an exchange", "icon": "feather icon icon-refresh-ccw"};{"title": "100% PAYMENT SECURE", "description": "We ensure secure payment with PEV", "icon": "feather icon icon-shield"}\'][/our-features]')
                ,
                'template' => 'homepage',
                'user_id'  => 1,
            ],
            [
                'name'     => 'Blog',
                'content'  => Html::tag('p',
                    'We always share fashion tips with the hope you guys will find the best style for yourself.<br />Besides, we update the fashion trend as soon as we can.<br />Enjoy your journey!',
                    ['style' => 'text-align: center']),
                'template' => 'default',
                'user_id'  => 1,
            ],
            [
                'name'     => 'Contact',
                'content'  => Html::tag('p', '[contact-form][/contact-form]'),
                'template' => 'default',
                'user_id'  => 1,
            ],
            [
                'name'     => 'Cookie Policy',
                'content'  => Html::tag('h3', 'EU Cookie Consent') .
                    Html::tag('p', 'To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.') .
                    Html::tag('h4', 'Essential Data') .
                    Html::tag('p', 'The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.') .
                    Html::tag('p', '- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.') .
                    Html::tag('p', '- XSRF-Token Cookie: Laravel automatically generates a CSRF "token" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.'),
                'template' => 'default',
                'user_id'  => 1,
            ],
        ];

        Page::truncate();
        Slug::where('reference_type', Page::class)->delete();
        MetaBoxModel::where('reference_type', Page::class)->delete();

        foreach ($pages as $index => $item) {
            $page = Page::create($item);

            Slug::create([
                'reference_type' => Page::class,
                'reference_id'   => $page->id,
                'key'            => Str::slug($page->name),
                'prefix'         => SlugHelper::getPrefix(Page::class),
            ]);
        }
    }
}
