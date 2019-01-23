<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
 <div class="page-header">
  <div class="container-fluid">
    
  <div class="pull-right">
  <?php if ($save_and_stay) { ?>
  <a class="btn btn-success" onclick="$('#save').val('stay');$('#form-socials').submit();"><i class="fa fa-check"></i> <?php echo $button_save_stay; ?></a>
  <?php } ?>
  <button type="submit" form="form-socials" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-socials" class="form-horizontal">
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
          
       <div class="form-group">
            <label class="col-sm-2 control-label" for="input-template"><?php echo $entry_columns; ?></label>
            <div class="col-sm-10">
              <select name="columns" id="input-status" class="form-control">
                <?php if ($columns == 'column1') { ?>
                <option value="column1" selected="selected"><?php echo $text_col1; ?></option>
                <?php } else { ?>
                <option value="column1"><?php echo $text_col1; ?></option>
                <?php } ?>
                <?php if ($columns == 'column2') { ?>
                <option value="column2" selected="selected"><?php echo $text_col2; ?></option>
                <?php } else { ?>
                <option value="column2"><?php echo $text_col2; ?></option>
                <?php } ?>
                <?php if ($columns == 'column3') { ?>
                <option value="column3" selected="selected"><?php echo $text_col3; ?></option>
                <?php } else { ?>
                <option value="column3"><?php echo $text_col3; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>

         <div class="row">
         <div class="col-sm-2"></div>
         <div class="col-sm-10">
         <table id="sections" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left"><?php echo $entry_background; ?></td>
                <td class="text-left"><?php echo $entry_content; ?></td>
                <td class="text-left"><?php echo $entry_help; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php $section_row = 1; ?>
              <?php foreach ($sections as $section) { ?>
              <tr id="section-row<?php echo $section_row; ?>">
                
               
                <td class="text-left">
                <a href="" id="thumb-image<?php echo $section_row; ?>" data-toggle="image" class="img-thumbnail">
                <img src="<?php echo isset($section['image']) ? $section['image'] : $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                <input type="hidden" name="sections[<?php echo $section_row; ?>][thumb_image]" value="<?php echo isset($section['thumb_image']) ? $section['thumb_image'] : ''; ?>" id="input-image<?php echo $section_row; ?>" />
                </td>
                
                
                <td class="text-left">
                <?php foreach ($languages as $language) { ?>
                <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['language_id']; ?>" /></span>		
                <textarea class="form-control" rows="6" name="sections[<?php echo $section_row; ?>][block][<?php echo $language['language_id']; ?>]" id="description-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($section['block'][$language['language_id']]) ? $section['block'][$language['language_id']] : ''; ?></textarea>
                </div>
                <?php } ?>
                </td>
                
                <td class="text-left">
                <?php echo $entry_help_content; ?>
                </td>
                
                <td class="text-right">
                <button type="button" onclick="$('#section-row<?php echo $section_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                </td>
                
              </tr>
              <?php $section_row++; ?>
			<?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="3"></td>
                <td class="text-right"><button type="button" onclick="addRow();" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
         </div>
         </div>
     </form>
   </div>
  </div>
 </div>
</div>

<script type="text/javascript"><!--
var section_row = <?php echo $section_row; ?>;

function addRow() {
	html  = '<tr id="section-row' + section_row + '">';

	html += '<td class="text-left">';
	html += '<a href="" id="thumb-image' + section_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="sections[' + section_row + '][thumb_image]" value="" id="input-image' + section_row + '" />';
	html += '  </td>';
	
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group">';
	html += '<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
	html += '<textarea name="sections[' + section_row + '][block][<?php echo $language['language_id']; ?>]" id="description-' + section_row + '-<?php echo $language['language_id']; ?>" class="form-control" rows="6"></textarea>';
	html += '</div>';
	<?php } ?>
	html += '</td>';

	html += '<td class="text-left">';
	html += '<?php echo $entry_help_content; ?>';	
	html += '</td>';
	
	html += '  <td class="text-right"><button type="button" onclick="$(\'#section-row' + section_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#sections tbody').append(html);
	
	section_row++;
}
//--></script>


<style>
.table thead > tr > td, .table tbody > tr > td {vertical-align:top;}
small {font-size:11px;font-weight:normal;}
</style>
<?php echo $footer; ?>