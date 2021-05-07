@php $sagepayStatus = get_payment_setting('status', SAGEPAY_PAYMENT_METHOD_NAME); @endphp
<table class="table payment-method-item">
    <tbody>
    <tr class="border-pay-row">
        <td class="border-pay-col"><i class="fa fa-theme-payments"></i></td>
        <td style="width: 20%;">
            <img class="filter-black" src="{{ url('vendor/core/plugins/sagepay/images/sagepay.png') }}"
                 alt="Sagepay">
        </td>
        <td class="border-right">
            <ul>
                <li>
                    <a href="https://sagepay.com" target="_blank">{{ __('Sagepay') }}</a>
                    <p>{{ __('Customer can buy product and pay directly using Visa, Credit card via :name', ['name' => 'Sagepay']) }}</p>
                </li>
            </ul>
        </td>
    </tr>
    </tbody>
    <tbody class="border-none-t">
    <tr class="bg-white">
        <td colspan="3">
            <div class="float-left" style="margin-top: 5px;">
                <div
                    class="payment-name-label-group @if (get_payment_setting('status', SAGEPAY_PAYMENT_METHOD_NAME) == 0) hidden @endif">
                    <span class="payment-note v-a-t">{{ trans('plugins/payment::payment.use') }}:</span> <label
                        class="ws-nm inline-display method-name-label">{{ get_payment_setting('name', SAGEPAY_PAYMENT_METHOD_NAME, __('Online payment via Sagepay')) }}</label>
                </div>
            </div>
            <div class="float-right">
                <a class="btn btn-secondary toggle-payment-item edit-payment-item-btn-trigger @if ($sagepayStatus == 0) hidden @endif">{{ trans('plugins/payment::payment.edit') }}</a>
                <a class="btn btn-secondary toggle-payment-item save-payment-item-btn-trigger @if ($sagepayStatus == 1) hidden @endif">{{ trans('plugins/payment::payment.settings') }}</a>
            </div>
        </td>
    </tr>
    <tr class="paypal-online-payment payment-content-item hidden">
        <td class="border-left" colspan="3">
            {!! Form::open() !!}
            {!! Form::hidden('type', SAGEPAY_PAYMENT_METHOD_NAME, ['class' => 'payment_type']) !!}
            <div class="row">
                <div class="col-sm-6">
                    <ul>
                        <li>
                            <label>{{ trans('plugins/payment::payment.configuration_instruction', ['name' => 'Sagepay']) }}</label>
                        </li>
                        <li class="payment-note">
                            <p>{{ trans('plugins/payment::payment.configuration_requirement', ['name' => 'Sagepay']) }}
                                :</p>
                            <ul class="m-md-l" style="list-style-type:decimal">
                                <li style="list-style-type:decimal">
                                    <p>For registration in Sandbox, click the link <a
                                            href="https://developer.sagepay.com/registration/" target="_blank">https://developer.sagepay.com/registration/</a></p>
                                    <p>For registration in Production, click the link <a
                                            href="https://signup.sagepay.com/register" target="_blank">https://signup.sagepay.com/register</a></p>
                                </li>
                                <li style="list-style-type:decimal">
                                    <p>{{ __('After registration at :name, you will have Vendor Name and Store Password (API/Secret key)', ['name' => 'Sagepay']) }}</p>
                                </li>
                                <li style="list-style-type:decimal">
                                    <p>{{ __('Enter Vendor Name and Store Password (API/Secret key) into the box in right hand') }}</p>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-6">
                    <div class="well bg-white">
                        <div class="form-group">
                            <label class="text-title-field"
                                   for="sagepay_name">{{ trans('plugins/payment::payment.method_name') }}</label>
                            <input type="text" class="next-input" name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_name"
                                   id="sagepay_name" data-counter="400"
                                   value="{{ get_payment_setting('name', SAGEPAY_PAYMENT_METHOD_NAME, __('Online payment via Sagepay')) }}">
                        </div>
                        <div class="form-group">
                            <label class="text-title-field" for="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_description">{{ __('Description') }}</label>
                            <textarea class="next-input" name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_description" id="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_description">{{ get_payment_setting('description', SAGEPAY_PAYMENT_METHOD_NAME, __('The largest payment gateway aggregator in Bangladesh and a pioneer in the FinTech industry since 2010')) }}</textarea>
                        </div>
                        <p class="payment-note">
                            {{ trans('plugins/payment::payment.please_provide_information') }} <a target="_blank" href="https://sagepay.com">Sagepay</a>:
                        </p>
                        <div class="form-group">
                            <label class="text-title-field" for="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_vendor_id">{{ __('Vendor Name') }}</label>
                            <input type="text" class="next-input"
                                   name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_vendor_id" id="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_vendor_id"
                                   value="{{ get_payment_setting('vendor_id', SAGEPAY_PAYMENT_METHOD_NAME) }}">
                        </div>
                        <div class="form-group">
                            <label class="text-title-field" for="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_public_secret_id">{{ __('Public Secret ID') }}</label>
                            <input type="text" class="next-input"
                                   name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_public_secret_id" id="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_public_secret_id"
                                   value="{{ get_payment_setting('public_secret_id', SAGEPAY_PAYMENT_METHOD_NAME) }}">
                        </div>
                        <div class="form-group">
                            <label class="text-title-field" for="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_private_secret_id">{{ __('Private Key (API/Secret key)') }}</label>
                            <input type="password" class="next-input"
                                   name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_private_secret_id" id="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_private_secret_id"
                                   value="{{ get_payment_setting('private_secret_id', SAGEPAY_PAYMENT_METHOD_NAME) }}">
                        </div>
                        <div class="form-group">
                            <label class="text-title-field" for="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_callback_url">{{ __('Callback URL') }}</label>
                            <input type="text" class="next-input" readonly
                                   name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_callback_url" id="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_callback_url"
                                   value="{{ route('sagepay.payment.callback') }}">
                        </div>
                        <p class="payment-note">
                            {{ __('You will need to set Callback URL on') }}
                            <a href="https://dashboard.sagepay.com/#/settings/developer">https://dashboard.sagepay.com/#/settings/developer</a>
                            {{ __('to') }}
                            <strong><code>{{ route('sagepay.payment.callback') }}</code></strong>
                        </p>
                        <div class="form-group">
                            {!! Form::hidden('payment_' . SAGEPAY_PAYMENT_METHOD_NAME . '_mode', 1) !!}
                            <label class="next-label">
                                <input type="checkbox" class="hrv-checkbox" value="0" name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_mode" @if (setting('payment_' . SAGEPAY_PAYMENT_METHOD_NAME . '_mode') == 0) checked @endif>
                                {{ trans('plugins/payment::payment.sandbox_mode') }}
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 bg-white text-right">
                <button class="btn btn-warning disable-payment-item @if ($sagepayStatus == 0) hidden @endif"
                        type="button">{{ trans('plugins/payment::payment.deactivate') }}</button>
                <button
                    class="btn btn-info save-payment-item btn-text-trigger-save @if ($sagepayStatus == 1) hidden @endif"
                    type="button">{{ trans('plugins/payment::payment.activate') }}</button>
                <button
                    class="btn btn-info save-payment-item btn-text-trigger-update @if ($sagepayStatus == 0) hidden @endif"
                    type="button">{{ trans('plugins/payment::payment.update') }}</button>
            </div>
            {!! Form::close() !!}
        </td>
    </tr>
    </tbody>
