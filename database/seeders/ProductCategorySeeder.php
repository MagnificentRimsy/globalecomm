<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Models\Slug;
use Illuminate\Support\Str;
use SlugHelper;

class ProductCategorySeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->uploadFiles('product-categories');

        $categories = [
            [
                'name' => 'Woman wallet',
            ],
            [
                'name' => 'Office bags',
            ],
            [
                'name' => 'Hand bag',
            ],
            [
                'name' => 'Backpack',
            ],
            [
                'name' => 'Bags',
            ],
            [
                'name' => 'Wallet',
            ],
            [
                'name' => 'Men wallet',
            ],
        ];

        ProductCategory::truncate();
        Slug::where('reference_type', ProductCategory::class)->delete();

        foreach ($categories as $key => $item) {
            $item['order'] = $key + 1;
            $item['is_featured'] = true;
            $item['image'] = 'product-categories/' . ($key + 1) . '.png';
            $category = ProductCategory::create($item);

            Slug::create([
                'reference_type' => ProductCategory::class,
                'reference_id'   => $category->id,
                'key'            => Str::slug($category->name),
                'prefix'         => SlugHelper::getPrefix(ProductCategory::class),
            ]);
        }
    }
}
