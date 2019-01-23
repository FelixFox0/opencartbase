<!-- Cookie Control -->
<?php if((!isset($_COOKIE['cookie_check'])) && $cosyone_use_cookie){ ?>
<div class="bar cookie">
<div class="bar_background"></div>
<div class="container">
<span class="message">
<?php echo $cosyone_cookie_message; ?>
</span>
<a href="<?php echo $cosyone_readmore_url; ?>" class="bar_button button read_more"><?php echo $cosyone_readmore_text; ?></a>
<a class="bar_button button active"><?php echo $cosyone_button_accept_text; ?></a>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$.cookie( 'cookie_check' , 1 , { expires: 365 , path: '/' });
	$('.bar_button.button.active').click(function() {
		$('.bar').fadeOut(300);
	});
});
</script>
<?php } ?>

<!-- Old IE Control -->
<?php if(isset( $_SERVER['HTTP_USER_AGENT'])){ ?>
<?php if((preg_match('/(?i)msie [2-8]/',$_SERVER['HTTP_USER_AGENT'])) && $cosyone_use_ie) { ?>
<div class="bar ie">
<div class="container">
<span class="message">
<?php echo $cosyone_ie_message; ?>
</span>
<?php if (COSYONE_IE_URL) { ?>
<a href="<?php echo $cosyone_ie_url; ?>" target="_blank" class="bar_button button active"><?php echo $cosyone_ie_update_message; ?></a>
<?php } ?>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
		$('.bar.cookie').hide();
});
</script>
<?php } ?>
<?php } ?>