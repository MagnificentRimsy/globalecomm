<article class="post--detail">
    <div class="post__header">
        <h1>{{ $post->name }}</h1>
        <p>{{ $post->created_at->format('d M, Y') }} - @foreach($post->categories as $category) <a href="{{ $category->url }}">{{ $category->name }}</a>@if (!$loop->last),@endif @endforeach</p>
    </div>
    <div class="post__content">
        {!! clean($post->content, 'youtube') !!}
        @if (!$post->tags->isEmpty())
            <strong>{{ __('Tags') }}: </strong>
            <span>
                @foreach ($post->tags as $tag)
                    <a href="{{ $tag->url }}">{{ $tag->name }}</a>@if (!$loop->last),@endif
                @endforeach
            </span>
        @endif
        @if (theme_option('facebook_comment_enabled_in_post', 'yes') == 'yes')
            <br />
            {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, Theme::partial('comments')) !!}
        @endif
    </div>
</article>
<section class="section--related-posts">
    <div class="section__header">
        <h3>{{ __('Related Posts') }}:</h3>
    </div>
    <div class="section__content">
        <div class="row">
            @foreach (get_related_posts($post->id, 3) as $relatedItem)
                <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
                    <article class="post">
                        <div class="post__wrapper">
                            <div class="post__thumbnail"><a class="post__overlay" href="{{ $relatedItem->url }}"></a><img src="{{ RvMedia::getImageUrl($relatedItem->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $relatedItem->name }}" /></div>
                            <div class="post__content">
                                <div class="post__header">
                                    <h4 class="post__title"><a href="{{ $relatedItem->url }}">{{ $relatedItem->name }}</a></h4><span> {{ $relatedItem->created_at->format('d M, Y') }}</span>
                                </div>
                                <p>{{ $relatedItem->description }}</p>
                            </div>
                        </div>
                    </article>
                </div>
            @endforeach
        </div>
    </div>
</section>
