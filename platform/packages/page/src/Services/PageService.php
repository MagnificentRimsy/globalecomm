<?php

namespace Botble\Page\Services;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Page\Models\Page;
use Botble\Page\Repositories\Interfaces\PageInterface;
use Botble\SeoHelper\SeoOpenGraph;
use Eloquent;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use RvMedia;
use SeoHelper;
use Theme;

class PageService
{
    /**
     * @param Eloquent $slug
     * @return array|Eloquent
     */
    public function handleFrontRoutes($slug)
    {
        if (!$slug instanceof Eloquent) {
            return $slug;
        }

        $condition = [
            'id'     => $slug->reference_id,
            'status' => BaseStatusEnum::PUBLISHED,
        ];

        if (Auth::check() && request()->input('preview')) {
            Arr::forget($condition, 'status');
        }

        if ($slug->reference_type !== Page::class) {
            return $slug;
        }

        $page = app(PageInterface::class)->getFirstBy($condition, ['*'], ['slugable']);

        if (empty($page)) {
            abort(404);
        }

        SeoHelper::setTitle($page->name)
            ->setDescription($page->description);

        $meta = new SeoOpenGraph;
        if ($page->image) {
            $meta->setImage(RvMedia::getImageUrl($page->image));
        }
        $meta->setDescription($page->description);
        $meta->setUrl($page->url);
        $meta->setTitle($page->name);
        $meta->setType('article');

        SeoHelper::setSeoOpenGraph($meta);

        if ($page->template) {
            Theme::uses(Theme::getThemeName())
                ->layout($page->template);
        }

        if (function_exists('admin_bar') && Auth::check() && Auth::user()->hasPermission('pages.edit')) {
            admin_bar()
                ->registerLink(trans('packages/page::pages.edit_this_page'), route('pages.edit', $page->id));
        }

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add($page->name, $page->url);

        do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, PAGE_MODULE_SCREEN_NAME, $page);

        return [
            'view'         => 'page',
            'default_view' => 'packages/page::themes.page',
            'data'         => compact('page'),
            'slug'         => $page->slug,
        ];
    }
}
