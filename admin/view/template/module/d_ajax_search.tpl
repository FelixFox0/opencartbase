<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-search" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-search" class="form-horizontal">
          
          <div class="form-group">
            <label class="col-sm-2 control-label">
            <span data-toggle="tooltip" title="<?php echo $tooltip_search_on_off; ?>"><?php echo $entry_search_on_off; ?></span>
            </label>
            <div class="col-sm-10">
              <select name="d_ajax_search[search_on_off]" class="form-control">
                <?php if (isset($d_ajax_search['search_on_off']) && $d_ajax_search['search_on_off']) { ?>
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
            <label class="col-sm-2 control-label">
            <span data-toggle="tooltip" title="<?php echo $tooltip_search_width; ?>"><?php echo $entry_search_width; ?></span>
            </label>
            <div class="col-sm-10">
              <?php if (isset($d_ajax_search['search_width'])) { ?>
              <input type="text" class="form-control" name="d_ajax_search[search_width]" value="<?php echo $d_ajax_search['search_width']; ?>"  />
              <?php } else { ?>
              <input type="text" class="form-control" name="d_ajax_search[search_width]" value="100%"  />
              <?php } ?>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label">
            <span data-toggle="tooltip" title="<?php echo $tooltip_search_max_symbols; ?>"><?php echo $entry_search_max_symbols; ?></span>
            </label>
            <div class="col-sm-10">
            <?php if (isset($d_ajax_search['search_max_symbols'])) { ?>
            <input type="text" class="form-control" name="d_ajax_search[search_max_symbols]" value="<?php echo $d_ajax_search['search_max_symbols']; ?>"  />
              <?php } else { ?>
              <input type="text" class="form-control" name="d_ajax_search[search_max_symbols]" value="0"  />
              <?php } ?>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label">
            <span data-toggle="tooltip" title="<?php echo $tooltip_search_max_results; ?>"><?php echo $entry_search_max_results; ?></span>
            </label>
            <div class="col-sm-10">
            <?php if (isset($d_ajax_search['search_max_results'])) { ?>
            <input type="text" class="form-control" name="d_ajax_search[search_max_results]" value="<?php echo $d_ajax_search['search_max_results']; ?>"  />
              <?php } else { ?>
              <input type="text" class="form-control" name="d_ajax_search[search_max_results]" value="0"  />
              <?php } ?>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label">
            <span data-toggle="tooltip" title="<?php echo $tooltip_search_first_symbols; ?>"><?php echo $entry_search_first_sybmols; ?></span>
            </label>
            <div class="col-sm-10">
            <div class="checkbox">
            <label><input type="checkbox" name="d_ajax_search[search_first_symbols]" <?php if (isset($d_ajax_search['search_first_symbols'])) echo 'checked="checked"'; ?>> <?php echo $text_on; ?></label>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label">
            <span data-toggle="tooltip" title="<?php echo $tooltip_search_priority; ?>"><?php echo $entry_search_priority; ?></span>
            </label>
            <div class="col-sm-4">        
            <table class="table table-bordered table-hover">
              
              <thead>
                <tr>
                  <td style="width: 20px;" class="text-center"></td>
                  <td><?php echo $text_type; ?></td>
                  <td width="100px"><?php echo $text_sort_order; ?></td>
                </tr>
              </thead>
              
              <tbody>
                <tr>
                  <td class="text-center"><input type="checkbox" name="d_ajax_search[search_product_on]" <?php if (isset($d_ajax_search['search_product_on'])) echo 'checked="checked"'; ?>></td>
                  <td><?php echo $text_product; ?></td>
                  <td><?php if (isset($d_ajax_search['search_product_sort'])) { ?>
<input type="text" class="form-control" name="d_ajax_search[search_product_sort]" value="<?php echo $d_ajax_search['search_product_sort']; ?>"  />
<?php } else { ?>
<input type="text" class="form-control" name="d_ajax_search[search_product_sort]" value="1"  />
<?php } ?></td>
                </tr>
                <tr>
                  <td class="text-center"><input type="checkbox" name="d_ajax_search[search_category_on]" <?php if (isset($d_ajax_search['search_category_on'])) echo 'checked="checked"'; ?>></td>
                  <td><?php echo $text_category; ?></td>
                  <td><?php if (isset($d_ajax_search['search_category_sort'])) { ?>
<input type="text" class="form-control" name="d_ajax_search[search_category_sort]" value="<?php echo $d_ajax_search['search_category_sort']; ?>"  />
<?php } else { ?>
<input type="text" class="form-control" name="d_ajax_search[search_category_sort]" value="2"  />
<?php } ?></td>
                </tr>
                <tr>
                  <td class="text-center"><input type="checkbox" name="d_ajax_search[search_manufacturer_on]" <?php if (isset($d_ajax_search['search_manufacturer_on'])) echo 'checked="checked"'; ?>></td>
                  <td><?php echo $text_manufacturer; ?></td>
                  <td><?php if (isset($d_ajax_search['search_manufacturer_sort'])) { ?>
<input type="text" class="form-control" name="d_ajax_search[search_manufacturer_sort]" value="<?php echo $d_ajax_search['search_manufacturer_sort']; ?>"  />
<?php } else { ?>
<input type="text" class="form-control" name="d_ajax_search[search_manufacturer_sort]" value="3"  />
<?php } ?></td>
                </tr>
                <tr>
                  <td class="text-center"><input type="checkbox" name="d_ajax_search[search_information_on]" <?php if (isset($d_ajax_search['search_information_on'])) echo 'checked="checked"'; ?>></td>
                  <td><?php echo $text_information; ?></td>
                  <td><?php if (isset($d_ajax_search['search_information_sort'])) { ?>
<input type="text" class="form-control" name="d_ajax_search[search_information_sort]" value="<?php echo $d_ajax_search['search_information_sort']; ?>"  />
<?php } else { ?>
<input type="text" class="form-control" name="d_ajax_search[search_information_sort]" value="4"  />
<?php } ?></td>
                </tr>
              </tbody>
            </table>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_search_price; ?></label>
            <div class="col-sm-10">
            <div class="checkbox">
            <label><input type="checkbox" name="d_ajax_search[search_price]" <?php if (isset($d_ajax_search['search_price'])) echo 'checked="checked"'; ?>> <?php echo $text_on; ?></label>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_search_special; ?></label>
            <div class="col-sm-10">
            <div class="checkbox">
            <label><input type="checkbox" name="d_ajax_search[search_special]" <?php if (isset($d_ajax_search['search_special'])) echo 'checked="checked"'; ?>> <?php echo $text_on; ?></label>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_search_tax; ?></label>
            <div class="col-sm-10">
            <div class="checkbox">
            <label><input type="checkbox" name="d_ajax_search[search_tax]" <?php if (isset($d_ajax_search['search_tax'])) echo 'checked="checked"'; ?>> <?php echo $text_on; ?></label>
              </div>
            </div>
          </div>

        </form>
      </div>
    </div>
  </div>
</div>
<style>
.table-bordered {
	margin-bottom:0;
}
</style>
<?php echo $footer; ?>