</table>

{{--@php $sagepayStatus = get_payment_setting('status', SAGEPAY_PAYMENT_METHOD_NAME); @endphp--}}
{{--<table class="table payment-method-item">--}}
{{--    <tbody>--}}
{{--    <tr class="border-pay-row">--}}
{{--        <td class="border-pay-col"><i class="fa fa-theme-payments"></i></td>--}}
{{--        <td style="width: 20%;">--}}
{{--            <img class="filter-black" src="{{ url('vendor/core/plugins/sagepay/images/sagepay.png') }}"--}}
{{--                 alt="Sagepay">--}}
{{--        </td>--}}
{{--        <td class="border-right">--}}
{{--            <ul>--}}
{{--                <li>--}}
{{--                    <a href="https://sagepay.com" target="_blank">{{ __('Sagepay') }}</a>--}}
{{--                    <p>{{ __('Customer can buy product and pay directly using Visa, Credit card via :name', ['name' => 'Sagepay']) }}</p>--}}
{{--                </li>--}}
{{--            </ul>--}}
{{--        </td>--}}
{{--    </tr>--}}
{{--    </tbody>--}}
{{--    <tbody class="border-none-t">--}}
{{--    <tr class="bg-white">--}}
{{--        <td colspan="3">--}}
{{--            <div class="float-left" style="margin-top: 5px;">--}}
{{--                <div--}}
{{--                    class="payment-name-label-group @if (get_payment_setting('status', SAGEPAY_PAYMENT_METHOD_NAME) == 0) hidden @endif">--}}
{{--                    <span class="payment-note v-a-t">{{ trans('plugins/payment::payment.use') }}:</span> <label--}}
{{--                        class="ws-nm inline-display method-name-label">{{ get_payment_setting('name', SAGEPAY_PAYMENT_METHOD_NAME) }}</label>--}}
{{--                </div>--}}
{{--            </div>--}}
{{--            <div class="float-right">--}}
{{--                <a class="btn btn-secondary toggle-payment-item edit-payment-item-btn-trigger @if ($sagepayStatus == 0) hidden @endif">{{ trans('plugins/payment::payment.edit') }}</a>--}}
{{--                <a class="btn btn-secondary toggle-payment-item save-payment-item-btn-trigger @if ($sagepayStatus == 1) hidden @endif">{{ trans('plugins/payment::payment.settings') }}</a>--}}
{{--            </div>--}}
{{--        </td>--}}
{{--    </tr>--}}
{{--    <tr class="paypal-online-payment payment-content-item hidden">--}}
{{--        <td class="border-left" colspan="3">--}}
{{--            {!! Form::open() !!}--}}
{{--            {!! Form::hidden('type', SAGEPAY_PAYMENT_METHOD_NAME, ['class' => 'payment_type']) !!}--}}
{{--            <div class="row">--}}
{{--                <div class="col-sm-6">--}}
{{--                    <ul>--}}
{{--                        <li>--}}
{{--                            <label>{{ trans('plugins/payment::payment.configuration_instruction', ['name' => 'Sagepay']) }}</label>--}}
{{--                        </li>--}}
{{--                        <li class="payment-note">--}}
{{--                            <p>{{ trans('plugins/payment::payment.configuration_requirement', ['name' => 'Sagepay']) }}--}}
{{--                                :</p>--}}
{{--                            <ul class="m-md-l" style="list-style-type:decimal">--}}
{{--                                <li style="list-style-type:decimal">--}}
{{--                                    <a href="https://sagepay.com" target="_blank">--}}
{{--                                        {{ __('Register an account on :name', ['name' => 'Sagepay']) }}--}}
{{--                                    </a>--}}
{{--                                </li>--}}
{{--                                <li style="list-style-type:decimal">--}}
{{--                                    <p>{{ __('After registration at :name, you will have Public & Secret keys', ['name' => 'Sagepay']) }}</p>--}}
{{--                                </li>--}}
{{--                                <li style="list-style-type:decimal">--}}
{{--                                    <p>{{ __('Enter Public, Secret into the box in right hand') }}</p>--}}
{{--                                </li>--}}
{{--                            </ul>--}}
{{--                        </li>--}}
{{--                    </ul>--}}
{{--                </div>--}}
{{--                <div class="col-sm-6">--}}
{{--                    <div class="well bg-white">--}}
{{--                        <div class="form-group">--}}
{{--                            <label class="text-title-field"--}}
{{--                                   for="sagepay_name">{{ trans('plugins/payment::payment.method_name') }}</label>--}}
{{--                            <input type="text" class="next-input" name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_name"--}}
{{--                                   id="sagepay_name" data-counter="400"--}}
{{--                                   value="{{ get_payment_setting('name', SAGEPAY_PAYMENT_METHOD_NAME, __('Online payment via :name', ['name' => 'Sagepay'])) }}">--}}
{{--                        </div>--}}

{{--                        <div class="form-group">--}}
{{--                            <label class="text-title-field" for="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_description">{{ __('Description') }}</label>--}}
{{--                            <textarea class="next-input" name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_description" id="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_description">{{ get_payment_setting('description', SAGEPAY_PAYMENT_METHOD_NAME, __('Payment with Sagepay')) }}</textarea>--}}
{{--                        </div>--}}

{{--                        <p class="payment-note">--}}
{{--                            {{ trans('plugins/payment::payment.please_provide_information') }} <a target="_blank" href="https://sagepay.com/">Sagepay</a>:--}}
{{--                        </p>--}}
{{--                        --}}{{-- Main Keys --}}
{{--                        <div class="form-group">--}}
{{--                            <label class="text-title-field" for="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_vendor_name">{{ __('Vendor Name') }}</label>--}}
{{--                            <input type="text" class="next-input"--}}
{{--                                   name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_vendor_name" id="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_vendor_name"--}}
{{--                                   value="{{ get_payment_setting('vendor_name', SAGEPAY_PAYMENT_METHOD_NAME) }}">--}}
{{--                        </div>--}}
{{--                        <div class="form-group">--}}
{{--                            <label class="text-title-field" for="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_public">{{ __('Integration Key') }}</label>--}}
{{--                            <input type="text" class="next-input"--}}
{{--                                   name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_public" id="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_public"--}}
{{--                                   value="{{ get_payment_setting('public', SAGEPAY_PAYMENT_METHOD_NAME) }}">--}}
{{--                        </div>--}}
{{--                        <div class="form-group">--}}
{{--                            <label class="text-title-field" for="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_secret">{{ __('Integration Password') }}</label>--}}
{{--                            <input type="password" class="next-input" placeholder="••••••••" id="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_secret"--}}
{{--                                   name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_secret"--}}
{{--                                   value="{{ get_payment_setting('secret', SAGEPAY_PAYMENT_METHOD_NAME) }}">--}}
{{--                        </div>--}}
{{--                        <div class="form-group">--}}
{{--                            <label class="text-title-field" for="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_return_url">{{ __('Return Url') }}</label>--}}
{{--                            <input type="email" class="next-input" placeholder="{{ __('ReturnUrl') }}" id="{{ SAGEPAY_PAYMENT_METHOD_NAME }}_return_url"--}}
{{--                                   name="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_return_url"--}}
{{--                                   value="{{ get_payment_setting('return_url', SAGEPAY_PAYMENT_METHOD_NAME) }}">--}}
{{--                        </div>--}}

{{--                        <p class="payment-note">--}}
{{--                            {{ __('You will need to set Callback URL on') }} <a href="https://dashboard.sagepay.com/#/settings/developer">https://dashboard.sagepay.com/#/settings/developer</a> {{ __('to') }} <strong><code>{{ route('sagepay.payment.callback') }}</code></strong>--}}
{{--                        </p>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}
{{--            <div class="col-12 bg-white text-right">--}}
{{--                <button class="btn btn-warning disable-payment-item @if ($sagepayStatus == 0) hidden @endif"--}}
{{--                        type="button">{{ trans('plugins/payment::payment.deactivate') }}</button>--}}
{{--                <button--}}
{{--                    class="btn btn-info save-payment-item btn-text-trigger-save @if ($sagepayStatus == 1) hidden @endif"--}}
{{--                    type="button">{{ trans('plugins/payment::payment.activate') }}</button>--}}
{{--                <button--}}
{{--                    class="btn btn-info save-payment-item btn-text-trigger-update @if ($sagepayStatus == 0) hidden @endif"--}}
{{--                    type="button">{{ trans('plugins/payment::payment.update') }}</button>--}}
{{--            </div>--}}
{{--            {!! Form::close() !!}--}}
{{--        </td>--}}
{{--    </tr>--}}
{{--    </tbody>--}}
{{--</table>--}}
