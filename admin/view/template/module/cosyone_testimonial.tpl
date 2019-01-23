<?php echo $header; ?><?php echo $column_left; ?>
  <div id="content">
    <div class="page-header">
      <div class="container-fluid">
        <div class="pull-right">
        <a href="<?php echo $to_list_link; ?>" class="btn btn-success"><i class="fa fa-list"></i> <?php echo $to_list; ?></a>
          <button type="submit" form="form-testimonial" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
        </div>
        <div class="panel-body"> 
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-testimonial" class="form-horizontal">
            
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
            <label class="col-sm-2 control-label" for="input-testimonial_title">
            <?php echo $entry_title; ?></label>
            <div class="col-sm-10">
            <?php foreach ($languages as $language) { ?>
            <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
              <input type="text" name="testimonial_title[<?php echo $language['language_id']; ?>];" value="<?php echo isset($testimonial_title[$language['language_id']]) ? $testimonial_title[$language['language_id']] : ''; ?>" id="input-testimonial_title" class="form-control" />
              </div>
              <?php } ?>
            </div>
            
          </div>
          
            
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_limit; ?></label>
              <div class="col-sm-10">
                <input type="text" name="testimonial_limit" value="<?php echo $testimonial_limit; ?>" placeholder="<?php echo $entry_limit; ?>" class="form-control" />
              </div>
            </div>
                        
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input_character_limit"><?php echo $entry_character_limit; ?></label>
              <div class="col-sm-10">
                <input type="text" name="testimonial_character_limit" value="<?php echo $testimonial_character_limit; ?>" placeholder="<?php echo $entry_character_limit; ?>" id="input_character_limit" class="form-control" />
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_columns; ?></label>
              <div class="col-sm-10">
                <select name="testimonial_columns" id="input-testimonial_columns" class="form-control">
                  <?php if ($testimonial_columns == 'grid4') { ?>
                    <option value="grid4" selected="selected">4</option>
                    <?php } else { ?>
                    <option value="grid4">4</option>
                  <?php } ?>
                  <?php if ($testimonial_columns == 'grid3') { ?>
                    <option value="grid3" selected="selected">3</option>
                    <?php } else { ?>
                    <option value="grid3">3</option>
                  <?php } ?>
                  <?php if ($testimonial_columns == 'grid2') { ?>
                    <option value="grid2" selected="selected">2</option>
                    <?php } else { ?>
                    <option value="grid2">2</option>
                  <?php } ?>
                  <?php if ($testimonial_columns == 'grid1') { ?>
                    <option value="grid1" selected="selected">1 (List style)</option>
                    <?php } else { ?>
                    <option value="grid1">1 (List style)</option>
                  <?php } ?>
                </select>
              </div>
            </div>
            
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-testimonial_random"><span data-toggle="tooltip" title="<?php echo $help_random; ?>"><?php echo $entry_random; ?></span></label>
              <div class="col-sm-10">
              	<div class="checkbox">
                  <?php if (isset($testimonial_random)) { ?>
                    <label><input type="checkbox" name="testimonial_random" value="1" checked="checked" /></label>
                  <?php } else { ?>
                    <label><input type="checkbox" name="testimonial_random" value="1" /></label>
                  <?php } ?>
                  </div>
             </div>
            </div>
            
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_carousel; ?></label>
              <div class="col-sm-10">
              	<div class="checkbox">
                  <?php if (isset($testimonial_carousel)) { ?>
                    <label><input type="checkbox" name="testimonial_carousel" value="1" checked="checked"  /></label>
                  <?php } else { ?>
                    <label><input type="checkbox" name="testimonial_carousel" value="1" /></label>
                  <?php } ?>
                  </div>
             </div>
            </div>
            
            <div class="form-group">
              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_links; ?>"><?php echo $entry_links; ?></span></label>
              <div class="col-sm-10">
              	<div class="checkbox">
                  <?php if (isset($testimonial_links)) { ?>
                    <label><input type="checkbox" name="testimonial_links" value="1" checked="checked"  /></label>
                  <?php } else { ?>
                    <label><input type="checkbox" name="testimonial_links" value="1" /></label>
                  <?php } ?>
                  </div>
             </div>
            </div>
            
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-testimonial_random"><span data-toggle="tooltip" title="<?php echo $help_contrast; ?>"><?php echo $entry_contrast; ?></span></label>
              <div class="col-sm-10">
              	<div class="checkbox">
                  <?php if (isset($testimonial_contrast)) { ?>
                    <label><input type="checkbox" name="testimonial_contrast" value="1" checked="checked"  /></label>
                  <?php } else { ?>
                    <label><input type="checkbox" name="testimonial_contrast" value="1" /></label>
                  <?php } ?>
                  </div>
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
    </div></div>
<?php echo $footer; ?>