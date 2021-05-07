<?php

namespace Botble\Table\Http\Controllers;

use App\Http\Controllers\Controller;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Table\Http\Requests\BulkChangeRequest;
use Botble\Table\Http\Requests\FilterRequest;
use Botble\Table\TableBuilder;
use Exception;
use Form;
use Illuminate\Contracts\Container\BindingResolutionException;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use Throwable;

class TableController extends Controller
{

    /**
     * @var TableBuilder
     */
    protected $tableBuilder;

    /**
     * TableController constructor.
     * @param TableBuilder $tableBuilder
     */
    public function __construct(TableBuilder $tableBuilder)
    {
        $this->tableBuilder = $tableBuilder;
    }

    /**
     * @param BulkChangeRequest $request
     * @param TableBuilder $tableBuilder
     * @return array|mixed
     * @throws Throwable
     */
    public function getDataForBulkChanges(BulkChangeRequest $request, TableBuilder $tableBuilder)
    {
        $object = $tableBuilder->create($request->input('class'));

        $data = $object->getValueInput(null, null, 'text');
        if (!$request->input('key')) {
            return $data;
        }

        $column = Arr::get($object->getBulkChanges(), $request->input('key'), null);
        if (empty($column)) {
            return $data;
        }

        $labelClass = 'control-label';
        if (!empty($column) && Str::contains(Arr::get($column, 'validate'), 'required')) {
            $labelClass .= ' required';
        }

        $label = '';
        if (!empty($column['title'])) {
            $label = Form::label($column['title'], null, ['class' => $labelClass])->toHtml();
        }

        if (isset($column['callback']) && method_exists($object, $column['callback'])) {
            $data = $object->getValueInput(
                $column['title'],
                null,
                $column['type'],
                call_user_func([$object, $column['callback']])
            );
        } else {
            $data = $object->getValueInput($column['title'], null, $column['type'], Arr::get($column, 'choices', []));
        }

        $data['html'] = $label . $data['html'];

        return $data;
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws BindingResolutionException
     */
    public function postSaveBulkChange(Request $request, BaseHttpResponse $response)
    {
        $ids = $request->input('ids');
        if (empty($ids)) {
            return $response
                ->setError()
                ->setMessage(trans('core/table::table.please_select_record'));
        }

        $inputKey = $request->input('key');
        $inputValue = $request->input('value');

        $object = $this->tableBuilder->create($request->input('class'));
        $columns = $object->getBulkChanges();

        if (!empty($columns[$inputKey]['validate'])) {
            $validator = Validator::make($request->input(), [
                'value' => $columns[$inputKey]['validate'],
            ]);

            if ($validator->fails()) {
                return $response
                    ->setError()
                    ->setMessage($validator->messages()->first());
            }
        }

        try {
            $object->saveBulkChanges($ids, $inputKey, $inputValue);
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }

        return $response->setMessage(trans('core/table::table.save_bulk_change_success'));
    }

    /**
     * @param FilterRequest $request
     * @param TableBuilder $tableBuilder
     * @return array|mixed
     * @throws BindingResolutionException
     * @throws Throwable
     */
    public function getFilterInput(FilterRequest $request, TableBuilder $tableBuilder)
    {
        $object = $tableBuilder->create($request->input('class'));

        $data = $object->getValueInput(null, null, 'text');
        if (!$request->input('key')) {
            return $data;
        }

        $column = Arr::get($object->getFilters(), $request->input('key'), null);
        if (empty($column)) {
            return $data;
        }

        if (isset($column['callback']) && method_exists($object, $column['callback'])) {
            return $object->getValueInput(
                null,
                $request->input('value'),
                $column['type'],
                call_user_func([$object, $column['callback']])
            );
        }

        return $object->getValueInput(
            null,
            $request->input('value'),
            $column['type'],
            Arr::get($column, 'choices', [])
        );
    }
}
