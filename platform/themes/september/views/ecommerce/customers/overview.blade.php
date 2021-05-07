@extends(Theme::getThemeNamespace() . '::views.ecommerce.customers.master')
@section('content')

    <div class="panel panel-default">
        <div class="panel-heading">
            <h2 class="customer-page-title">{{ __('Account information') }}</h2>
        </div>

        <div class="panel-body">
            <div class="form-group"><i class="fa fa-user"></i> {{ __('Name') }}: <strong>{{ auth('customer')->user()->name }}</strong></div>
            <div class="form-group"><i class="fa fa-calendar"></i> {{ __('Date of birth') }}: <strong>{{ auth('customer')->user()->dob ? auth('customer')->user()->dob : __('N/A') }}</strong></div>
            <div class="form-group"><i class="fa fa-envelope"></i> {{ __('Email') }}: <strong>{{ auth('customer')->user()->email }}</strong></div>
            <div class="form-group"><i class="fa fa-phone"></i> {{ __('Phone') }}: <strong>{{ auth('customer')->user()->phone ? auth('customer')->user()->phone : __('N/A') }}</strong></div>
        </div>
    </div>

@endsection
