@if (get_payment_setting('status', SAGEPAY_PAYMENT_METHOD_NAME) == 1)
    <li class="list-group-item">
        <input class="magic-radio js_payment_method" type="radio" name="payment_method"
               id="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}"
               value="{{ SAGEPAY_PAYMENT_METHOD_NAME }}" data-toggle="collapse"
               data-target=".payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_wrap"
               data-parent=".list_payment_method"
               @if (setting('default_payment_method') == SAGEPAY_PAYMENT_METHOD_NAME) checked @endif
        >
        <label
            for="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}">{{ get_payment_setting('name', SAGEPAY_PAYMENT_METHOD_NAME) }}</label>
        <div
            class="payment_{{ SAGEPAY_PAYMENT_METHOD_NAME }}_wrap payment_collapse_wrap collapse @if (setting('default_payment_method') == SAGEPAY_PAYMENT_METHOD_NAME) show @endif">
            <p>{!! get_payment_setting('description', SAGEPAY_PAYMENT_METHOD_NAME, __('The largest payment gateway aggregator')) !!}</p>
        </div>
        <div class="card-checkout">
            <div class="form-group">
                <div class="stripe-card-wrapper" data-jp-card-initialized="true">
                    <div class="jp-card-container">
                        <div class="jp-card jp-card-unknown">
                            <div class="jp-card-front">
                                <div class="jp-card-logo jp-card-elo">
                                    <div class="e">e</div>
                                    <div class="l">l</div>
                                    <div class="o">o</div>
                                </div>
                                <div class="jp-card-logo jp-card-visa">visa</div>
                                <div class="jp-card-logo jp-card-mastercard">MasterCard</div>
                                <div class="jp-card-logo jp-card-maestro">Maestro</div>
                                <div class="jp-card-logo jp-card-amex"></div>
                                <div class="jp-card-logo jp-card-discover">discover</div>
                                <div class="jp-card-logo jp-card-dinersclub"></div>
                                <div class="jp-card-logo jp-card-dankort">
                                    <div class="dk">
                                        <div class="d"></div>
                                        <div class="k"></div>
                                    </div>
                                </div>
                                <div class="jp-card-lower">
                                    <div class="jp-card-shiny"></div>
                                    <div class="jp-card-cvc jp-card-display">•••</div>
                                    <div class="jp-card-number jp-card-display">•••• •••• •••• ••••</div>
                                    <div class="jp-card-name jp-card-display">{payment}</div>
                                    <div class="jp-card-expiry jp-card-display" data-before="month/year" data-after="validthru">
                                        ••/••
                                    </div>
                                </div>
                            </div>
                            <div class="jp-card-back">
                                <div class="jp-card-bar"></div>
                                <div class="jp-card-cvc jp-card-display">•••</div>
                                <div class="jp-card-shiny"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group ">
                <div class="row">
                    <div class="col-sm-9">
                        <input required placeholder="Card number" class="form-control unknown" type="text" id="{{ SAGEPAY_PAYMENT_METHOD_NAME }}-number"
                               data-{{ SAGEPAY_PAYMENT_METHOD_NAME }}="number" name="{{ SAGEPAY_PAYMENT_METHOD_NAME }}-number">
                    </div>
                    <div class="col-sm-3">
                        <input required placeholder="MM/YY" class="form-control" name="{{ SAGEPAY_PAYMENT_METHOD_NAME }}-exp" type="text" id="{{ SAGEPAY_PAYMENT_METHOD_NAME }}-exp" data-{{ SAGEPAY_PAYMENT_METHOD_NAME }}="exp">
                    </div>
                </div>
            </div>
            <div class="form-group ">
                <div class="row">
                    <div class="col-sm-9">
                        <input required placeholder="Full name" class="form-control" id="{{ SAGEPAY_PAYMENT_METHOD_NAME }}-name" type="text" name="{{ SAGEPAY_PAYMENT_METHOD_NAME }}-name"
                               data-{{ SAGEPAY_PAYMENT_METHOD_NAME }}="name">
                    </div>
                    <div class="col-sm-3">
                        <input required placeholder="CVC" class="form-control" type="text" id="{{ SAGEPAY_PAYMENT_METHOD_NAME }}-cvc" name="{{ SAGEPAY_PAYMENT_METHOD_NAME }}-cvc" data-{{ SAGEPAY_PAYMENT_METHOD_NAME }}="cvc">
                    </div>
                </div>
            </div>
        </div>
    </li>
@endif
