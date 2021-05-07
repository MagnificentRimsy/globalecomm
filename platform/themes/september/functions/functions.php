<?php

use Illuminate\Routing\Events\RouteMatched;

register_page_template([
    'homepage'   => __('Homepage'),
    'full-width' => __('Full width'),
]);

register_sidebar([
    'id'          => 'footer_sidebar',
    'name'        => __('Footer sidebar'),
    'description' => __('Footer sidebar'),
]);

app()->booted(function () {
    remove_sidebar('primary_sidebar');
});

Menu::removeMenuLocation('header-menu')
    ->removeMenuLocation('footer-menu');

theme_option()
    ->setField([
        'id'         => 'hotline',
        'section_id' => 'opt-text-subsection-general',
        'type'       => 'text',
        'label'      => __('Hotline'),
        'attributes' => [
            'name'    => 'hotline',
            'value'   => null,
            'options' => [
                'class'        => 'form-control',
                'placeholder'  => __('Hotline'),
                'data-counter' => 30,
            ],
        ],
    ])
    ->setField([
        'id'         => 'email',
        'section_id' => 'opt-text-subsection-general',
        'type'       => 'email',
        'label'      => __('Email'),
        'attributes' => [
            'name'    => 'email',
            'value'   => null,
            'options' => [
                'class'        => 'form-control',
                'placeholder'  => __('Email'),
                'data-counter' => 120,
            ],
        ],
    ])
    ->setField([
        'id'         => 'address',
        'section_id' => 'opt-text-subsection-general',
        'type'       => 'text',
        'label'      => __('Address'),
        'attributes' => [
            'name'    => 'address',
            'value'   => null,
            'options' => [
                'class'        => 'form-control',
                'placeholder'  => __('Address'),
                'data-counter' => 120,
            ],
        ],
    ])
    ->setSection([
        'title'      => __('Social'),
        'desc'       => __('Social links'),
        'id'         => 'opt-text-subsection-social',
        'subsection' => true,
        'icon'       => 'fa fa-share-alt',
    ])
    ->setField([
        'id'         => 'facebook',
        'section_id' => 'opt-text-subsection-social',
        'type'       => 'text',
        'label'      => 'Facebook',
        'attributes' => [
            'name'    => 'facebook',
            'value'   => null,
            'options' => [
                'class' => 'form-control',
            ],
        ],
    ])
    ->setField([
        'id'         => 'twitter',
        'section_id' => 'opt-text-subsection-social',
        'type'       => 'text',
        'label'      => 'Twitter',
        'attributes' => [
            'name'    => 'twitter',
            'value'   => null,
            'options' => [
                'class' => 'form-control',
            ],
        ],
    ])
    ->setField([
        'id'         => 'linkedin',
        'section_id' => 'opt-text-subsection-social',
        'type'       => 'text',
        'label'      => 'Linkedin',
        'attributes' => [
            'name'    => 'linkedin',
            'value'   => null,
            'options' => [
                'class' => 'form-control',
            ],
        ],
    ])
    ->setField([
        'id'         => 'youtube',
        'section_id' => 'opt-text-subsection-social',
        'type'       => 'text',
        'label'      => 'Youtube',
        'attributes' => [
            'name'    => 'youtube',
            'value'   => null,
            'options' => [
                'class' => 'form-control',
            ],
        ],
    ])
    ->setField([
        'id'         => 'instagram',
        'section_id' => 'opt-text-subsection-social',
        'type'       => 'text',
        'label'      => 'Instagram',
        'attributes' => [
            'name'    => 'instagram',
            'value'   => null,
            'options' => [
                'class' => 'form-control',
            ],
        ],
    ])
    ->setField([
        'id'         => 'pinterest',
        'section_id' => 'opt-text-subsection-social',
        'type'       => 'text',
        'label'      => 'Pinterest',
        'attributes' => [
            'name'    => 'pinterest',
            'value'   => null,
            'options' => [
                'class' => 'form-control',
            ],
        ],
    ])
    ->setField([
        'id'         => 'product_page_banner_title',
        'section_id' => 'opt-text-subsection-ecommerce',
        'type'       => 'text',
        'label'      => __('The description for products page'),
        'attributes' => [
            'name'    => 'product_page_banner_title',
            'value'   => null,
            'options' => [
                'class' => 'form-control',
            ],
        ],
    ])
    ->setField([
        'id'         => 'product_page_banner_image',
        'section_id' => 'opt-text-subsection-ecommerce',
        'type'       => 'mediaImage',
        'label'      => __('Banner image for products page'),
        'attributes' => [
            'name'  => 'product_page_banner_image',
            'value' => null,
        ],
    ])
    ->setField([
        'id'         => 'primary_font',
        'section_id' => 'opt-text-subsection-general',
        'type'       => 'googleFonts',
        'label'      => __('Primary font'),
        'attributes' => [
            'name'  => 'primary_font',
            'value' => 'Poppins',
        ],
    ])
    ->setField([
        'id'         => 'primary_color',
        'section_id' => 'opt-text-subsection-general',
        'type'       => 'customColor',
        'label'      => __('Primary color'),
        'attributes' => [
            'name'  => 'primary_color',
            'value' => '#026e94',
        ],
    ])
    ->setField([
        'id'         => 'secondary_color',
        'section_id' => 'opt-text-subsection-general',
        'type'       => 'customColor',
        'label'      => __('Secondary color'),
        'attributes' => [
            'name'  => 'secondary_color',
            'value' => '#2c1dff',
        ],
    ])
    ->setField([
        'id'         => 'facebook_chat_enabled',
        'section_id' => 'opt-text-subsection-general',
        'type'       => 'select',
        'label'      => __('Enable Facebook chat?'),
        'attributes' => [
            'name'    => 'facebook_chat_enabled',
            'list'    => [
                'no'  => trans('core/base::base.no'),
                'yes' => trans('core/base::base.yes'),
            ],
            'value'   => 'yes',
            'options' => [
                'class' => 'form-control',
            ],
        ],
    ])
    ->setField([
        'id'         => 'facebook_page_id',
        'section_id' => 'opt-text-subsection-general',
        'type'       => 'text',
        'label'      => __('Facebook page ID'),
        'attributes' => [
            'name'    => 'facebook_page_id',
            'value'   => null,
            'options' => [
                'class' => 'form-control',
            ],
        ],
    ])
    ->setField([
        'id'         => 'facebook_comment_enabled_in_post',
        'section_id' => 'opt-text-subsection-general',
        'type'       => 'select',
        'label'      => __('Enable Facebook comment in post detail page?'),
        'attributes' => [
            'name'    => 'facebook_comment_enabled_in_post',
            'list'    => [
                'no'  => trans('core/base::base.no'),
                'yes' => trans('core/base::base.yes'),
            ],
            'value'   => 'yes',
            'options' => [
                'class' => 'form-control',
            ],
        ],
    ])
    ->setField([
        'id'         => 'facebook_comment_enabled_in_product',
        'section_id' => 'opt-text-subsection-general',
        'type'       => 'select',
        'label'      => __('Enable Facebook comment in product detail page?'),
        'attributes' => [
            'name'    => 'facebook_comment_enabled_in_product',
            'list'    => [
                'no'  => trans('core/base::base.no'),
                'yes' => trans('core/base::base.yes'),
            ],
            'value'   => 'yes',
            'options' => [
                'class' => 'form-control',
            ],
        ],
    ]);

