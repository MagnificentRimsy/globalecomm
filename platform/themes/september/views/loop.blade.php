<div class="row">
    @foreach ($posts as $post)
        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
            <article class="post">
                <div class="post__wrapper">
                    <div class="post__thumbnail"><a class="post__overlay" href="{{ $post->url }}"></a><img src="{{ RvMedia::getImageUrl($post->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $post->name }}" /></div>
                    <div class="post__content">
                        <div class="post__header">
                            <h4 class="post__title"><a href="{{ $post->url }}">{{ $post->name }}</a></h4> <span>{{ $post->created_at->format('d M, Y') }}</span>
                        </div>
                        <p>{{ $post->description }}</p>
                    </div>
                </div>
            </article>
        </div>
    @endforeach
</div>
<div class="section__footer text-center">
    <div class="custom-pagination">
        {!! $posts->withQueryString()->links() !!}
    </div>
</div>
