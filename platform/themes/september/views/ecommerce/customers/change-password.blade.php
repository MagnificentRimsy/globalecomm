@extends(Theme::getThemeNamespace() . '::views.ecommerce.customers.master')
@section('content')
    <div class="panel panel-default">
        <div class="panel-heading">
            <h2 class="customer-page-title">{{ __('Change password') }}</h2>
        </div>
        <div class="panel-body">
            {!! Form::open(['route' => 'customer.post.change-password', 'method' => 'post']) !!}
            <div class="form-group @if ($errors->has('old_password')) has-error @endif">
                <label for="old_password">{{ __('Current password') }}:</label>
                <input type="password" class="form-control" name="old_password" id="old_password"
                       placeholder="{{ __('Current password') }}">
                {!! Form::error('old_password', $errors) !!}
            </div>
            <div class="form-group @if ($errors->has('password')) has-error @endif">
                <label for="password">{{ __('New password') }}:</label>
                <input type="password" class="form-control" name="password" id="password"
                       placeholder="{{ __('New password') }}">
                {!! Form::error('password', $errors) !!}
            </div>
            <div class="form-group @if ($errors->has('password_confirmation')) has-error @endif">
                <label for="password_confirmation">{{ __('Password confirmation') }}:</label>
                <input type="password" class="form-control" name="password_confirmation" id="password_confirmation"
                       placeholder="{{ __('Password confirmation') }}">
                {!! Form::error('password_confirmation', $errors) !!}
            </div>
            <div class="form-group text-center">
                <button type="submit"
                        class="btn--custom btn--rounded btn--outline btn--sm">{{ __('Change password') }}</button>
            </div>
            {!! Form::close() !!}
        </div>
    </div>
@stop
