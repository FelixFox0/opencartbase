           <form class="form-horizontal">
                <div id="question"></div>
                <h2 id="ask_heading" style="margin-top:30px"><?php echo $heading_ask; ?></h2>
                
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="q_name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                    <input type="text" name="q_email" value="" id="input-email" class="form-control" />
                  </div>
                </div>
                
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-question"><?php echo $entry_question; ?></label>
                    <textarea name="q_text" rows="5" id="input-question" class="form-control"></textarea>
                    <?php if ($allow_private) { ?>
                    <span style="padding-top:10px;display:block;"><input style="margin:0 8px 0 0;vertical-align:middle;" type="checkbox" id="input-private-fake"/><i style="vertical-align:middle;font-style:normal;"><?php echo $entry_private; ?></i></span>
                    <input type="hidden" name="q_private" value="0" id="input-private"/>
                    <?php } ?>
                  </div>
                </div>
                
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-captcha_product_questions"><?php echo $entry_captcha; ?></label>
                    <input type="text" name="captcha_product_questions" value="" id="input-captcha_product_questions" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-6"> <img src="index.php?route=tool/captcha_product_questions" alt="" id="captcha_product_questions" /> </div>
                  <div class="col-sm-6 text-right"><button type="button" id="button-question" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_send; ?></button></div>
                </div>
                <br />
                <br />
              </form>
              
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#button_ask').click(function (e) {
  	e.preventDefault();
  	var pattern=/#.+/gi //use regex to get anchor(==selector)
  	var contentID = e.target.toString().match(pattern)[0]; //get anchor  
  	$('.nav-tabs a[href="'+ contentID +'"]').tab('show') ;
	
	$('html, body').animate({
        scrollTop: $("#ask_heading").offset().top
    }, 1000);
	       
});
});


$('#question').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();
$("html,body").animate({scrollTop:(($("#question").offset().top)-50)},500);
    $('#question').fadeOut(50);

    $('#question').load(this.href);

    $('#question').fadeIn(500);
});


$('#input-private-fake').on('change', function(){
   $('#input-private').val(this.checked ? 1 : 0);
});

$('#question').load('index.php?route=product/question/question_list&product_id=<?php echo $product_id; ?>');

$('#button-question').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/question/ask_question&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'q_name\']').val()) + 
			  '&email=' + encodeURIComponent($('input[name=\'q_email\']').val()) + 
			  '&text=' + encodeURIComponent($('textarea[name=\'q_text\']').val()) + 
			  '&private=' + encodeURIComponent($('input[name=\'q_private\']').val()) + 
			  '&captcha_product_questions=' + encodeURIComponent($('input[name=\'captcha_product_questions\']').val()),
		
		beforeSend: function() {
			$('#button-question').button('loading');
		},
		complete: function() {
			$('#button-question').button('reset');
			$('#captcha_product_questions').attr('src', 'index.php?route=tool/captcha_product_questions#'+new Date().getTime());
			$('input[name=\'captcha_product_questions\']').val('');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('#question').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#question').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				$('input[name=\'q_name\']').val('');
				$('input[name=\'q_email\']').val('');
				$('textarea[name=\'q_text\']').val('');
				$('input[name=\'q_private\']:checked').prop('checked', false);
				$('input[name=\'captcha_product_questions\']').val('');
			}
		}
	});
});
//--></script> 