add_action('init', function () {
    config([
        'filesystems.disks.public.root' => public_path('storage'),
        'filesystems.disks.public.url'  => str_replace('/index.php', '', url('storage')),
    ]);
}, 124);

RvMedia::addSize('medium', 570, 570)
    ->addSize('small', 570, 268);

add_shortcode('google-map', __('Google map'), __('Custom map'), function ($shortCode) {
    return Theme::partial('short-codes.google-map', ['address' => $shortCode->content]);
});

shortcode()->setAdminConfig('google-map', Theme::partial('short-codes.google-map-admin-config'));

if (is_plugin_active('ecommerce')) {
    add_shortcode('product-categories', __('Product categories'), __('Product categories'), function ($shortCode) {
        return Theme::partial('short-codes.product-categories', [
            'title'       => $shortCode->title,
            'description' => $shortCode->description,
        ]);
    });

    shortcode()->setAdminConfig('product-categories', Theme::partial('short-codes.product-categories-admin-config'));

    add_shortcode('featured-products', __('Featured products'), __('Featured products'), function ($shortCode) {

        return Theme::partial('short-codes.featured-products', [
            'title'       => $shortCode->title,
            'description' => $shortCode->description,
            'limit'       => $shortCode->limit ? $shortCode->limit : 8,
        ]);
    });

    shortcode()->setAdminConfig('featured-products', Theme::partial('short-codes.featured-products-admin-config'));

    add_shortcode('featured-product-categories', __('Featured Product Categories'), __('Featured Product Categories'),
        function ($shortCode) {

            return Theme::partial('short-codes.featured-product-categories', [
                'title'       => $shortCode->title,
                'description' => $shortCode->description,
            ]);
        });

    shortcode()->setAdminConfig('featured-product-categories',
        Theme::partial('short-codes.featured-product-categories-admin-config'));

    add_shortcode('featured-brands', __('Featured Brands'), __('Featured Brands'), function ($shortCode) {
        return Theme::partial('short-codes.featured-brands', [
            'title' => $shortCode->title,
        ]);
    });

    shortcode()->setAdminConfig('featured-brands', Theme::partial('short-codes.featured-brands-admin-config'));

    add_shortcode('product-collections', __('Product collections'), __('Product collections'), function ($shortCode) {
        return Theme::partial('short-codes.product-collections', [
            'title'       => $shortCode->title,
            'description' => $shortCode->description,
        ]);
    });

    shortcode()->setAdminConfig('product-collections', Theme::partial('short-codes.product-collections-admin-config'));

    add_shortcode('trending-products', __('Trending Products'), __('Trending Products'), function ($shortCode) {
        return Theme::partial('short-codes.trending-products', [
            'title'       => $shortCode->title,
            'description' => $shortCode->description,
            'limit'       => $shortCode->limit ? $shortCode->limit : 4,
        ]);
    });

    shortcode()->setAdminConfig('trending-products', Theme::partial('short-codes.trending-products-admin-config'));

    add_shortcode('all-products', __('All Products'), __('All Products'), function ($shortCode) {
        $products = get_products([
            'paginate' => [
                'per_page'      => $shortCode->per_page,
                'current_paged' => (int)request()->input('page'),
            ],
        ]);

        return Theme::partial('short-codes.all-products', [
            'title'    => $shortCode->title,
            'products' => $products,
        ]);
    });

    shortcode()->setAdminConfig('all-products', Theme::partial('short-codes.all-products-admin-config'));

    add_shortcode('all-brands', __('All Brands'), __('All Brands'), function ($shortCode) {
        $brands = get_all_brands();

        return Theme::partial('short-codes.all-brands', [
            'title'  => $shortCode->title,
            'brands' => $brands,
        ]);
    });

    shortcode()->setAdminConfig('all-brands', Theme::partial('short-codes.all-brands-admin-config'));
}

