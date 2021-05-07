<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Menu\Models\Menu as MenuModel;
use Botble\Menu\Models\MenuLocation;
use Botble\Menu\Models\MenuNode;
use Botble\Page\Models\Page;
use Illuminate\Support\Arr;

class MenuSeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $menus = [
            [
                'name'     => 'Main menu',
                'slug'     => 'main-menu',
                'location' => 'main-menu',
                'items'    => [
                    [
                        'title'     => 'Home',
                        'url'       => '/',
                        'parent_id' => 0,
                    ],
                    [
                        'title'     => 'Products',
                        'url'       => '/products',
                        'parent_id' => 0,
                        'has_child' => true,
                        'items'     => [
                            [
                                'title'          => 'Woman wallet',
                                'url'            => '/product-categories/woman-wallet',
                                'reference_id'   => 1,
                                'reference_type' => ProductCategory::class,
                                'parent_id'      => 2,
                            ],
                            [
                                'title'          => 'Office bags',
                                'url'            => '/product-categories/office-bags',
                                'reference_id'   => 2,
                                'reference_type' => ProductCategory::class,
                                'parent_id'      => 2,
                            ],
                            [
                                'title'          => 'Hand bag',
                                'url'            => '/product-categories/hand-bag',
                                'reference_id'   => 3,
                                'reference_type' => ProductCategory::class,
                                'parent_id'      => 2,
                            ],
                            [
                                'title'          => 'Backpack',
                                'url'            => '/product-categories/backpack',
                                'reference_id'   => 4,
                                'reference_type' => ProductCategory::class,
                                'parent_id'      => 2,
                            ],
                        ],
                    ],
                    [
                        'title'          => 'Blog',
                        'url'            => '/blog',
                        'reference_id'   => 2,
                        'reference_type' => Page::class,
                        'parent_id'      => 0,
                    ],
                    [
                        'title'          => 'Contact',
                        'url'            => '/contact',
                        'reference_id'   => 3,
                        'reference_type' => Page::class,
                        'parent_id'      => 0,
                    ],
                ],
            ],
            [
                'name'  => 'Customer services',
                'slug'  => 'customer-services',
                'items' => [
                    [
                        'title'     => 'Login',
                        'url'       => '/login',
                        'parent_id' => 0,
                    ],
                    [
                        'title'     => 'Register',
                        'url'       => '/register',
                        'parent_id' => 0,
                    ],
                    [
                        'title'          => 'Blog',
                        'url'            => '/blog',
                        'reference_id'   => 2,
                        'reference_type' => Page::class,
                        'parent_id'      => 0,
                    ],
                    [
                        'title'          => 'Contact',
                        'url'            => '/contact',
                        'reference_id'   => 3,
                        'reference_type' => Page::class,
                        'parent_id'      => 0,
                    ],
                ],
            ],
        ];

        MenuModel::truncate();
        MenuLocation::truncate();
        MenuNode::truncate();

        foreach ($menus as $index => $item) {
            $menu = MenuModel::create(Arr::except($item, ['items', 'location']));

            if (isset($item['location'])) {
                MenuLocation::create([
                    'menu_id'  => $menu->id,
                    'location' => $item['location'],
                ]);
            }

            foreach ($item['items'] as $menuNode) {
                $menuNode['menu_id'] = $index + 1;
                $data = $menuNode;
                if (Arr::has($data, 'items')) {
                    $data = Arr::except($menuNode, ['items']);
                }
                MenuNode::create($data);

                if (Arr::has($menuNode, 'items')) {
                    foreach ($menuNode['items'] as $menuNodeItemIndex => $menuNodeItem) {
                        $menuNodeItem['menu_id'] = $index + 1;
                        $menuNodeItem['position'] = $menuNodeItemIndex;
                        MenuNode::create($menuNodeItem);
                    }
                }
            }
        }
    }
}
