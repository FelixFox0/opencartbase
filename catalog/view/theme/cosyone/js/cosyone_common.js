$(window).resize(function(){
// Hide mobile menu etc on window resize
 	if ($(window).width() > 960) {
       $('.mobile_menu_wrapper').hide();
 	}
	var scroll_right = $(".container").offset().left;
	$(".scroll_to_top").css('right', (scroll_right - 100) + 'px');
});

function getURLVar(key) {
	var value = [];

	var query = String(document.location).split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}

$(document).ready(function() {
		
	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();
		
		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});
		
	// Currency
	$('#currency .currency-select').on('click', function(e) {
		e.preventDefault();

		$('#currency input[name=\'code\']').attr('value', $(this).attr('name'));

		$('#currency').submit();
	});

	// Language
	$('#language a').on('click', function(e) {
		e.preventDefault();

		$('#language input[name=\'code\']').attr('value', $(this).attr('href'));

		$('#language').submit();
	});

	
	
	/* Search */
	
		$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('#search input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('#search input[name=\'search\']').parent().find('.button-search').trigger('click');
		}
	});
	
	
	/* Mega Menu */
	$("#menu >ul >li").has("li").addClass("withsubs");
	$("#menu > ul > li > div > .wrapper > ul > li").has("li").addClass("hasthird");
			
	$('#menu .menu_drop_down').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		var dropdown_wrapper = $(this).offset();
		
		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		if (i > 0) {
			$(this).css('margin-left', '-' + i + 'px');
		}
		// RTL Version		
		var r = (menu.left - dropdown_wrapper.left);
		if (r > 0) {
			$(this).css('margin-right', '-' + r + 'px');
		}
	});
	
	// Mobile main navigation  //
		
			$('.mobile_menu_trigger').click(function() {
  			$('.mobile_menu_wrapper').slideToggle(500)
        	});           

            $('.mobile_menu li').bind().click(function(e) {
			$(this).toggleClass("open").find('>ul').stop(true, true).slideToggle(500)
            .end().siblings().find('>ul').slideUp().parent().removeClass("open");
            e.stopPropagation();
			});
			
			$('.mobile_menu li a').click(function(e) {
            e.stopPropagation();
            });
// Sticky menu preparation
			var $document = $(document),
    		$element = $('.header_wrapper')

			$document.scroll(function() {
  			$element.toggleClass('sticky', $document.scrollTop() >= 210);
			});
	
	// Move breadcrumb to header //
			$('.breadcrumb').appendTo($('.breadcrumb_wrapper'));
	
// Fix for the header login/search field
		$('.login_input').focus(function( ){
    	$('.login_drop_heading').stop(true,true).addClass('active');
  		});
		$('.login_input').focusout(function( ){
    	$('.login_drop_heading').stop(true,true).removeClass('active');
  		});
			
		$('.search_input').focus(function( ){
    	$('#search').stop(true,true).addClass('active');
  		});
		$('.search_input').focusout(function( ){
    	$('#search').stop(true,true).removeClass('active');
		$('#ajax_search_results').hide(200);
  		});	
	
		// Open external links in new tab //
	$('a.external').on('click',function(e){
        e.preventDefault();
        window.open($(this).attr('href'));
    });
	
	// Image thumb swipe  //
   $(".product-list .item, .product-grid .item").hover(function() {
         $(this).find(".image_hover").stop(true).fadeTo(600,1);
   }, function() {
         $(this).find(".image_hover").stop(true).fadeTo(300,0);
   });
   
   // Show special countdown on hover
			$('.product-list .item, .product-grid .item').mousemove(function(e) {
   			 $(this).find('.offer_popup').stop(true, true).fadeIn();
    		$(this).find('.offer_popup').offset({
        	top: e.pageY + 50,
        	left: e.pageX + 50
    		});
			}).mouseleave(function() {
   			 $('.offer_popup').fadeOut();
			});

// Scroll to top button //
			var scroll_right = $("#footer").offset().left;
			$(".scroll_to_top").css('right', (scroll_right - 100) + 'px');
	
			var windowScroll_t;
			$(window).scroll(function(){
			clearTimeout(windowScroll_t);
			windowScroll_t = setTimeout(function() {
										
				if ($(this).scrollTop() > 100)
				{ $('.scroll_to_top').addClass('active'); }
				else
				{ $('.scroll_to_top').removeClass('active'); }
			}, 200);
		});
		
			$('.scroll_top').click(function(){
			$("html, body").animate({scrollTop: 0}, 1000);
			return false;
		});

// Add contrast to footer  //
			$(".footer_modules").has(".box").addClass("contrast");
	
	
	
	
	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});
});

// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();
			
				$('#cart > button').button('reset');

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					$.colorbox({
					html:'<div class="cart_notification"><div class="product"><img src="' + json['image'] + '"/><span>' + json['success'] + '</span></div><div class="bottom"><a class="btn btn-default" href="' + json['link_cart'] + '">' + json['text_cart'] + '</a> ' + '<a class="btn btn-primary" href="' + json['link_checkout'] + '">' + json['text_checkout'] + '</a></div></div>',
					className: "notification",
					initialHeight:50,
					initialWidth:50,
					width:"90%",
					maxWidth:400,
					height:"90%",
					maxHeight:200
					});
					$('#cart').load('index.php?route=common/cart/info #cart > *'); //Added
				}
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			success: function(json) {
				$('#cart > button').button('reset');

				$('#cart-total').html(json['total']);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart').load('index.php?route=common/cart/info #cart > *'); //Added
				}
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			success: function(json) {
				$('#cart > button').button('reset');

				$('#cart-total').html(json['total']);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart').load('index.php?route=common/cart/info #cart > *'); //Added
				}
			}
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				$('#cart-total').html(json['total']);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart').load('index.php?route=common/cart/info #cart > *'); //Added
				}
			}
		});
	}
}

var wishlist = {
'add': function(product_id) {
$.ajax({
url: 'index.php?route=account/wishlist/add',
type: 'post',
data: 'product_id=' + product_id,
dataType: 'json',
success: function(json) {
$('.alert').remove();
if (json['success']) {
$.colorbox({
html:'<div class="cart_notification"><div class="product"><img src="' + json['image'] + '"/><span>' + json['success'] + '</span></div><div class="bottom"><a class="btn btn-primary" href="' + json['link_wishlist'] + '">' + json['text_wishlist'] + '</a></div></div>',
className: "notification",
initialHeight:50,
initialWidth:50,
width:"90%",
maxWidth:400,
height:"90%",
maxHeight:200
});
$('.shortcut.wishlist').load('index.php?route=common/header_wishlist_compare/info #header_wishlist');
}

if (json['info']) {
$.colorbox({
html:'<div class="cart_notification"><div class="product"><img src="' + json['image'] + '"/><span>' + json['info'] + '</span></div><div class="bottom"><a class="btn btn-primary" href="' + json['link_wishlist'] + '">' + json['text_wishlist'] + '</a></div></div>',
className: "notification",
initialHeight:50,
initialWidth:50,
width:"90%",
maxWidth:400,
height:"90%",
maxHeight:200
});
$('.shortcut.wishlist').load('index.php?route=common/header_wishlist_compare/info #header_wishlist');
}}
});
},
'remove': function() {
}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();
				if (json['success']) {
					$.colorbox({
					html:'<div class="cart_notification"><div class="product"><img src="' + json['image'] + '"/><span>' + json['success'] + '</span></div><div class="bottom"><a class="btn btn-primary" href="' + json['link_compare'] + '">' + json['text_compare'] + '</a></div></div>',
					className: "notification",
					initialHeight:50,
					initialWidth:50,
					width:"90%",
					maxWidth:400,
					height:"90%",
					maxHeight:200
					});
					$('#compare-total').html(json['total']);
					$('#header_compare').html(json['compare_total']);
				}
			}
		});
	},
	'remove': function() {

	}
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
	});
});

// Autocomplete */
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();
	
			$.extend(this, option);
	
			$(this).attr('autocomplete', 'off');
			
			// Focus
			$(this).on('focus', function() {
				this.request();
			});
			
			// Blur
			$(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);				
			});
			
			// Keydown
			$(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}				
			});
			
			// Click
			this.click = function(event) {
				event.preventDefault();
	
				value = $(event.target).parent().attr('data-value');
	
				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}
			
			// Show
			this.show = function() {
				var pos = $(this).position();
	
				$(this).siblings('ul.dropdown-menu').css({
					top: pos.top + $(this).outerHeight(),
					left: pos.left
				});
	
				$(this).siblings('ul.dropdown-menu').show();
			}
			
			// Hide
			this.hide = function() {
				$(this).siblings('ul.dropdown-menu').hide();
			}		
			
			// Request
			this.request = function() {
				clearTimeout(this.timer);
		
				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}
			
			// Response
			this.response = function(json) {
				html = '';
	
				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}
	
					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}
	
					// Get all the ones with a categories
					var category = new Array();
	
					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}
	
							category[json[i]['category']]['item'].push(json[i]);
						}
					}
	
					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';
	
						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}
	
				if (html) {
					this.show();
				} else {
					this.hide();
				}
	
				$(this).siblings('ul.dropdown-menu').html(html);
			}
			
			$(this).after('<ul class="dropdown-menu"></ul>');
			$(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));	
			
		});
	}
})(window.jQuery);