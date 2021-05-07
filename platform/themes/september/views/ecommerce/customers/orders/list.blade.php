@extends(Theme::getThemeNamespace() . '::views.ecommerce.customers.master')
@section('content')

    <h2 class="customer-page-title">{{ __('Orders') }}</h2>

    <div class="customer-list-order">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>{{ __('ID number') }}</th>
                <th>{{ __('Date') }}</th>
                <th>{{ __('Total') }}</th>
                <th>{{ __('Status') }}</th>
                <th>{{ __('Actions') }}</th>
            </tr>
            </thead>
            <tbody>
                @if (count($orders) > 0)
                    @foreach ($orders as $order)
                        <tr>
                            <td>{{ get_order_code($order->id) }}</td>
                            <td>{{ $order->created_at->format('Y/m/d h:m') }}</td>
                            <td>{{ format_price($order->amount) }}</td>
                            <td>{{ $order->status->label() }}</td>
                            <td>
                                <a class="btn--custom btn--rounded btn--outline btn--sm" href="{{ route('customer.orders.view', $order->id) }}">{{ __('View') }}</a>
                            </td>
                        </tr>
                    @endforeach
                @else
                    <tr>
                        <td class="text-center" colspan="5">{{ __('No orders found!') }}</td>
                    </tr>
                @endif
            </tbody>
        </table>

        <div class="text-center">
            {!! $orders->links() !!}
        </div>

    </div>
@endsection
