$(document).ready((function(){$(document).on("keyup","#store_order_prefix",(function(e){$(e.currentTarget).val()?$(".sample-order-code-prefix").text($(e.currentTarget).val()+"-"):$(".sample-order-code-prefix").text("")})),$(document).on("keyup","#store_order_suffix",(function(e){$(e.currentTarget).val()?$(".sample-order-code-suffix").text("-"+$(e.currentTarget).val()):$(".sample-order-code-suffix").text("")}))}));
