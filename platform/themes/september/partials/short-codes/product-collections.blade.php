<section class="section--homepage home-collection">
    <div class="container">
        <div class="section__header">
            <h3>{!! clean($title) !!}</h3>
            <p>{!! clean($description) !!}</p>
        </div>
        <div class="section__content">
            <div class="row">
                @php
                    $productCollections = get_product_collections(['status' => \Botble\Base\Enums\BaseStatusEnum::PUBLISHED, 'is_featured' => true]);
                @endphp

                @if (count($productCollections) > 0)
                    <div class="col-md-6 col-sm-12 col-12">
                        <div class="collection banner-effect">
                            <a href="{{ route('public.products', ['collections[]' => $productCollections[0]->id]) }}">
                                <img src="{{ RvMedia::getImageUrl($productCollections[0]->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $productCollections[0]->name }}">
                            </a>
                            <a class="collection__more_link" href="{{ route('public.products', ['collections[]' => $productCollections[0]->id]) }}">{{ $productCollections[0]->name }}</a>
                        </div>
                    </div>
                    @if (count($productCollections) > 1)
                        <div class="col-md-6 col-sm-12 col-12">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="collection banner-effect">
                                            <a href="{{ route('public.products', ['collections[]' => $productCollections[1]->id]) }}">
                                                <img src="{{ RvMedia::getImageUrl($productCollections[1]->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $productCollections[1]->name }}">
                                            </a>
                                            <a class="collection__more_link" href="{{ route('public.products', ['collections[]' => $productCollections[1]->id]) }}">{{ $productCollections[1]->name }}</a>
                                        </div>
                                    </div>
                                    @if (count($productCollections) > 2)
                                        <div class="col-md-6 col-12">
                                            <div class="collection banner-effect">
                                                <a href="{{ route('public.products', ['collections[]' => $productCollections[2]->id]) }}">
                                                    <img src="{{ RvMedia::getImageUrl($productCollections[2]->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $productCollections[2]->name }}">
                                                </a>
                                                <a class="collection__more_link" href="{{ route('public.products', ['collections[]' => $productCollections[2]->id]) }}">{{ $productCollections[2]->name }}</a>
                                            </div>
                                        </div>
                                    @endif
                                </div>

                            @if (count($productCollections) > 3)
                                <div class="collection banner-effect">
                                    <a href="{{ route('public.products', ['collections[]' => $productCollections[2]->id]) }}">
                                        <img src="{{ RvMedia::getImageUrl($productCollections[3]->image, 'small', false, RvMedia::getDefaultImage()) }}" alt="{{ $productCollections[3]->name }}">
                                    </a>
                                    <a class="collection__more_link" href="{{ route('public.products', ['collections[]' => $productCollections[3]->id]) }}">{{ $productCollections[3]->name }}</a>
                                </div>
                            @endif
                        </div>
                    @endif
                    @if (count($productCollections) > 3)
                        @foreach($productCollections->skip(4) as $productCollection)
                            <div class="col-md-3 col-12">
                                <div class="collection banner-effect">
                                    <a href="{{ route('public.products', ['collections[]' => $productCollection->id]) }}">
                                        <img src="{{ RvMedia::getImageUrl($productCollection->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $productCollection->name }}">
                                    </a>
                                    <a class="collection__more_link" href="{{ route('public.products', ['collections[]' => $productCollection->id]) }}">{{ $productCollection->name }}</a>
                                </div>
                            </div>
                        @endforeach
                    @endif
                @endif
            </div>
        </div>
    </div>
</section>
