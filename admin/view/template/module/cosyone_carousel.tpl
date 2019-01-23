<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-cosyone_carousel" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cosyone_carousel" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          
          <?php foreach ($languages as $language) { ?>
           <div class="form-group">
            <label class="col-sm-2 control-label" for="input-title"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $entry_title; ?></label>
            <div class="col-sm-10">
              <input type="text" name="title[<?php echo $language['language_id']; ?>];" value="<?php echo isset($title[$language['language_id']]) ? $title[$language['language_id']] : ''; ?>" id="input-title" class="form-control" />
            </div>
          </div>
          <?php } ?>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner"><?php echo $entry_banner; ?></label>
            <div class="col-sm-10">
              <select name="banner_id" id="input-banner" class="form-control">
                <?php foreach ($banners as $banner) { ?>
                <?php if ($banner['banner_id'] == $banner_id) { ?>
                <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          
          <div class="form-group">
              <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_columns; ?></label>
              <div class="col-sm-10">
                <select name="grid" id="input-grid" class="form-control">
                  
                  <?php if ($grid == '[[0, 2], [320, 3], [550, 4], [999, 5], [1200, 6]]') { ?>
                     <option value="[[0, 2], [320, 3], [550, 4], [999, 5], [1200, 6]]" selected="selected">6</option>
                  <?php } else { ?>
                    <option value="[[0, 2], [320, 3], [550, 4], [999, 5], [1200, 6]]">6</option>
                  <?php } ?>
                  
                  <?php if ($grid == '[[0, 2], [550, 3], [999, 5]]') { ?>
                     <option value="[[0, 2], [550, 3], [999, 5]]" selected="selected">5</option>
                  <?php } else { ?>
                    <option value="[[0, 2], [550, 3], [999, 5]]">5</option>
                  <?php } ?>
                  
                  <?php if ($grid == '[[0, 2], [550, 3], [999, 4]]') { ?>
                     <option value="[[0, 2], [550, 3], [999, 4]]" selected="selected">4</option>
                  <?php } else { ?>
                    <option value="[[0, 2], [550, 3], [999, 4]]">4</option>
                  <?php } ?>
                  
                  <?php if ($grid == '[[0, 2], [550, 3]]') { ?>
                     <option value="[[0, 2], [550, 3]]" selected="selected">3</option>
                  <?php } else { ?>
                    <option value="[[0, 2], [550, 3]]">3</option>
                  <?php } ?>
                  
                  <?php if ($grid == '[[0, 1], [400, 2]]') { ?>
                     <option value="[[0, 1], [400, 2]]" selected="selected">2</option>
                  <?php } else { ?>
                    <option value="[[0, 1], [400, 2]]">2</option>
                  <?php } ?>
                  
                  <?php if ($grid == '[[0, 1]]') { ?>
                     <option value="[[0, 1]]" selected="selected">1</option>
                  <?php } else { ?>
                    <option value="[[0, 1]]">1</option>
                  <?php } ?>

                </select>
              </div>
            </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
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
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>