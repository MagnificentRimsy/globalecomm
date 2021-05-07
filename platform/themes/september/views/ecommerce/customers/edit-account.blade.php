@extends(Theme::getThemeNamespace() . '::views.ecommerce.customers.master')
@section('content')
    <div class="panel panel-default">
        <div class="panel-heading">
            <h2 class="customer-page-title">{{ __('Account information') }}</h2>
        </div>
        <div class="panel-body">

            {!! Form::open(['route' => 'customer.edit-account']) !!}
                <div class="form-group">
                    <label for="name">{{ __('Full Name') }}:</label>
                    <input id="name" type="text" class="form-control" name="name" value="{{ auth('customer')->user()->name }}">
                </div>
                {!! Form::error('name', $errors) !!}

                <div class="form-group @if ($errors->has('dob')) has-error @endif">
                    <label for="date_of_birth">{{ __('Date of birth') }}:</label>
                    <input id="date_of_birth" type="text" class="form-control" name="dob" placeholder="Y-m-d" value="{{ auth('customer')->user()->dob }}">
                </div>
                 {!! Form::error('dob', $errors) !!}
                <div class="form-group @if ($errors->has('email')) has-error @endif">
                     <label for="email">{{ __('Email') }}:</label>
                    <input id="email" type="text" class="form-control" disabled="disabled" value="{{ auth('customer')->user()->email }}" name="email">
                </div>
                {!! Form::error('email', $errors) !!}

                <div class="form-group @if ($errors->has('phone')) has-error @endif">
                    <label for="phone">{{ __('Phone') }}</label>
                    <input type="text" class="form-control" name="phone" id="phone" placeholder="{{ __('Phone') }}" value="{{ auth('customer')->user()->phone }}">

                </div>
                {!! Form::error('phone', $errors) !!}

                <div class="form-group text-center">
                    <button type="submit" class="btn--custom btn--rounded btn--outline btn--sm">{{ __('Update') }}</button>
                </div>
            {!! Form::close() !!}
        </div>
    </div>
@endsection
