<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
 <div class="page-header">
  <div class="container-fluid">
    
  <div class="pull-right">
  <?php if ($save_and_stay) { ?>
  <a class="btn btn-success" onclick="$('#save').val('stay');$('#form-faq').submit();"><i class="fa fa-check"></i> <?php echo $button_save_stay; ?></a>
  <?php } ?>
  <button type="submit" form="form-faq" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
  <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
  </div>
  
      	<h1><?php echo $heading_title; ?></h1>
      	<ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
       </ul>
      </div>
     </div>
    <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
     <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-faq" class="form-horizontal">
        <input type="hidden" name="save" id="save" value="0">
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          
          <div class="form-group" style="margin-bottom:30px;">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
                <input name="name" id="input-name" class="form-control" value="<?php echo $name; ?>" />
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-template"><?php echo $entry_template; ?></label>
            <div class="col-sm-10">
              <select name="template" id="input-template" class="form-control">
                <?php if ($template == 'plain') { ?>
                <option value="plain" selected="selected"><?php echo $text_plain; ?></option>
                <?php } else { ?>
                <option value="plain"><?php echo $text_plain; ?></option>
                <?php } ?>
                <?php if ($template == 'info1') { ?>
                <option value="info1" selected="selected"><?php echo $text_info1; ?></option>
                <?php } else { ?>
                <option value="info1"><?php echo $text_info1; ?></option>
                <?php } ?>
                <?php if ($template == 'info2') { ?>
                <option value="info2" selected="selected"><?php echo $text_info2; ?></option>
                <?php } else { ?>
                <option value="info2"><?php echo $text_info2; ?></option>
                <?php } ?>
                <?php if ($template == 'action1') { ?>
                <option value="action1" selected="selected"><?php echo $text_action1; ?></option>
                <?php } else { ?>
                <option value="action1"><?php echo $text_action1; ?></option>
                <?php } ?>
                <?php if ($template == 'action2') { ?>
                <option value="action2" selected="selected"><?php echo $text_action2; ?></option>
                <?php } else { ?>
                <option value="action2"><?php echo $text_action2; ?></option>
                <?php } ?>
              </select>
				<div id="template-info" class="alert alert-info" style="display:<?php if ($template == 'action2') { echo 'block'; } else { echo 'none'; } ?>"><?php echo $text_action2_help; ?></div>
            </div>
          </div>
          
          
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-template"><?php echo $entry_columns; ?></label>
            <div class="col-sm-10">
              <select name="columns" id="input-status" class="form-control">
                <?php if ($columns == 'column-1') { ?>
                <option value="column-1" selected="selected"><?php echo $text_col1; ?></option>
                <?php } else { ?>
                <option value="column-1"><?php echo $text_col1; ?></option>
                <?php } ?>
                <?php if ($columns == 'column-2') { ?>
                <option value="column-2" selected="selected"><?php echo $text_col2; ?></option>
                <?php } else { ?>
                <option value="column-2"><?php echo $text_col2; ?></option>
                <?php } ?>
                <?php if ($columns == 'column-3') { ?>
                <option value="column-3" selected="selected"><?php echo $text_col3; ?></option>
                <?php } else { ?>
                <option value="column-3"><?php echo $text_col3; ?></option>
                <?php } ?>
                <?php if ($columns == 'column-4') { ?>
                <option value="column-4" selected="selected"><?php echo $text_col4; ?></option>
                <?php } else { ?>
                <option value="column-4"><?php echo $text_col4; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          
          <div class="form-group">
          <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
          <div class="col-sm-10">
          <?php foreach ($languages as $language) { ?>
          <div class="input-group">
          <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['language_id']; ?>" /></span>
          <input type="text" class="form-control" name="module_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($module_title[$language['language_id']]) ? $module_title[$language['language_id']] : ''; ?>" />
		  </div>
		  <?php } ?>
          </div>
          </div> <!-- form-group ends -->

          
          <legend><h3 style="font-size:20px">Content Blocks</h3></legend>
          
        <div class="row">
            
         <div class="col-sm-2">
      		<ul class="nav nav-pills nav-stacked" id="section">
        		
                <?php $section_row = 1; ?>
                
                <?php foreach ($sections as $section) { ?>
        		<li><a href="#tab-section-<?php echo $section_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-section-<?php echo $section_row; ?>\']').parent().remove(); $('#tab-section-<?php echo $section_row; ?>').remove(); $('#section a:first').tab('show');"></i> <?php echo $tab_section . ' ' . $section_row; ?></a></li>
        		<?php $section_row++; ?>
        		<?php } ?>
        		<li id="section-add" style="cursor:pointer"><a onclick="addSection();"><i class="fa fa-plus-circle"></i> <?php echo $text_add_section; ?></a></li> 
        	</ul>
        </div>
      
      	<div class="col-sm-10">
        
        
        <div class="tab-content first">
        <?php $section_row = 1; ?>
      	<?php foreach ($sections as $section) { ?>
           
		<div class="tab-pane" id="tab-section-<?php echo $section_row; ?>">
		<div class="tab-content">

          	<div id="language-<?php echo $section_row; ?>">
                  <ul class="nav nav-tabs" id="language<?php echo $section_row; ?>">
                    <?php foreach ($languages as $language) { ?>
                    <li><a href="#tab-section-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                 </div>
               
               <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="tab-section-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>">
                
                <div class="form-vertical">
                
                <div class="control-group">
          		<label class="control-label"><?php echo $text_section_title; ?></label>
          		<div class="controls">
       	  		<input type="text" class="form-control" name="sections[<?php echo $section_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($section['title'][$language['language_id']]) ? $section['title'][$language['language_id']] : ''; ?>" />         
          		</div>
          		</div> <!-- form-group ends -->
                
                <div class="control-group">
                  <label class="control-label"><?php echo $text_input_block; ?></label>
                  <div class="controls">
                  <textarea class="form-control custom-control block_content" cols="3" name="sections[<?php echo $section_row; ?>][block][<?php echo $language['language_id']; ?>]" id="description-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($section['block'][$language['language_id']]) ? $section['block'][$language['language_id']] : ''; ?></textarea>
                  </div>
                 </div> <!-- form-group ends -->

                </div> 
                
               </div>
              <?php } ?>
             </div>



          
          
          
          
          
          
            
         </div> <!-- tab-content ends -->
      	<?php $section_row++; ?>
      	</div>
      	<?php } ?> <!-- foreach sections ends -->
      
       </div>
      </div> <!-- col-sm-10 ends -->
      
     </form>
    </div>
   </div>
  </div>
 </div>
</div>

<script type="text/javascript"><!--
var section_row = <?php echo $section_row; ?>;

function addSection() {	

   	html  = '<div class="tab-pane" id="tab-section-' + section_row + '">';
	html += '<div class="tab-content">';
	html += '<div id="language-' + section_row + '">';
	html += '<ul class="nav nav-tabs" id="language-' + section_row + '">';
	<?php foreach ($languages as $language) { ?>
	html += '<li><a href="#tab-section-' + section_row + '-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>';
	<?php } ?>
	html += '</ul>';
    html += '</div>';
	html += '<div class="tab-content">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="tab-pane" id="tab-section-' + section_row + '-<?php echo $language['language_id']; ?>">';
	html += '<div class="form-vertical">';
	html += '<div class="control-group">';
	html += '<label class="control-label"><?php echo $text_section_title; ?></label>';
	html += '<div class="controls">';
	html += '<input type="text" name="sections[' + section_row + '][title][<?php echo $language['language_id']; ?>]" class="form-control"/>';
	html += '</div>';
	html += '</div>';
	html += '<div class="control-group">';
	html += '<label class="control-label"><?php echo $text_input_block; ?></label>';
	html += '<div class="controls">';
	html += '<textarea name="sections[' + section_row + '][block][<?php echo $language['language_id']; ?>]" id="description-' + section_row + '-<?php echo $language['language_id']; ?>" class="form-control custom-control block_content" cols="3"></textarea>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	html += '</div>';
	<?php } ?>
	html += '</div>';
	html += '</div>';
	html += '</div>';        

	$('.tab-content.first').append(html);
		
	$('#section-add').before('<li><a href="#tab-section-' + section_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-section-' + section_row + '\\\']\').parent().remove(); $(\'#tab-section-' + section_row + '\').remove(); $(\'#section a:first\').tab(\'show\');"></i> <?php echo $tab_section; ?> ' + section_row + '</a></li>');
	
	$('#section a[href=\'#tab-section-' + section_row + '\']').tab('show');
	
	<?php foreach ($languages as $language) { ?>
	$('.tab-pane li:first-child a').tab('show');
	<?php } ?>
	
	section_row++;
	
	$('.block_content').focus(function( ){
		var element = this;
		$(element).summernote({
			
			height: 300,
			toolbar: [
				['style', ['style']],
				['font', ['bold', 'underline', 'clear']],
				['fontname', ['fontname']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['table', ['table']],
				['insert', ['link', 'image', 'video']],
				['view', ['fullscreen', 'codeview', 'help']]
			],
			buttons: {
    			image: function() {
					var ui = $.summernote.ui;
					// create button
					var button = ui.button({
						contents: '<i class="fa fa-image" />',
						tooltip: $.summernote.lang[$.summernote.options.lang].image.image,
						click: function () {
							$('#modal-image').remove();
							$.ajax({
								url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
								dataType: 'html',
								beforeSend: function() {
									$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
									$('#button-image').prop('disabled', true);
								},
								complete: function() {
									$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
									$('#button-image').prop('disabled', false);
								},
								success: function(html) {
									$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
									$('#modal-image').modal('show');
									$('#modal-image a.thumbnail').on('click', function(e) {
										e.preventDefault();
										$(element).summernote('insertImage', $(this).attr('href'));
										$('#modal-image').modal('hide');
								});}});}});
				return button.render();
		}}});});
		
}
//--></script>


<script type="text/javascript"><!--
$('#section li:first-child a').tab('show');
//--></script>

<script type="text/javascript"><!--
<?php $section_row = 1; ?>
<?php $group_row = 0; ?>
<?php foreach ($sections as $section) { ?>
$('#language<?php echo $section_row; ?> li:first-child a').tab('show');
<?php $section_row++; ?>
<?php } ?> 
//--></script> 

<script type="text/javascript">
$('.block_content').focus(function( ){
		var element = this;
		$(element).summernote({
			disableDragAndDrop: true,
			height: 300,
			toolbar: [
				['style', ['style']],
				['font', ['bold', 'underline', 'clear']],
				['fontname', ['fontname']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['table', ['table']],
				['insert', ['link', 'image', 'video']],
				['view', ['fullscreen', 'codeview', 'help']]
			],
			buttons: {
    			image: function() {
					var ui = $.summernote.ui;
					// create button
					var button = ui.button({
						contents: '<i class="fa fa-image" />',
						tooltip: $.summernote.lang[$.summernote.options.lang].image.image,
						click: function () {
							$('#modal-image').remove();
							$.ajax({
								url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
								dataType: 'html',
								beforeSend: function() {
									$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
									$('#button-image').prop('disabled', true);
								},
								complete: function() {
									$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
									$('#button-image').prop('disabled', false);
								},
								success: function(html) {
									$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
									$('#modal-image').modal('show');
									$('#modal-image a.thumbnail').on('click', function(e) {
										e.preventDefault();
										$(element).summernote('insertImage', $(this).attr('href'));
										$('#modal-image').modal('hide');
								});}});}});
				return button.render();
		}}});});
</script>
<script type="text/javascript">
$(document).ready( function() {
  $('#input-template').bind('change', function (e) { 
    if( $('#input-template').val() == 'action2') {
      $('#template-info').show();
    }
    else{
      $('#template-info').hide();
    }         
  });
});
</script>
<style>
.form-vertical .control-group {
  margin-bottom:10px;
}

.form-vertical .control-group > label {
  text-align: left;
  margin-bottom:5px;
  padding-top:0;
}
small {font-weight:normal; font-size:11px;}
.alert {margin:5px 0;}
</style>
<?php echo $footer; ?>