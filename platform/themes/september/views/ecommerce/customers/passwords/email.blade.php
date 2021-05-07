<main class="page--inner">
    <div class="container">
        <section class="section--auth">
            <form class="form--auth form--login" method="POST" action="{{ route('customer.password.request') }}">
                @csrf
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
                </div>
                <div class="form__actions">
                    <button type="submit" class="btn--custom btn--rounded btn--outline">{{ __('Send Password Reset Link') }}</button>
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
