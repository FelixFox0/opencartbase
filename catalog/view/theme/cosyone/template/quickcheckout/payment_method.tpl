<?php if ($error_warning) { ?>
<div class="alert alert-danger"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<?php
$exists = false;
foreach ($payment_methods as $payment_method) {
	if ($payment_method['code'] == $code) {
		$exists = true;
		break;
	}
}
?>
<p><?php echo $text_payment_method; ?></p>
<?php if ($payment) { ?>
<table class="table payment">
  <?php foreach ($payment_methods as $payment_method) { ?>
  <tr class="highlight">
    <td style="width:22px">
    <?php if ($payment_method['code'] == $code || !$code || !$exists) { ?>
      <?php $code = $payment_method['code']; ?>
	  <?php $exists = true; ?>
      <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
      <?php } else { ?>
      <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
      <?php } ?></td>
    <td valign="middle">
    <label for="<?php echo $payment_method['code']; ?>"><?php if (($payment_logo) && file_exists(DIR_APPLICATION . 'view/theme/default/image/payment/' . $payment_method['code'] . '.png')) { ?>
	<img style="vertical-align:middle;display:inline-block" src="<?php echo HTTPS_SERVER . 'catalog/view/theme/default/image/payment/' . $payment_method['code'] . '.png'; ?>" alt="<?php echo $payment_method['title']; ?>" />&nbsp;
	<?php } ?><?php echo $payment_method['title']; ?></label></td>
	
  </tr>
  <?php } ?>
</table>
<?php } else { ?>
  <select name="payment_method" class="form-control">
  <?php foreach ($payment_methods as $payment_method) { ?>
	<?php if ($payment_method['code'] == $code || !$code || !$exists) { ?>
      <?php $code = $payment_method['code']; ?>
	  <?php $exists = true; ?>
      <option value="<?php echo $payment_method['code']; ?>" selected="selected">
      <?php } else { ?>
      <option value="<?php echo $payment_method['code']; ?>">
      <?php } ?>
    <?php echo $payment_method['title']; ?></option>
  <?php } ?>
  </select><br />
<?php } ?>

<?php } ?>
<?php if ($survey_survey) { ?>
<div<?php echo $survey_required ? ' class="required"' : ''; ?>>
  <label class="control-label"><?php echo $text_survey; ?></label>
  <?php if ($survey_type) { ?>
  <select name="survey" class="form-control"><?php foreach ($survey_answers as $survey_answer) { ?>
    <?php if (!empty($survey_answer[$language_id])) { ?>
	  <?php if ($survey == $survey_answer[$language_id]) { ?>
      <option value="<?php echo $survey_answer[$language_id]; ?>" selected="selected"><?php echo $survey_answer[$language_id]; ?></option>
      <?php } else { ?>
	  <option value="<?php echo $survey_answer[$language_id]; ?>"><?php echo $survey_answer[$language_id]; ?></option>
      <?php } ?>
	<?php } ?>
  <?php } ?></select><br />
  <?php } else { ?>
  <textarea name="survey" class="form-control" rows="5"><?php echo $survey; ?></textarea><br />
  <?php } ?>
</div>
<?php } else { ?>
<textarea name="survey" class="hide"><?php echo $survey; ?></textarea>
<?php } ?>
<span class="contrast_font input_heading"><?php echo $text_comments; ?></span>
<textarea name="comment" rows="5" class="form-control"><?php echo $comment; ?></textarea>

<script type="text/javascript"><!--
$('#payment-method input[name=\'payment_method\'], #payment-method select[name=\'payment_method\']').on('change', function() {
	<?php if (!$logged) { ?>
		$.ajax({
			url: 'index.php?route=quickcheckout/payment_method/set',
			type: 'post',
			data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select, #payment-method input[type=\'text\'], #payment-method input[type=\'checkbox\']:checked, #payment-method input[type=\'radio\']:checked, #payment-method input[type=\'hidden\'], #payment-method select'),
			dataType: 'html',
			cache: false,
			success: function(html) {
				<?php if ($cart && $payment_reload) { ?>
				loadCart();
				<?php } ?>
			},
			<?php if ($debug) { ?>
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
			<?php } ?>
		});
	<?php } else { ?>
		if ($('#payment-address input[name=\'payment_address\']').val() == 'new') {
			$.ajax({
				url: 'index.php?route=quickcheckout/payment_method/set',
				type: 'post',
				data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select, #payment-method input[type=\'text\'], #payment-method input[type=\'checkbox\']:checked, #payment-method input[type=\'radio\']:checked, #payment-method input[type=\'hidden\'], #payment-method select'),
				dataType: 'html',
				cache: false,
				success: function(html) {
					<?php if ($cart && $payment_reload) { ?>
					loadCart();
					<?php } ?>
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		} else {
			$.ajax({
				url: 'index.php?route=quickcheckout/payment_method/set&address_id=' + $('#payment-address select[name=\'address_id\']').val(),
				type: 'post',
				data: $('#payment-method input[type=\'text\'], #payment-method input[type=\'checkbox\']:checked, #payment-method input[type=\'radio\']:checked, #payment-method input[type=\'hidden\'], #payment-method select'),
				dataType: 'html',
				cache: false,
				success: function(html) {
					<?php if ($cart && $payment_reload) { ?>
					loadCart();
					<?php } ?>
				},
				<?php if ($debug) { ?>
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
				<?php } ?>
			});
		}
	<?php } ?>
});

<?php if ($payment_reload) { ?>
$(document).ready(function() {
	$('#payment-method input[name=\'payment_method\']:checked, #payment-method select[name=\'payment_method\']').trigger('change');
});
<?php } ?>
//--></script>