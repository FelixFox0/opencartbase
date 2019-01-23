<!-- Custom css -->
<?php if ($custom_css) { ?>
<style>
<?php echo $custom_css_content; ?>
</style>
<?php } ?>
<!-- Custom script -->
<?php if ($custom_javascript) { ?>
<script type="text/javascript">
$(document).ready(function() {
<?php echo $custom_javascript_content; ?>
});
</script>
<?php } ?>

<!-- Custom styling -->
<?php if ($custom_style) { ?>
<?php if ($cosyone_custom_bg_icon) { ?>
<style>  
body { background-image:url('image/<?php echo $cosyone_custom_bg_icon;; ?>');}
</style>
<?php } else {?>
<style>  
body { background-image:url('catalog/view/theme/cosyone/image/patterns/<?php echo $cosyone_body_image; ?>');}
</style> 
<?php }; ?>

<style>
/* body */
body { background-color:#<?php echo $cosyone_body_background; ?>;}
.outer_container { box-shadow:0px 0px 25px rgba(0, 0, 0, 0.1); }
/* top line */
.header_top_line_wrapper {
	background:#<?php echo $cosyone_top_border_background; ?>;
	border-color:#<?php echo $cosyone_top_border_border; ?>;
}
.header_top_line {
	color:#<?php echo $cosyone_top_border_text; ?>;
}
.promo_message a, 
.header_top_line .links a,
.header_top_line .login_drop_heading .log_link,
.header_top_line .currency_current .head, 
.header_top_line .language_current .head {
	color:#<?php echo $cosyone_top_border_link; ?>;
}
.header_top_line a:hover, .header_top_line b {
	color:#<?php echo $cosyone_top_border_link_hover; ?>;
}
.shortcut .shortcut_heading i {
	border-color:#<?php echo $cosyone_shortcut_separator; ?>;
}
#menu {
	background:#<?php echo $cosyone_menu_background; ?>;
}
#menu > ul > li > a, .mobile_menu_trigger,
#menu .shortcut .shortcut_heading i,
#menu .shortcut .shortcut_heading .count,
#menu .shortcut .shortcut_heading .total {
	color:#<?php echo $cosyone_menu_link_color; ?>;
}
#menu > ul > li:hover > a,
#menu > ul > li.current > a,
#menu #cart:hover .shortcut_heading .count,
#menu #cart:hover .shortcut_heading i,
#menu #cart:hover .shortcut_heading .total,
.mobile_menu_trigger, 
.mobile_menu_trigger:hover {
	color:#<?php echo $cosyone_menu_link_color_hover; ?>;
}
#menu > ul > li:hover > a,
#menu > ul > li.current > a,
#menu #cart.shortcut:hover .shortcut_heading,
.mobile_menu_trigger, 
.mobile_menu_trigger:hover {
	background-color:#<?php echo $cosyone_menu_link_background_hover; ?>;
}
.header_main .button-search:hover,
.rich_banner .primary_background .inner .button:hover,
.box.custom.info2 .box-single i.fa,
.rich_banner .info_wrapper a,
.wishlist .shortcut_heading:hover i, 
.compare .shortcut_heading:hover i,
.box.newsletter.boxed.popup .inner .button:hover {
	color:#<?php echo $cosyone_primary_color; ?>;
}
.primary_background,
.rich_banner .info_wrapper span:before,
.box.custom.info1 .box-single i.fa,
#cart.shortcut:hover .shortcut_heading {
	background-color:#<?php echo $cosyone_primary_color; ?>;
}
.box.custom.info1 .box-content, 
.box.custom.info1 .box-single, 
.primary_border {
	border-color:#<?php echo $cosyone_primary_color; ?> !important;
}
.secondary_background,
.box.custom.action1 .box-content,
a.button.second,
a.button.quickview:hover {
	background-color:#<?php echo $cosyone_secondary_color; ?>;
}
.contrast_color,
.box.custom.action2 .box-content .left,
.box.custom.action1 .box-content .button,
a.button.second:hover,
.rich_banner .secondary_background .inner .button:hover,
.cart-total tr:last-child td, 
.cart-total #total tr:last-child > td:last-child,
table.radio tr.highlight td:nth-child(3) label,
.cart-info tr.confirm_totals:last-child td {
	color:#<?php echo $cosyone_secondary_color; ?>;
}
a.button.second:hover {
	border-color:#<?php echo $cosyone_secondary_color; ?>;
}
#main .offer_background,
.product-info .hascountdown,
.deals .hascountdown,
.deals_wrapper .owl-page.active {
	background:#<?php echo $cosyone_offer_color; ?>;
}
.deals_heading, .extended_offer .price-save {
	color:#<?php echo $cosyone_offer_color; ?>;
}
.deals_wrapper, .deals_wrapper .owl-page {
	border-color:#<?php echo $cosyone_offer_color; ?>;
}
/* link hover */
a:hover,
.product-filter a:hover,
.top_header_drop_down a:hover, 
.top_header_drop_down .current, 
#login.top_header_drop_down a.forgotten:hover {
	color:#<?php echo $cosyone_link_hover_color; ?>;
}
/* sale badge */
.sale_badge {
	background-color:#<?php echo $cosyone_salebadge_background; ?>;
}
/* price */
.price, .price-new {
	color:#<?php echo $cosyone_price_color; ?>;
}
/* icon hover color */
.icon:hover, .slide_arrow_next:hover, .slide_arrow_prev:hover, #cboxprevious:hover:after, #cboxnext:hover:after, #cboxclose:hover:after, #list_view_icon.active, #list_view_icon:hover, #grid_view_icon.active, #grid_view_icon:hover, .currency_current:hover, .language_current:hover, .login_drop_heading:hover, .login_drop_heading.active {
	background:#<?php echo $cosyone_icons_background_hover; ?>;
}
/* buttons */
/* default button */
a.button, input.button, button.button {
	background-color:#<?php echo $cosyone_button_background; ?>;
	color:#<?php echo $cosyone_button_color; ?>;
	border-color:#<?php echo $cosyone_button_border; ?>;
}
a.button:hover, input.button:hover, button.button:hover {
	background-color:#<?php echo $cosyone_button_hover_background; ?>;
	color:#<?php echo $cosyone_button_hover_color; ?>;
	border-color:#<?php echo $cosyone_button_hover_border; ?>;
}
/* cart/contrast buttons */
a.button.contrast, .button.contrast, .sq_icon.contrast, input.button.contrast,
a.button.active, input.button.active, #button-confirm, .style-2 .add_to_cart { 
	background-color:#<?php echo $cosyone_button2_background; ?>;
	color:#<?php echo $cosyone_button2_color; ?>;
	border-color:#<?php echo $cosyone_button2_border; ?>;
}
a.button.contrast:hover, .button.contrast:hover, .sq_icon.contrast:hover, input.button.contrast:hover,
a.button.active:hover, input.button.active:hover, #button-confirm:hover, .style-2 .add_to_cart:hover { 
	background-color:#<?php echo $cosyone_button2_hover_background; ?>;
	color:#<?php echo $cosyone_button2_hover_color; ?>;
	border-color:#<?php echo $cosyone_button2_hover_border; ?>;
}
</style>
<?php } ?>
<!-- Custom fonts -->
<?php if($custom_style_font){ ?>
<style>
body, input, textarea, select, .main_font, .buttons, #menu li.custom_block .menu_drop_down p, .sale_badge, small, .sq_icon, .radio label, .checkbox label, .text-danger {
<?php echo $cosyone_font1_name; ?>
}
.contrast_font, .control-label, .checkout-content, .box-content ul, .button, .btn, h1, h2, h3, h4, h5, .heading, .price, .title, .box-heading, #menu, .mobile_menu, .nav-tabs a, .cart-info tbody .name a, .checkout-heading {
<?php echo $cosyone_font2_name; ?>
}
body, input, textarea, select, .buttons, #menu li.custom_block .menu_drop_down p, .sale_badge, small, .sq_icon, .light_font, h1, .heading, .box-heading, .checkout-heading, .rich_banner .inner h4, .rich_banner .info_wrapper h4, .main_font, .rich_banner .info_wrapper p a, .radio label, .checkbox label, .text-danger {
	font-weight:<?php echo $cosyone_use_font_light; ?>;
}
.contrast_font, .control-label, .checkout-content, .box-content ul, .button, h2, h3, h4, h5, .price, .title, #menu, .mobile_menu, .nav-tabs a, .cart-info tbody .name a, .price-old, .deals .hurry .items_left, .product-info h1, .product-info .hurry .items_left {
	font-weight:<?php echo $cosyone_use_font_regular; ?>;
}
.header_top_line b, .alert a, .buttons .right a, .pull-right b, p a, .agree b {
	font-weight:<?php echo $cosyone_use_font_semibold; ?>;
}
b, .checkout-content h2, .price, .bar .message, .shortcut .shortcut_heading .total, #menu .level2 > a, table.list thead td, #shipping-method table.radio td b, table.radio tr.highlight td:nth-child(3) label, li.open > a, ul.box-filter span, .item.testimonial .heading, .testimonial_list .heading, .deals .hasCountdown i, .extended_offer .amount, .compare-info tr td:first-child, .product-info .options h2, .order-detail, .cart-info tr.confirm_totals td, .cart-info thead td, .cart-total table, .checkout-product thead td, .box.custom.info2 .box-single h3, #cart .name b, #cart .mini-cart-total tr:last-child td {
	font-weight:<?php echo $cosyone_use_font_bold; ?>;
}
</style>
<?php } ?>