if (is_plugin_active('blog')) {
    add_shortcode('news', __('News'), __('News'), function ($shortCode) {
        return Theme::partial('short-codes.news', [
            'title'       => $shortCode->title,
            'description' => $shortCode->description,
        ]);
    });
    shortcode()->setAdminConfig('news', Theme::partial('short-codes.news-admin-config'));
}

if (is_plugin_active('contact')) {
    add_shortcode('september-contact-form', __('Contact form (deprecated)'), __('Add contact form'), function () {
        return Theme::partial('short-codes.contact-form');
    });

    add_filter(CONTACT_FORM_TEMPLATE_VIEW, function () {
        return Theme::getThemeNamespace() . '::partials.short-codes.contact-form';
    }, 120);
}

if (is_plugin_active('simple-slider')) {
    add_filter(SIMPLE_SLIDER_VIEW_TEMPLATE, function () {
        return Theme::getThemeNamespace() . '::partials.short-codes.sliders';
    }, 120);
}

add_shortcode('our-features', __('Our features'), __('Our features'), function ($shortCode) {
    $items = $shortCode->items;
    $items = explode(';', $items);
    $data = [];
    foreach ($items as $item) {
        $data[] = json_decode(trim($item), true);
    }

    return Theme::partial('short-codes.our-features', compact('data'));
});

Form::component('themeIcon', Theme::getThemeNamespace() . '::partials.icons-field', [
    'name',
    'value'      => null,
    'attributes' => [],
]);

if (is_plugin_active('ecommerce')) {
    Event::listen(RouteMatched::class, function () {
        dashboard_menu()
            ->removeItem('cms-plugins-flash-sale', 'cms-plugins-ecommerce');

        if (in_array(Route::currentRouteName(), ['flash-sale.index', 'flash-sale.create', 'flash-sale.edit'])) {
            abort(403);
        }
    });
}
