<?php

namespace Database\Seeders;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\Order;
use Botble\Ecommerce\Models\OrderAddress;
use Botble\Ecommerce\Models\OrderHistory;
use Botble\Ecommerce\Models\OrderProduct;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\ProductVariation;
use Botble\Ecommerce\Models\ProductVariationItem;
use Botble\Ecommerce\Models\Shipment;
use Botble\Ecommerce\Models\ShipmentHistory;
use Botble\Ecommerce\Models\Wishlist;
use Botble\Payment\Models\Payment;
use Botble\Slug\Models\Slug;
use Faker\Factory;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use SlugHelper;

class ProductSeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->uploadFiles('products');

        $faker = Factory::create();

        $products = [
            [
                'name'        => 'Wallet handmade',
                'images'      => json_encode(['products/1-a.jpg', 'products/1-b.jpg']),
                'price'       => $faker->numberBetween(200, 500),
                'sale_price'  => $faker->numberBetween(150, 200),
                'is_featured' => true,
            ],
            [
                'name'        => 'Clutch handmade',
                'images'      => json_encode(['products/2-a.jpg', 'products/2-b.jpg', 'products/2-c.jpg']),
                'price'       => $faker->numberBetween(200, 500),
                'is_featured' => true,
            ],
            [
                'name'        => 'Gucci Zip Around Wallet',
                'images'      => json_encode([
                    'products/3-a.jpg',
                    'products/3-b.jpg',
                    'products/3-c.jpg',
                    'products/3-d.jpg',
                ]),
                'price'       => $faker->numberBetween(200, 500),
                'sale_price'  => $faker->numberBetween(150, 200),
                'is_featured' => true,
            ],
            [
                'name'        => 'Snapshot Standard',
                'images'      => json_encode(['products/4-a.jpg', 'products/4-b.jpg', 'products/4-c.jpg']),
                'price'       => $faker->numberBetween(200, 500),
                'sale_price'  => $faker->numberBetween(50, 60),
                'is_featured' => true,
            ],
            [
                'name'        => 'Joan Mini Camera Bag',
                'images'      => json_encode(['products/5-a.jpg', 'products/5-b.jpg', 'products/5-c.jpg']),
                'price'       => $faker->numberBetween(70, 90),
                'is_featured' => true,
            ],
            [
                'name'        => 'Cyan Boheme',
                'images'      => json_encode(['products/6-a.jpg', 'products/6-b.jpg']),
                'price'       => $faker->numberBetween(40, 50),
                'sale_price'  => $faker->numberBetween(50, 60),
                'is_featured' => true,
            ],
            [
                'name'        => 'The Marc Jacobs',
                'images'      => json_encode(['products/7-a.jpg', 'products/7-b.jpg', 'products/7-c.jpg']),
                'price'       => $faker->numberBetween(50, 60),
                'is_featured' => true,
            ],
            [
                'name'        => 'Round Crossbody Bag',
                'images'      => json_encode(['products/8-a.jpg', 'products/8-b.jpg']),
                'price'       => $faker->numberBetween(110, 130),
                'sale_price'  => $faker->numberBetween(90, 100),
                'is_featured' => true,
            ],
        ];

        Product::truncate();
        DB::table('ec_product_with_attribute_set')->truncate();
        DB::table('ec_product_with_attribute')->truncate();
        DB::table('ec_product_variations')->truncate();
        DB::table('ec_product_variation_items')->truncate();
        DB::table('ec_product_collection_products')->truncate();
        DB::table('ec_product_category_product')->truncate();
        DB::table('ec_product_related_relations')->truncate();
        Slug::where('reference_type', Product::class)->delete();
        Wishlist::truncate();
        Order::truncate();
        OrderAddress::truncate();
        OrderProduct::truncate();
        OrderHistory::truncate();
        Shipment::truncate();
        ShipmentHistory::truncate();
        Payment::truncate();

        foreach ($products as $item) {
            $item['description'] = '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>';
            $item['content'] = '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>
                                <p>- Casual unisex fit</p>

                                <p>- 64% polyester, 36% polyurethane</p>

                                <p>- Water column pressure: 4000 mm</p>

                                <p>- Model is 187cm tall and wearing a size S / M</p>

                                <p>- Unisex fit</p>

                                <p>- Drawstring hood with built-in cap</p>

                                <p>- Front placket with snap buttons</p>

                                <p>- Ventilation under armpit</p>

                                <p>- Adjustable cuffs</p>

                                <p>- Double welted front pockets</p>

                                <p>- Adjustable elastic string at hempen</p>

                                <p>- Ultrasonically welded seams</p>

                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>';
            $item['status'] = BaseStatusEnum::PUBLISHED;
            $item['sku'] = 'HS-' . $faker->numberBetween(100, 200);
            $item['brand_id'] = $faker->numberBetween(1, 7);
            $item['tax_id'] = 1;
            $item['views'] = $faker->numberBetween(1000, 200000);
            $item['quantity'] = $faker->numberBetween(10, 20);
            $item['length'] = $faker->numberBetween(10, 20);
            $item['wide'] = $faker->numberBetween(10, 20);
            $item['height'] = $faker->numberBetween(10, 20);
            $item['weight'] = $faker->numberBetween(500, 900);
            $item['with_storehouse_management'] = true;

            $product = Product::create($item);

            Slug::create([
                'reference_type' => Product::class,
                'reference_id'   => $product->id,
                'key'            => Str::slug($product->name),
                'prefix'         => SlugHelper::getPrefix(Product::class),
            ]);

            $product->productCollections()->sync([$faker->numberBetween(1, 3)]);
            $product->categories()->sync([
                $faker->numberBetween(1, 14),
                $faker->numberBetween(1, 14),
                $faker->numberBetween(1, 14),
            ]);
            $product->tags()->sync([
                $faker->numberBetween(1, 6),
                $faker->numberBetween(1, 6),
                $faker->numberBetween(1, 6),
            ]);
        }

        $countProducts = count($products);

        foreach ($products as $key => $item) {
            $product = Product::find($key + 1);
            $product->productAttributeSets()->sync([1, 2]);
            $product->productAttributes()->sync([$faker->numberBetween(1, 5), $faker->numberBetween(6, 10)]);

            $product->crossSales()->sync([
                $this->random(1, $countProducts, [$product->id]),
                $this->random(1, $countProducts, [$product->id]),
                $this->random(1, $countProducts, [$product->id]),
                $this->random(1, $countProducts, [$product->id]),
            ]);

            for ($j = 0; $j < $faker->numberBetween(1, 5); $j++) {
                $variation = Product::create([
                    'name'                       => $product->name,
                    'status'                     => BaseStatusEnum::PUBLISHED,
                    'sku'                        => $product->sku . '-A' . $j,
                    'quantity'                   => $product->quantity,
                    'weight'                     => $product->weight,
                    'height'                     => $product->height,
                    'wide'                       => $product->wide,
                    'length'                     => $product->length,
                    'price'                      => $product->price,
                    'sale_price'                 => ($product->price - $product->price * $faker->numberBetween(10,
                            30) / 100),
                    'brand_id'                   => $product->brand_id,
                    'with_storehouse_management' => $product->with_storehouse_management,
                    'is_variation'               => true,
                    'images'                     => json_encode([
                        'products/' . $faker->numberBetween(1, 7) . '-a.jpg',
                        'products/' . $faker->numberBetween(1, 7) . '-b.jpg',
                    ]),
                ]);

                $productVariation = ProductVariation::create([
                    'product_id'              => $variation->id,
                    'configurable_product_id' => $product->id,
                    'is_default'              => $j == 0,
                ]);

                if ($productVariation->is_default) {
                    $product->update([
                        'sku'        => $variation->sku,
                        'sale_price' => $variation->sale_price,
                        'images'     => json_encode($variation->images),
                    ]);
                }

                ProductVariationItem::create([
                    'attribute_id' => $faker->numberBetween(1, 5),
                    'variation_id' => $productVariation->id,
                ]);

                ProductVariationItem::create([
                    'attribute_id' => $faker->numberBetween(6, 10),
                    'variation_id' => $productVariation->id,
                ]);
            }
        }
    }

    /**
     * @param $from
     * @param $to
     * @param array $exceptions
     * @return int
     */
    protected function random($from, $to, array $exceptions = [])
    {
        sort($exceptions); // lets us use break; in the foreach reliably
        $number = rand($from, $to - count($exceptions)); // or mt_rand()

        foreach ($exceptions as $exception) {
            if ($number >= $exception) {
                $number++; // make up for the gap
            } else /*if ($number < $exception)*/ {
                break;
            }
        }

        return $number;
    }
}
