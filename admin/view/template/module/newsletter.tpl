<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    
    <?php if (!$newsletter_global_status) { ?>
  	<p class="alert alert-danger"><?php echo $warning_off; ?></p>
    <?php } ?>
    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-globe"></i> <?php echo $heading_global; ?></h3>
      </div>
      <div class="panel-body">
      <form action="<?php echo $action_global; ?>" method="post" id="global" class="form-horizontal">
      <div class="form-group">
		<label class="col-sm-2 control-label" for="input-newsletter_global_status"><?php echo $entry_status; ?></label>
		<div class="col-sm-10">
		<select name="newsletter_global_status" id="input-newsletter_global_status" class="form-control">
		<option value="1"<?php echo $newsletter_global_status ? ' selected="selected"' : ''; ?>><?php echo $text_enabled; ?></option>
		<option value="0"<?php echo $newsletter_global_status ? '' : ' selected="selected"'; ?>><?php echo $text_disabled; ?></option>
		</select>
		</div>
		</div>
		<div class="text-right">
		<button type="submit" form="global" class="btn btn-default"><?php echo $button_save_global; ?></button>  
		</div>
	</form>
	</div>
	</div>
    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
		  
		  <div class="tab-content">
            
              
            <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-style"><?php echo $entry_style; ?></label>
            <div class="col-sm-10">
              <select name="style" id="input-style" class="form-control">
                <?php if ($style == 'default') { ?>
                <option value="default" selected="selected"><?php echo $text_style_default; ?></option>
                <?php } else { ?>
                <option value="default"><?php echo $text_style_default; ?></option>
                <?php } ?>
                <?php if ($style == 'box') { ?>
                <option value="box" selected="selected"><?php echo $text_box; ?></option>
                <?php } else { ?>
                <option value="box"><?php echo $text_box; ?></option>
                <?php } ?>
                <?php if ($style == 'popup') { ?>
                <option value="popup" selected="selected"><?php echo $text_popup; ?></option>
                <?php } else { ?>
                <option value="popup"><?php echo $text_popup; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          
          
          <div id="popup-settings" style="display:<?php if ($style == 'popup') { echo 'block'; } else { echo 'none'; } ?>">
          
          <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-10">
              <legend><h3 style="margin-top:20px;"><?php echo $heading_popup; ?></h3></legend>
            </div>
            </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-style"><span data-toggle="tooltip" title="<?php echo $help_show_once; ?>"><?php echo $entry_show_once; ?></span></label>
            <div class="col-sm-10">
              <select name="show_once" id="input-show_once" class="form-control">
                <?php if ($show_once) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><span data-toggle="tooltip" title="<?php echo $help_delay; ?>"><?php echo $entry_delay; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="delay" value="<?php echo $delay; ?>" placeholder="<?php echo $entry_delay; ?>" id="input-delay" class="form-control" />
            </div>
          </div>
          
          
          
          <?php foreach ($languages as $language) { ?>
          <div class="form-group">
           <label class="col-sm-2 control-label" for="input-block<?php echo $language['language_id']; ?>"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <span data-toggle="tooltip" title="<?php echo $help_block; ?>"><?php echo $entry_block; ?></span></label>
             <div class="col-sm-10">
                    <textarea name="block[<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_block; ?>" id="input-block<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($block[$language['language_id']]) ? $block[$language['language_id']] : ''; ?></textarea>
                  </div>
                </div>
               <?php } ?>
               
               </div><!-- Popup settings ends -->
          
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
          

			
			
		  </div>
		</form>
      </div>
    </div>
	
  </div>
</div>

<script type="text/javascript"><!--//
<?php foreach ($languages as $language) { ?>
$('#input-block<?php echo $language['language_id']; ?>').summernote({height: 200});
<?php } ?>
//--></script>
<script type="text/javascript"><!--//
$(document).ready( function() {
  $('#input-style').bind('change', function (e) { 
    if( $('#input-style').val() == 'popup') {
      $('#popup-settings').show();
    }
    else{
      $('#popup-settings').hide();
    }         
  });
});
//--></script>
<?php echo $footer; ?>