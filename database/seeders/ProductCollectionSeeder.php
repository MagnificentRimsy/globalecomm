<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCollection;
use Illuminate\Support\Str;

class ProductCollectionSeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->uploadFiles('product-collections');

        ProductCollection::truncate();

        $productCollections = [
            [
                'name'        => 'New Arrival',
                'is_featured' => true,
            ],
            [
                'name'        => 'Best Sellers',
                'is_featured' => true,
            ],
            [
                'name'        => 'Special Offer',
                'is_featured' => true,
            ],
            [
                'name'        => 'Trending Fashion',
                'is_featured' => true,
            ],
        ];

        foreach ($productCollections as $key => $item) {
            $item['slug'] = Str::slug($item['name']);
            $item['image'] = 'product-collections/' . ($key + 1) . '.jpg';
            ProductCollection::create($item);
        }
    }
}
