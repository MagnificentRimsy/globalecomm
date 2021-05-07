<?php

namespace Botble\Page\Tables;

use BaseHelper;
use Botble\Page\Models\Page;
use Illuminate\Support\Facades\Auth;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Page\Repositories\Interfaces\PageInterface;
use Botble\Table\Abstracts\TableAbstract;
use Html;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Support\Arr;
use Illuminate\Validation\Rule;
use Yajra\DataTables\DataTables;

class PageTable extends TableAbstract
{
    /**
     * @var bool
     */
    protected $hasActions = true;

    /**
     * @var bool
     */
    protected $hasFilter = true;

    /**
     * PageTable constructor.
     * @param DataTables $table
     * @param UrlGenerator $urlGenerator
     * @param PageInterface $pageRepository
     */
    public function __construct(DataTables $table, UrlGenerator $urlGenerator, PageInterface $pageRepository)
    {
        $this->repository = $pageRepository;
        $this->setOption('id', 'table-pages');
        parent::__construct($table, $urlGenerator);

        if (!Auth::user()->hasAnyPermission(['pages.edit', 'pages.destroy'])) {
            $this->hasOperations = false;
            $this->hasActions = false;
        }
    }

    /**
     * {@inheritDoc}
     */
    public function ajax()
    {
        $pageTemplates = get_page_templates();

        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('name', function ($item) {
                if (!Auth::user()->hasPermission('posts.edit')) {
                    $name = $item->name;
                } else {
                    $name = Html::link(route('pages.edit', $item->id), $item->name);
                }

                if (function_exists('theme_option') && BaseHelper::isHomepage($item->id)) {
                    $name .= Html::tag('span', ' — ' . trans('packages/page::pages.front_page'), [
                        'class' => 'additional-page-name',
                    ])->toHtml();
                }

                return apply_filters(PAGE_FILTER_PAGE_NAME_IN_ADMIN_LIST, $name, $item);
            })
            ->editColumn('checkbox', function ($item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('template', function ($item) use ($pageTemplates) {
                return Arr::get($pageTemplates, $item->template);
            })
            ->editColumn('created_at', function ($item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('status', function ($item) {
                return $item->status->toHtml();
            });

        return apply_filters(BASE_FILTER_GET_LIST_DATA, $data, $this->repository->getModel())
            ->addColumn('operations', function ($item) {
                return $this->getOperations('pages.edit', 'pages.destroy', $item);
            })
            ->escapeColumns([])
            ->make(true);
    }

    /**
     * {@inheritDoc}
     */
    public function query()
    {
        $model = $this->repository->getModel();

        $select = [
            'pages.id',
            'pages.name',
            'pages.template',
            'pages.created_at',
            'pages.status',
        ];

        $query = $model
            ->select($select);

        return $this->applyScopes(apply_filters(BASE_FILTER_TABLE_QUERY, $query, $model, $select));
    }

    /**
     * {@inheritDoc}
     */
    public function columns()
    {
        return [
            'id'         => [
                'name'  => 'pages.id',
                'title' => trans('core/base::tables.id'),
                'width' => '20px',
            ],
            'name'       => [
                'name'  => 'pages.name',
                'title' => trans('core/base::tables.name'),
                'class' => 'text-left',
            ],
            'template'   => [
                'name'  => 'pages.template',
                'title' => trans('core/base::tables.template'),
                'class' => 'text-left',
            ],
            'created_at' => [
                'name'  => 'pages.created_at',
                'title' => trans('core/base::tables.created_at'),
                'width' => '100px',
                'class' => 'text-center',
            ],
            'status'     => [
                'name'  => 'pages.status',
                'title' => trans('core/base::tables.status'),
                'width' => '100px',
                'class' => 'text-center',
            ],
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function buttons()
    {
        $buttons = $this->addCreateButton(route('pages.create'), 'pages.create');

        return apply_filters(BASE_FILTER_TABLE_BUTTONS, $buttons, Page::class);
    }

    /**
     * {@inheritDoc}
     */
    public function bulkActions(): array
    {
        return $this->addDeleteAction(route('pages.deletes'), 'pages.destroy', parent::bulkActions());
    }

    /**
     * {@inheritDoc}
     */
    public function getBulkChanges(): array
    {
        return [
            'pages.name'       => [
                'title'    => trans('core/base::tables.name'),
                'type'     => 'text',
                'validate' => 'required|max:120',
            ],
            'pages.status'     => [
                'title'    => trans('core/base::tables.status'),
                'type'     => 'select',
                'choices'  => BaseStatusEnum::labels(),
                'validate' => 'required|' . Rule::in(BaseStatusEnum::values()),
            ],
            'pages.template'   => [
                'title'    => trans('core/base::tables.template'),
                'type'     => 'select',
                'choices'  => get_page_templates(),
                'validate' => 'required',
            ],
            'pages.created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type'  => 'date',
            ],
        ];
    }
}
