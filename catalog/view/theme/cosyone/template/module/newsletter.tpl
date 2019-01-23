<?php if (($style) == ('box')) { ?>
<div class="box newsletter boxed primary_background">
<div class="inner">
  <div class="box-content">
  <span class="heading"><?php echo $heading_title; ?></span>
  <p><?php echo $entry_email; ?></p>
          <div class="subscribe_form">
          <input type="text" value="" placeholder="<?php echo $text_email; ?>" name="email" id="newsletter_email<?php echo $module; ?>" class="form-control" />
          <a class="subscribe_icon" id="button-newsletter<?php echo $module; ?>"><i class="fa fa-envelope"></i></a>
          </div>
          </div>
	</div>
    </div>

<?php } else if (($style) == ('default')) { ?>
<div class="box newsletter">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
  <p class="contrast_font intro"><?php echo $entry_email; ?></p>
             <input type="text" value="" placeholder="<?php echo $text_email; ?>" name="email" id="newsletter_email<?php echo $module; ?>" class="form-control" />
             <a class="button" id="button-newsletter<?php echo $module; ?>"><span><?php echo $button_join; ?></span></a>
	</div>
</div>

<?php } else if (($style) == ('popup')) { ?>
<div class="init_popup">
<div style="display: none;" class="window_holder">
<div class="window_content primary_border">
<div class="box newsletter boxed popup">
<div class="inner primary_background">
<a class="popup_close">X</a>
  <div class="box-content">
  	<div class="popup_block">
  	<?php echo $block; ?>
  	</div>
      <div class="subscribe_form field">
      <input type="text" value="" placeholder="<?php echo $text_email; ?>" name="email" id="newsletter_email<?php echo $module; ?>" />
      </div>
      <a class="button" id="button-newsletter<?php echo $module; ?>"><span><?php echo $button_join; ?></span></a>
 	</div>
</div>
</div>
</div>
</div>
</div>
<div class="popup_mask popup_close" style="display: none;"></div>

<?php if(!isset($_COOKIE['newsletter_already_popup'])) { ?>
<script type="text/javascript">
$(document).ready(function() {	
if ($(window).width() > 760) {
	setTimeout(function() {	
		$('.popup_mask').fadeTo(750,0.5);	
		$('.window_holder').show();
		setTimeout(function() { $('.window_holder').addClass('active'); }, 750);
	}, <?php echo $popup_delay_time; ?>);
		
	$('.popup_close').click(function () {
		$('.popup_mask').hide();
		$('.window_holder').hide();
	});	
};
<?php if ($show_once) { ?>
$.cookie( 'newsletter_already_popup' , 1 , { expires: 14 , path: '/' });
<?php } ?>
});
</script>
<?php } ?>

<?php } ?>
<script type="text/javascript"><!--
$('#button-newsletter<?php echo $module; ?>').on('click', function() {
	$.ajax({
		url: 'index.php?route=module/newsletter/validate',
		type: 'post',
		data: $('#newsletter_email<?php echo $module; ?>'),
		dataType: 'json',
		/*beforeSend: function() {
			$('#button-newsletter').prop('disabled', true);
			$('#button-newsletter').after('<i class="fa fa-spinner"></i>');
		},	
		complete: function() {
			$('#button-newsletter').prop('disabled', false);
			$('.fa-spinner').remove();
		},*/		
		success: function(json) {
			if (json['error']) {
				alert(json['error']['warning']);
			} else {
				alert(json['success']);
				
				$('#newsletter_email').val('');
			}
		}
	});	
});	
/*$('#newsletter_email').on('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-newsletter').trigger('click');
	}
});*/
//--></script> 