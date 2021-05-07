(function ($) {
    'use strict';

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function number_format(number, decimals, dec_point, thousands_sep) {
        let n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            toFixedFix = function (n, prec) {
                // Fix for IE parseFloat(0.55).toFixed(0) = 0;
                let k = Math.pow(10, prec);
                return Math.round(n * k) / k;
            },
            s = (prec ? toFixedFix(n, prec) : Math.round(n)).toString().split('.');

        if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }

        if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
        }
        return s.join(dec);
    }

    function filterSlider() {
        $('.nonlinear').each(function (index, element) {
            let $element = $(element);
            let min = $element.data('min');
            let max = $element.data('max');
            let $wrapper = $(element).closest('.nonlinear-wrapper');
            noUiSlider.create(element, {
                connect: true,
                behaviour: 'tap',
                start: [$wrapper.find('.product-filter-item-price-0').val(), $wrapper.find('.product-filter-item-price-1').val()],
                step: (max / 10),
                range: {
                    min: min,
                    '10%': max * 0.1,
                    '20%': max * 0.2,
                    '30%': max * 0.3,
                    '40%': max * 0.4,
                    '50%': max * 0.5,
                    '60%': max * 0.6,
                    '70%': max * 0.7,
                    '80%': max * 0.8,
                    '90%': max * 0.9,
                    max: max
                },
            });

            let nodes = [
                $('.ps-slider__min'),
                $('.ps-slider__max')
            ];

            var currentExchangeRate = parseFloat($('div[data-current-exchange-rate]').data('current-exchange-rate'));

            element.noUiSlider.on('update', function (values, handle) {
                nodes[handle].html(number_format(Math.round(values[handle] * currentExchangeRate)));
            });

            element.noUiSlider.on('end', function (values, handle) {
                $wrapper.find('.product-filter-item-price-' + handle).val(Math.round(values[handle] * currentExchangeRate));
                $wrapper.find('.product-filter-item').closest('form').submit();
            });
        });
    }

    $(document).ready(function () {

        $('.block--method input[name=method]').on('change', function () {
            $(this)
                .closest('.block--method')
                .addClass('active');
            $(this)
                .closest('.block--method')
                .find('.block__content')
                .slideDown();
            $(this)
                .closest('.block--method')
                .siblings('.block--method')
                .removeClass('active');
            $(this)
                .closest('.block--method')
                .siblings('.block--method')
                .find('.block__content')
                .slideUp();
        });
        filterSlider();

        let handleError = function (data, form) {
            if (typeof (data.errors) !== 'undefined' && !_.isArray(data.errors)) {
                handleValidationError(data.errors, form);
            } else if (typeof (data.responseJSON) !== 'undefined') {
                if (typeof (data.responseJSON.errors) !== 'undefined' && data.status === 422) {
                    handleValidationError(data.responseJSON.errors, form);
                } else if (typeof (data.responseJSON.message) !== 'undefined') {
                    $(form).find('.error-message').html(data.responseJSON.message).show();
                } else {
                    let message = '';
                    $.each(data.responseJSON, (index, el) => {
                        $.each(el, (key, item) => {
                            message += item + '<br />';
                        });
                    });

                    $(form).find('.error-message').html(message).show();
                }
            } else {
                $(form).find('.error-message').html(data.statusText).show();
            }
        };

        let handleValidationError = function (errors, form) {
            let message = '';
            $.each(errors, (index, item) => {
                message += item + '<br />';
            });

            $(form).find('.success-message').html('').hide();
            $(form).find('.error-message').html('').hide();

            $(form).find('.error-message').html(message).show();
        };

        window.showAlert = (messageType, message) => {
            if (messageType && message !== '') {
                let alertId = Math.floor(Math.random() * 1000);

                let html = `<div class="alert ${messageType} alert-dismissible" id="${alertId}">
                            <span class="close feather icon-x" data-dismiss="alert" aria-label="close"></span>
                            <i class="feather icon-` + (messageType === 'alert-success' ? 'check-circle': 'alert-circle') + ` message-icon"></i>
                            ${message}
                        </div>`;

                $('#alert-container').append(html).ready(() => {
                    window.setTimeout(() => {
                        $(`#alert-container #${alertId}`).remove();
                    }, 6000);
                });
            }
        }

        $(document).on('click', '.generic-form button[type=submit]', function (event) {
            event.preventDefault();
            event.stopPropagation();
            let buttonText = $(this).html();
            $(this).prop('disabled', true).addClass('btn-disabled').html('<i class="fa fa-spin fa-spinner"></i>');

            $.ajax({
                type: 'POST',
                cache: false,
                url: $(this).closest('form').prop('action'),
                data: new FormData($(this).closest('form')[0]),
                contentType: false,
                processData: false,
                success: res => {
                    $(this).closest('form').find('.success-message').html('').hide();
                    $(this).closest('form').find('.error-message').html('').hide();

                    if (!res.error) {
                        $(this).closest('form').find('input[type=email]').val('');
                        $(this).closest('form').find('input[type=text]').val('');

                        $(this).closest('form').find('.success-message').html(res.message).show();

                        setTimeout(function () {
                            $(this).closest('form').find('.success-message').html('').hide();
                        }, 5000);
                    } else {
                        $(this).closest('form').find('.error-message').html(res.message).show();

                        setTimeout(function () {
                            $(this).closest('form').find('.error-message').html('').hide();
                        }, 5000);
                    }

                    $(this).prop('disabled', false).removeClass('btn-disabled').html(buttonText);
                },
                error: res => {
                    $(this).prop('disabled', false).removeClass('btn-disabled').html(buttonText);
                    handleError(res, $(this).closest('form'));
                }
            });
        });

        $(document).ready(function () {
            window.onBeforeChangeSwatches = function () {
                $('.add-to-cart-form button[type=submit]').prop('disabled', true).addClass('btn-disabled');
            }

            window.onChangeSwatchesSuccess = function (res) {
                $('.add-to-cart-form .error-message').hide();
                $('.add-to-cart-form .success-message').hide();
                if (res.error) {
                    $('.add-to-cart-form button[type=submit]').prop('disabled', true).addClass('btn-disabled');
                    $('.number-items-available').html('<span class="text-danger">(' + res.message + ')</span>').show();
                    $('.hidden-product-id').val('');
                } else {
                    $('.add-to-cart-form').find('.error-message').hide();
                    $('.product__price .product-sale-price-text').text(res.data.display_sale_price);
                    if (res.data.sale_price !== res.data.price) {
                        $('.product__price .product-price-text').text(res.data.display_price).show();
                    } else {
                        $('.product__price .product-price-text').text(res.data.display_price).hide();
                    }

                    $('.hidden-product-id').val(res.data.id);
                    $('.add-to-cart-form button[type=submit]').prop('disabled', false).removeClass('btn-disabled');
                    $('.number-items-available').html('<span class="text-success">(' + res.message + ')</span>').show();

                    let imageHtml = '';
                    res.data.image_with_sizes.origin.forEach(function (item) {
                        imageHtml += '<div class="item"><img src="' + item + '" alt="image"/></div>'
                    });

                    let thumbHtml = '';
                    res.data.image_with_sizes.thumb.forEach(function (item) {
                        thumbHtml += '<div class="item"><img src="' + item + '" alt="image"/></div>'
                    });

                    let product = $('.product--detail');
                    let primary = product.find('.product__gallery');
                    let second = product.find('.product__thumbs');

                    primary.slick('unslick');
                    second.slick('unslick');

                    primary.html(imageHtml);
                    second.html(thumbHtml);

                    primary.slick({
                        slidesToShow: 1,
                        slidesToScroll: 1,
                        asNavFor: '.product__thumbs',
                        fade: true,
                        dots: false,
                        infinite: false,
                        arrows: primary.data('arrow'),
                        prevArrow: '<a href="#"><i class="fa fa-angle-left"></i></a>',
                        nextArrow: '<a href="#"><i class="fa fa-angle-right"></i></a>'
                    });

                    second.slick({
                        slidesToShow: second.data('item'),
                        slidesToScroll: 1,
                        infinite: false,
                        arrows: second.data('arrow'),
                        focusOnSelect: true,
                        prevArrow: '<a href="#"><i class="fa fa-angle-up"></i></a>',
                        nextArrow: '<a href="#"><i class="fa fa-angle-down"></i></a>',
                        asNavFor: '.product__gallery',
                        vertical: true,
                        responsive: [
                            {
                                breakpoint: 1200,
                                settings: {
                                    arrows: second.data('arrow'),
                                    slidesToShow: 4,
                                    vertical: false,
                                    prevArrow: '<a href="#"><i class="fa fa-angle-left"></i></a>',
                                    nextArrow: '<a href="#"><i class="fa fa-angle-right"></i></a>'
                                }
                            },
                            {
                                breakpoint: 992,
                                settings: {
                                    arrows: second.data('arrow'),
                                    slidesToShow: 4,
                                    vertical: false,
                                    prevArrow: '<a href="#"><i class="fa fa-angle-left"></i></a>',
                                    nextArrow: '<a href="#"><i class="fa fa-angle-right"></i></a>'
                                }
                            },
                            {
                                breakpoint: 480,
                                settings: {
                                    slidesToShow: 3,
                                    vertical: false,
                                    prevArrow: '<a href="#"><i class="fa fa-angle-left"></i></a>',
                                    nextArrow: '<a href="#"><i class="fa fa-angle-right"></i></a>'
                                }
                            }
                        ]
                    });

                    $(window).trigger('resize');
                }
            };

            $(document).on('click', '.add-to-cart-button', function (event) {
                event.preventDefault();
                let _self = $(this);

                let buttonText = _self.html();
                _self.prop('disabled', true).addClass('btn-disabled').html('<i class="fa fa-spin fa-spinner"></i>');

                $.ajax({
                    url: _self.prop('href'),
                    method: 'POST',
                    data: {
                        id: _self.data('id')
                    },
                    dataType: 'json',
                    success: function (res) {
                        _self.prop('disabled', false).removeClass('btn-disabled').html(buttonText);

                        if (res.error) {
                            window.showAlert('alert-danger', res.message);
                            return false;
                        }

                        if (_self.prop('name') === 'checkout' && res.data.next_url !== undefined) {
                            window.location.href = res.data.next_url;
                        } else {
                            $.ajax({
                                url: window.siteUrl + '/ajax/cart',
                                method: 'GET',
                                success: function (response) {
                                    if (!response.error) {
                                        $('#panel-cart .panel__content').html(response.data.html);
                                        $('.btn-shopping-cart.panel-trigger span').text(response.data.count);
                                        $('.btn-shopping-cart.panel-trigger').trigger('click');
                                    }
                                }
                            });
                        }
                    },
                    error: res => {
                        _self.prop('disabled', false).removeClass('btn-disabled').html(buttonText);
                        window.showAlert('alert-danger', res.message);
                    }
                });
            });

            $(document).on('click', '.add-to-cart-form button[type=submit]', function (event) {
                event.preventDefault();
                event.stopPropagation();

                let _self = $(this);

                if (!$('.hidden-product-id').val()) {
                    _self.prop('disabled', true).addClass('btn-disabled');
                    return;
                }

                let buttonText = _self.html();
                _self.prop('disabled', true).addClass('btn-disabled').html('<i class="fa fa-spin fa-spinner"></i>');

                _self.closest('form').find('.error-message').hide();
                _self.closest('form').find('.success-message').hide();

                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: _self.closest('form').prop('action'),
                    data: new FormData(_self.closest('form')[0]),
                    contentType: false,
                    processData: false,
                    success: res => {
                        _self.prop('disabled', false).removeClass('btn-disabled').html(buttonText);

                        if (res.error) {
                            _self.closest('form').find('.error-message').html(res.message).show();
                            return false;
                        }

                        _self.closest('form').find('.success-message').html(res.message).show();

                        if (_self.prop('name') === 'checkout' && res.data.next_url !== undefined) {
                            window.location.href = res.data.next_url;
                        } else {
                            $.ajax({
                                url: window.siteUrl + '/ajax/cart',
                                method: 'GET',
                                success: function (response) {
                                    if (!response.error) {
                                        $('#panel-cart .panel__content').html(response.data.html);
                                        $('.btn-shopping-cart.panel-trigger span').text(response.data.count);
                                        $('.btn-shopping-cart.panel-trigger').trigger('click');
                                    }
                                }
                            });
                        }
                    },
                    error: res => {
                        _self.prop('disabled', false).removeClass('btn-disabled').html(buttonText);
                        handleError(res, _self.closest('form'));
                    }
                });
            });

            $(document).on('click', '.add-to-wishlist-button', function (event) {
                event.preventDefault();
                let _self = $(this);

                let buttonText = $(this).html();
                _self.html('<i class="fa fa-spin fa-spinner"></i>');

                $.ajax({
                    url: _self.prop('href'),
                    method: 'POST',
                    success: res => {

                        if (res.error) {
                            _self.html(buttonText);
                            window.showAlert('alert-danger', res.message);
                            return false;
                        }

                        window.showAlert('alert-success', res.message);

                        $('.btn-shopping-cart.btn-wishlist span').text(res.data.count);

                        _self.html('<i class="fa fa-heart"></i><span>' + _self.data('added-text') + '</span>')
                            .addClass('remove-from-wishlist-button')
                            .removeClass('add-to-wishlist-button')
                    },
                    error: res => {
                        _self.html(buttonText);
                        window.showAlert('alert-danger', res.message);
                    }
                });
            });


            $(document).on('click', '.remove-from-wishlist-button', function (event) {
                event.preventDefault();
                let _self = $(this);

                let buttonText = $(this).html();
                _self.html('<i class="fa fa-spin fa-spinner"></i>');

                $.ajax({
                    url: _self.prop('href'),
                    method: 'DELETE',
                    success: res => {

                        if (res.error) {
                            _self.html(buttonText);
                            window.showAlert('alert-danger', res.message);
                            return false;
                        }

                        window.showAlert('alert-success', res.message);

                        $('.btn-shopping-cart.btn-wishlist span').text(res.data.count);

                        _self.html('<i class="fa fa-heart-o"></i><span>' + _self.data('add-text') + '</span>')
                            .removeClass('remove-from-wishlist-button')
                            .addClass('add-to-wishlist-button')
                    },
                    error: res => {
                        _self.html(buttonText);
                        window.showAlert('alert-danger', res.message);
                    }
                });
            });

            $(document).on('change', '.shop__sort select', function () {
                $(this).closest('form').submit();
            });

            $(document).on('change', '.product-filter-item', function () {
                $(this).closest('form').submit();
            });

            $(document).on('click', '.form--review-product button[type=submit]', function (event) {
                event.preventDefault();
                event.stopPropagation();
                let buttonText = $(this).html();
                $(this).prop('disabled', true).addClass('btn-disabled').html('<i class="fa fa-spin fa-spinner"></i>');

                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: $(this).closest('form').prop('action'),
                    data: new FormData($(this).closest('form')[0]),
                    contentType: false,
                    processData: false,
                    success: res => {
                        $(this).closest('form').find('.success-message').html('').hide();
                        $(this).closest('form').find('.error-message').html('').hide();

                        if (!res.error) {
                            $(this).closest('form').find('select').val(0);
                            $(this).closest('form').find('textarea').val('');

                            $(this).closest('form').find('.success-message').html(res.message).show();

                            $.ajax({
                                url: window.siteUrl + '/ajax/reviews/' + $(this).closest('form').find('input[name=product_id]').val(),
                                method: 'GET',
                                success: function (response) {
                                    if (!response.error) {
                                        $('.block--product-reviews .block__content').html(response.data.html);

                                        $(document).find('select.rating').each(function () {
                                            let readOnly = $(this).attr('data-read-only') === 'true';
                                            $(this).barrating({
                                                theme: 'fontawesome-stars',
                                                readonly: readOnly,
                                                emptyValue: '0'
                                            });
                                        });
                                    }
                                }
                            });

                            setTimeout(function () {
                                $(this).closest('form').find('.success-message').html('').hide();
                            }, 5000);
                        } else {
                            $(this).closest('form').find('.error-message').html(res.message).show();

                            setTimeout(function () {
                                $(this).closest('form').find('.error-message').html('').hide();
                            }, 5000);
                        }

                        $(this).prop('disabled', false).removeClass('btn-disabled').html(buttonText);
                    },
                    error: res => {
                        $(this).prop('disabled', false).removeClass('btn-disabled').html(buttonText);
                        handleError(res, $(this).closest('form'));
                    }
                });
            });

        });

        $('.product__qty .up').on('click', function (event) {
            event.preventDefault();
            let currentVal = parseInt($(this).next('.qty-input').val(), 10);
            $(this).next('.qty-input').val(currentVal + 1);
        });

        $('.product__qty .down').on('click', function (event) {
            event.preventDefault();
            let currentVal = parseInt($(this).prev('.qty-input').val(), 10);
            if (currentVal > 0) {
                $(this).prev('.qty-input').val(currentVal - 1);
            }
        });

        $(document).on('click', '.remove-cart-button', function (event) {
            event.preventDefault();

            $('.confirm-remove-item-cart').data('url', $(this).prop('href'));
            $('#remove-item-modal').modal('show');
        });


        $(document).on('click', '.confirm-remove-item-cart', function (event) {
            event.preventDefault();
            let _self = $(this);

            let buttonText = _self.html();
            _self.prop('disabled', true).addClass('btn-disabled').html('<i class="fa fa-spin fa-spinner"></i>');

            $.ajax({
                url: _self.data('url'),
                method: 'GET',
                success: function (res) {
                    _self.prop('disabled', false).removeClass('btn-disabled').html(buttonText);

                    if (res.error) {
                        window.showAlert('alert-danger', res.message);
                        return false;
                    }

                    _self.closest('.modal').modal('hide');

                    if ($('.section--shopping-cart').length) {
                        $('.section--shopping-cart').load(window.location.href + ' .section--shopping-cart > *');
                    }

                    $.ajax({
                        url: window.siteUrl + '/ajax/cart',
                        method: 'GET',
                        success: function (response) {
                            if (!response.error) {
                                $('#panel-cart .panel__content').html(response.data.html);
                                $('.btn-shopping-cart.panel-trigger span').text(response.data.count);
                            }
                        }
                    });
                },
                error: res => {
                    _self.prop('disabled', false).removeClass('btn-disabled').html(buttonText);
                    window.showAlert('alert-danger', res.message);
                }
            });
        });

        $(document).on('click', '.js-add-to-wishlist-button', function (event) {
            event.preventDefault();
            let _self = $(this);

            let buttonHtml = $(this).html();

            _self.html('<i class="fa fa-spin fa-spinner"></i>');

            $.ajax({
                url: _self.prop('href'),
                method: 'POST',
                success: res => {

                    if (res.error) {
                        _self.html(buttonHtml);
                        window.showAlert('alert-danger', res.message);
                        return false;
                    }

                    window.showAlert('alert-success', res.message);

                    $('.btn-shopping-cart.btn-wishlist span').text(res.data.count);

                    _self.html('<i class="fa fa-heart"></i>').removeClass('js-add-to-wishlist-button').addClass('js-remove-from-wishlist-button active');
                },
                error: res => {
                    _self.html(buttonHtml);
                    window.showAlert('alert-danger', res.message);
                }
            });
        });


        $(document).on('click', '.js-remove-from-wishlist-button', function (event) {
            event.preventDefault();
            let _self = $(this);

            let buttonHtml = $(this).html();
            _self.html('<i class="fa fa-spin fa-spinner"></i>');

            $.ajax({
                url: _self.prop('href'),
                method: 'DELETE',
                success: res => {

                    if (res.error) {
                        _self.html(buttonHtml);
                        window.showAlert('alert-danger', res.message);
                        return false;
                    }

                    $('.btn-shopping-cart.btn-wishlist span').text(res.data.count);

                    _self.closest('tr').remove();
                    _self.html('<i class="fa fa-heart-o"></i>').removeClass('js-remove-from-wishlist-button active').addClass('js-add-to-wishlist-button');
                },
                error: res => {
                    _self.html(buttonHtml);
                    window.showAlert('alert-danger', res.message);
                }
            });
        });

    });

})(jQuery);
