<aside class="widget widget--footer">
    <h3 class="widget__title">{{ $config['name'] }}</h3>
    <div class="widget__content">
        {!!
        Menu::generateMenu([
            'slug'    => $config['menu_id'],
            'options' => ['class' => 'widget__links'],
        ])
    !!}
    </div>
</aside>
