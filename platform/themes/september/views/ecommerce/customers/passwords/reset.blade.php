<main class="page--inner">
    <div class="container">
        <section class="section--auth">
            <form class="form--auth form--login" method="POST" action="{{ route('customer.password.email') }}">
                @csrf
                <input type="hidden" name="token" value="{{ $token }}">
                <div class="form__header">
                    <h3>{{ __('Reset Password') }}</h3>
                </div>
                <div class="form__content">
                    <div class="form-group">
                        <label for="txt-email">{{ __('Email Address') }}<sup>*</sup></label>
                        <input class="form-control" name="email" id="txt-email" type="email" value="{{ old('email') }}" placeholder="{{ __('Please enter your email address') }}">
                        @if ($errors->has('email'))
                            <span class="text-danger">{{ $errors->first('email') }}</span>
                        @endif
                    </div>
                    <div class="form-group">
                        <label for="txt-password">{{ __('Password') }} <sup>*</sup></label>
                            <input class="form-control" type="password" name="password" id="txt-password" placeholder="{{ __('Please enter your password') }}">
                        @if ($errors->has('password'))
                            <span class="text-danger">{{ $errors->first('password') }}</span>
                        @endif
                    </div>
                    <div class="form-group">
                        <label for="txt-password-confirmation">{{ __('Password confirmation') }} <sup>*</sup></label>
                        <input class="form-control" type="password" name="password_confirmation" id="txt-password-confirmation" placeholder="{{ __('Please enter your password confirmation') }}">
                        @if ($errors->has('password_confirmation'))
                            <span class="text-danger">{{ $errors->first('password_confirmation') }}</span>
                        @endif
                    </div>
                </div>
                <div class="form__actions">
                    <button type="submit" class="btn--custom btn--rounded btn--outline">{{ __('Submit') }}</button>
                </div>
                @if (session('status'))
                    <div class="text-success">
                        {{ session('status') }}
                    </div>
                @endif
            </form>
        </section>
    </div>
</main>
