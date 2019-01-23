<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-banner" class="form-horizontal">
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
          <div class="form-group clearfix">
            <label class="col-sm-2 control-label" for="input-name"><span data-toggle="tooltip" title="<?php echo $entry_tabs_help; ?>"><?php echo $entry_tabs; ?></span></label>
            <div class="col-sm-10">
            <div class="well well-sm" style="height: 150px; overflow: auto;">
            <?php foreach ($tabs as $keytab => $tab) { ?>
            <?php if (isset($selected_tabs['tabs']) && in_array($keytab, $selected_tabs['tabs'])) { ?>
             <label><input type="checkbox" name="selected_tabs[tabs][]" value="<?php echo $keytab; ?>" checked="checked" />
             <?php echo $tab['tab_title']; ?></label><br />
               <?php } else { ?>
             <label><input type="checkbox" name="selected_tabs[tabs][]" value="<?php echo $keytab; ?>" />
             <?php echo $tab['tab_title']; ?></label><br />
            <?php } ?>
           <?php } ?>
           </div>           
            </div>
          </div>
           <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><span data-toggle="tooltip" title="<?php echo $entry_limit_help; ?>"><?php echo $entry_limit; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>"  id="input-limit" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-image_width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="image_width" value="<?php echo $image_width; ?>" id="input-image_width" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-image_height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="image_height" value="<?php echo $image_height; ?>" id="input-image_height" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-columns"><?php echo $entry_columns; ?></label>
            <div class="col-sm-10">
              <select name="columns" id="input-columns" class="form-control">
                
                <?php if ($columns == 'grid5') { ?>
                <option value="grid5" selected="selected"><?php echo $text_grid5; ?></option>
                <?php } else { ?>
                <option value="grid5"><?php echo $text_grid5; ?></option>
                <?php } ?>
                
                <?php if ($columns == 'grid4') { ?>
                <option value="grid4" selected="selected"><?php echo $text_grid4; ?></option>
                <?php } else { ?>
                <option value="grid4"><?php echo $text_grid4; ?></option>
                <?php } ?>
                
                <?php if ($columns == 'grid3') { ?>
                <option value="grid3" selected="selected"><?php echo $text_grid3; ?></option>
                <?php } else { ?>
                <option value="grid3"><?php echo $text_grid3; ?></option>
                <?php } ?>
                
                <?php if ($columns == 'grid2') { ?>
                <option value="grid2" selected="selected"><?php echo $text_grid2; ?></option>
                <?php } else { ?>
                <option value="grid2"><?php echo $text_grid2; ?></option>
                <?php } ?>
                
                <?php if ($columns == 'grid1') { ?>
                <option value="grid1" selected="selected"><?php echo $text_grid1; ?></option>
                <?php } else { ?>
                <option value="grid1"><?php echo $text_grid1; ?></option>
                <?php } ?>
                
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-carousel"><?php echo $entry_carousel; ?></label>
            <div class="col-sm-10">
              <select name="carousel" id="input-carousel" class="form-control">
                <?php if ($carousel) { ?>
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