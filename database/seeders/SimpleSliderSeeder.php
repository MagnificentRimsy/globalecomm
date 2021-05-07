<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\SimpleSlider\Models\SimpleSlider;
use Botble\SimpleSlider\Models\SimpleSliderItem;

class SimpleSliderSeeder extends BaseSeeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->uploadFiles('sliders');

        SimpleSlider::truncate();
        SimpleSliderItem::truncate();

        SimpleSlider::create([
            'name' => 'Home slider',
            'key'  => 'home-slider',
        ]);

        $sliderItems = [
            [
                'title'       => 'New Collection',
                'link'        => '/products',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc id varius nunc.',
            ],
            [
                'title'       => 'Hot Collection',
                'link'        => '/products',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc id varius nunc.',
            ],
            [
                'title'       => 'Trending Collection',
                'link'        => '/products',
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc id varius nunc.',
            ],
        ];

        foreach ($sliderItems as $key => $item) {
            $item['image'] = 'sliders/' . ($key + 1) . '.jpg';
            $item['order'] = $key + 1;
            $item['simple_slider_id'] = 1;

            SimpleSliderItem::create($item);
        }
    }
}
