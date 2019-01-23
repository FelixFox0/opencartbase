
    
    <?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
      <a onclick="$('#form').submit();" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></a>
        
      
      </div>
      <h1><?php echo $text_product_tab; ?></h1>
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
        <h3 class="panel-title"><?php echo $text_product_tab; ?></h3>
      </div>
      <div class="panel-body">
      
      
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
        
      
      <div class="form-group required">
            <label class="col-sm-2 control-label text-right"><?php echo $entry_tab_name; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="product_tab_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_tab_description[$language['language_id']]) ? $product_tab_description[$language['language_id']]['name'] : ''; ?>" class="form-control" />
              </div>
              <?php if (isset($error_name[$language['language_id']])) { ?>
              <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
          
          
          <div class="form-group">
            <label class="col-sm-2 control-label text-right"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" />
            </div>
          </div>
          
         
          
          <div class="form-group">
            <label class="col-sm-2 control-label text-right"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
            <select name="status" class="form-control">
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
      
      <div class="hidden">
              <select name="position" class="form-control">
				<option value="5">5</option>
				</select>
                
                <select name="show_empty" class="form-control">
			<option value="0" selected="selected"><?php echo $text_no; ?></option>
			</select>
          </div>
          
      </form>
      
      
    
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>