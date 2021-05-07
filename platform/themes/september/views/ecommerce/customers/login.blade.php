 <main class="page--inner">
     <div class="container">
         <section class="section--auth">
             <form class="form--auth form--login" method="POST" action="{{ route('customer.login.post') }}">
                 @csrf
                 <div class="form__header">
                     <h3>{{ __('Login') }}</h3>
                     <p>{{ __('Please enter your email address and password') }}</p>
                 </div>
                 <div class="form__content">
                     <div class="form-group">
                         <label for="txt-email">{{ __('Email Address') }} <sup>*</sup></label>
                         <input class="form-control" name="email" id="txt-email" type="email" value="{{ old('email') }}" placeholder="{{ __('Please enter your email address') }}">
                         @if ($errors->has('email'))
                             <span class="text-danger">{{ $errors->first('email') }}</span>
                         @endif
                     </div>
                     <div class="form-group">
                         <label for="txt-password">{{ __('Password') }} <sup>*</sup></label>
                         <div class="form__password">
                             <input class="form-control" type="password" name="password" id="txt-password" placeholder="{{ __('Please enter your password') }}"><a href="{{ route('customer.password.reset') }}">{{ __('Forgot password?') }}</a>
                         </div>
                         @if ($errors->has('password'))
                             <span class="text-danger">{{ $errors->first('password') }}</span>
                         @endif
                     </div>
                     <div class="form-group">
                         <div class="ps-checkbox">
                             <input class="form-control" type="checkbox" name="remember" id="remember-me">
                             <label for="remember-me">{{ __('Remember me') }}</label>
                         </div>
                     </div>
                 </div>
                 <div class="form__actions">
                     <p>{{ __('Don\'t have an account?') }} <a href="{{ route('customer.register') }}">{{ __('Create one') }}</a></p>
                     <button type="submit" class="btn--custom btn--rounded btn--outline">{{ __('Login') }}</button>
                 </div>

                 <div class="text-center">
                     {!! apply_filters(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, null, \Botble\Ecommerce\Models\Customer::class) !!}
                 </div>
             </form>
         </section>
     </div>
 </main>
