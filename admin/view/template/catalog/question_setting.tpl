<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-question-setting" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form method="post" enctype="multipart/form-data" id="form-question-setting" class="form-horizontal">
          

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-question_setting_status">
            <span data-toggle="tooltip" title="<?php echo $help_global_status; ?>"><?php echo $entry_global_status; ?></span>
            </label>
            <div class="col-sm-10">
              <select name="product_question_status" id="input-product_question_status" class="form-control">
                <?php if ($product_question_status) { ?>
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
            <label class="col-sm-2 control-label" for="input-product_question_default_status">
            <span data-toggle="tooltip" title="<?php echo $help_default_status; ?>"><?php echo $entry_default_status; ?></span>
            </label>
            <div class="col-sm-10">
              <select name="product_question_default_status" id="input-product_question_default_status" class="form-control">
                <?php if ($product_question_default_status) { ?>
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
            <label class="col-sm-2 control-label" for="input-product_question_allow_private">
            <span data-toggle="tooltip" title="<?php echo $help_allow_private; ?>"><?php echo $entry_allow_private; ?></span>
            </label>
            <div class="col-sm-10">
              <select name="product_question_allow_private" id="input-product_question_allow_private" class="form-control">
                <?php if ($product_question_allow_private) { ?>
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
            <label class="col-sm-2 control-label" for="input-product_question_allow_private">
            <span data-toggle="tooltip" title="<?php echo $help_questions_per_page; ?>"><?php echo $entry_questions_per_page; ?></span>
            </label>
            <div class="col-sm-10">
              <input type="text" class="form-control" value="<?php echo $product_question_per_page; ?>" name="product_question_per_page" />
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-product_question_notify">
            <span data-toggle="tooltip" title="<?php echo $help_admin_notify; ?>"><?php echo $entry_admin_notify; ?></span>
            </label>
            <div class="col-sm-10">
              <select name="product_question_notify" id="input-product_question_notify" class="form-control">
                <?php if ($product_question_notify) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          
          
          
          
          
        </form>
      </div>
    </div>
  </div>
  </div>
<?php echo $footer; ?>