@if (get_payment_setting('status', SAGEPAY_PAYMENT_METHOD_NAME) == 1)
    <li class="list-group-item">
        <input class="magic-radio js_payment_method" type="radio" name="payment_method" id="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}"
               value="{{ SAGEPAY_PAYMENT_METHOD_NAME }}" data-toggle="collapse" data-target=".payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_wrap"
               data-parent=".list_payment_method"
               @if (setting('default_payment_method') == SAGEPAY_PAYMENT_METHOD_NAME) checked @endif
        >
        <label for="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}">{{ get_payment_setting('name', SAGEPAY_PAYMENT_METHOD_NAME) }}</label>
        <div class="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_wrap payment_collapse_wrap collapse @if (setting('default_payment_method') == SAGEPAY_PAYMENT_METHOD_NAME) show @endif">
            <p>{!! get_payment_setting('description', SAGEPAY_PAYMENT_METHOD_NAME, __('The largest payment gateway aggregator in Bangladesh and a pioneer in the FinTech industry since 2010')) !!}</p>
        </div>
    </li>
@endif
