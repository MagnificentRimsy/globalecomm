<section class="section--homepage home-collection">
    <div class="container">
        <div class="section__header">
            <h3>{!! clean($title) !!}</h3>
            <p>{!! clean($description) !!}</p>
        </div>
        <div class="section__content">
            <div class="row">
                @php
                    $productCategories = get_product_categories(['status' => \Botble\Base\Enums\BaseStatusEnum::PUBLISHED, 'is_featured' => 1], ['slugable']);
                @endphp

                @if (count($productCategories) > 0)
                    <div class="col-md-6 col-sm-12 col-12">
                        <div class="collection banner-effect">
                            <a href="{{ $productCategories[0]->url }}">
                                <img src="{{ RvMedia::getImageUrl($productCategories[0]->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $productCategories[0]->name }}">
                            </a>
                            <a class="collection__more_link" href="{{ $productCategories[0]->url }}">{{ $productCategories[0]->name }}</a>
                        </div>
                    </div>
                    @if (count($productCategories) > 1)
                        <div class="col-md-6 col-sm-12 col-12">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="collection banner-effect">
                                            <a href="{{ $productCategories[1]->url }}">
                                                <img src="{{ RvMedia::getImageUrl($productCategories[1]->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $productCategories[1]->name }}">
                                            </a>
                                            <a class="collection__more_link" href="{{ $productCategories[1]->url }}">{{ $productCategories[1]->name }}</a>
                                        </div>
                                    </div>
                                    @if (count($productCategories) > 2)
                                        <div class="col-md-6 col-12">
                                            <div class="collection banner-effect">
                                                <a href="{{ $productCategories[2]->url }}">
                                                    <img src="{{ RvMedia::getImageUrl($productCategories[2]->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $productCategories[2]->name }}">
                                                </a>
                                                <a class="collection__more_link" href="{{ $productCategories[2]->url }}">{{ $productCategories[2]->name }}</a>
                                            </div>
                                        </div>
                                    @endif
                                </div>

                            @if (count($productCategories) > 3)
                                <div class="collection banner-effect">
                                    <a href="{{ $productCategories[3]->url }}">
                                        <img src="{{ RvMedia::getImageUrl($productCategories[3]->image, 'small', false, RvMedia::getDefaultImage()) }}" alt="{{ $productCategories[3]->name }}">
                                    </a>
                                    <a class="collection__more_link" href="{{ $productCategories[3]->url }}">{{ $productCategories[3]->name }}</a>
                                </div>
                            @endif
                        </div>
                    @endif
                @endif
            </div>
        </div>
    </div>
</section>
