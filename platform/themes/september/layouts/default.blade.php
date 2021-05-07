{!! Theme::partial('header') !!}

<div id="app">
    {!! Theme::partial('breadcrumbs') !!}
    <main class="page--inner">
        <div class="container">
            {!! Theme::content() !!}
        </div>
    </main>
</div>

{!! Theme::partial('footer') !!}
