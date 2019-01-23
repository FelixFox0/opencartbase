<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-cosyone_twitterfeed" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if (isset($error['error_warning'])) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cosyone_twitterfeed" class="form-horizontal">
          
          
          <?php foreach ($languages as $language) { ?>
            <div class="form-group">
                <label class="col-sm-2 control-label"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> Module Title</label>
                <div class="col-sm-10">
                 <input type="text" name="cosyone_twitterfeed_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($cosyone_twitterfeed_title[$language['language_id']]) ? $cosyone_twitterfeed_title[$language['language_id']] : ''; ?>" class="form-control"/>
                </div>
            </div>
            <?php } ?>
            
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="entry-client_id">Twitter Username</label>
            <div class="col-sm-10">
              <input type="text" name="cosyone_twitterfeed_widget_id" value="<?php echo $cosyone_twitterfeed_widget_id; ?>" class="form-control"/>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="entry-client_id">Tweets limit</label>
            <div class="col-sm-10">
              <input type="text" name="cosyone_twitterfeed_limit" value="<?php echo $cosyone_twitterfeed_limit; ?>" class="form-control"/>
            </div>
          </div>
          
          
          
          
          
          
          
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="cosyone_twitterfeed_status" id="input-status" class="form-control">
                <?php if ($cosyone_twitterfeed_status) { ?>
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