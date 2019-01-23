<?php if ($coupon_module) { ?>
<div id="coupon-heading" class="contrast_font"><?php echo $entry_coupon; ?></div>
<div id="coupon-content">
	<input type="text" name="coupon" value="" />
	  <button type="button" id="button-coupon" class="button"><?php echo $text_use_coupon; ?></button>
</div>
<?php } ?>
<?php if ($voucher_module) { ?>
<div id="voucher-heading" class="contrast_font"><?php echo $entry_voucher; ?></div>
<div id="voucher-content">
	<input type="text" name="voucher" value="" />
	  <button type="button" id="button-voucher" class="button"><?php echo $text_use_voucher; ?></button>
</div>
<?php } ?>
<?php if ($reward_module && $reward) { ?>
<div id="reward-heading" class="contrast_font"><?php echo $entry_reward; ?></div>
<div id="reward-content">
	<input type="text" name="reward" value="" />
	  <button type="button" id="button-reward" class="button"><?php echo $text_use_reward; ?></button>
</div>
<?php } ?>

<script type="text/javascript"><!--
$('#coupon-heading').on('click', function() {
    if($('#coupon-content').is(':visible')){
      $('#coupon-content').slideUp('slow');
    } else {
      $('#coupon-content').slideDown('slow');
    };
});

$('#voucher-heading').on('click', function() {
    if($('#voucher-content').is(':visible')){
      $('#voucher-content').slideUp('slow');
    } else {
      $('#voucher-content').slideDown('slow');
    };
});

$('#reward-heading').on('click', function() {
    if($('#reward-content').is(':visible')){
      $('#reward-content').slideUp('slow');
    } else {
      $('#reward-content').slideDown('slow');
    };
});
//--></script>