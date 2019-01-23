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

         <div class="row">
         <div class="col-sm-2"></div>
         <div class="col-sm-10">
         <table id="sections" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left"><?php echo $entry_media; ?></td>
                <td class="text-left"><?php echo $entry_link; ?></td>
                <td class="text-left"><?php echo $entry_blank; ?></td>
                <td class="text-left"><?php echo $entry_tooltip; ?></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php $section_row = 1; ?>
              <?php foreach ($sections as $section) { ?>
              <tr id="section-row<?php echo $section_row; ?>">
                <td class="text-left">
                    <select name="sections[<?php echo $section_row; ?>][social_type]" class="form-control">
                    <?php if ($section['social_type'] == 'fa-facebook') { ?>
                    <option value="fa-facebook" selected="selected">Facebook</option>
                    <?php } else { ?>
                    <option value="fa-facebook">Facebook</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-twitter') { ?>
                    <option value="fa-twitter" selected="selected">Twitter</option>
                    <?php } else { ?>
                    <option value="fa-twitter">Twitter</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-google-plus') { ?>
                    <option value="fa-google-plus" selected="selected">Google+</option>
                    <?php } else { ?>
                    <option value="fa-google-plus">Google+</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-rss') { ?>
                    <option value="fa-rss" selected="selected">RSS</option>
                    <?php } else { ?>
                    <option value="fa-rss">RSS</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-pinterest') { ?>
                    <option value="fa-pinterest" selected="selected">Pinterest</option>
                    <?php } else { ?>
                    <option value="fa-pinterest">Pinterest</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-instagram') { ?>
                    <option value="fa-instagram" selected="selected">Instagram</option>
                    <?php } else { ?>
                    <option value="fa-instagram">Instagram</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-linkedin') { ?>
                    <option value="fa-linkedin" selected="selected">Linkedin</option>
                    <?php } else { ?>
                    <option value="fa-linkedin">Linkedin</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-vimeo-square') { ?>
                    <option value="fa-vimeo-square" selected="selected">Vimeo</option>
                    <?php } else { ?>
                    <option value="fa-vimeo-square">Vimeo</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-youtube') { ?>
                    <option value="fa-youtube" selected="selected">Youtube</option>
                    <?php } else { ?>
                    <option value="fa-youtube">Youtube</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-flickr') { ?>
                    <option value="fa-flickr" selected="selected">Flickr</option>
                    <?php } else { ?>
                    <option value="fa-flickr">Flickr</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-vk') { ?>
                    <option value="fa-vk" selected="selected">VK</option>
                    <?php } else { ?>
                    <option value="fa-vk">VK</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-dribbble') { ?>
                    <option value="fa-dribbble" selected="selected">Dribbble</option>
                    <?php } else { ?>
                    <option value="fa-dribbble">Dribbble</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-spotify') { ?>
                    <option value="fa-spotify" selected="selected">Spotify</option>
                    <?php } else { ?>
                    <option value="fa-spotify">Spotify</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-tumblr') { ?>
                    <option value="fa-tumblr" selected="selected">Tumblr</option>
                    <?php } else { ?>
                    <option value="fa-tumblr">Tumblr</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-xing') { ?>
                    <option value="fa-xing" selected="selected">Xing</option>
                    <?php } else { ?>
                    <option value="fa-xing">Xing</option>
                    <?php } ?>
                    <?php if ($section['social_type'] == 'fa-wordpress') { ?>
                    <option value="fa-wordpress" selected="selected">Wordpress</option>
                    <?php } else { ?>
                    <option value="fa-wordpress">Wordpress</option>
                    <?php } ?>
                  </select>
                </td>
                <td class="text-left">
                <input type="text" class="form-control" name="sections[<?php echo $section_row; ?>][link]" value="<?php echo isset($section['link']) ? $section['link'] : ''; ?>" />
                </td>
                <td class="text-left">
                <select name="sections[<?php echo $section_row; ?>][link_type]" class="form-control">
                    <?php if ($section['link_type'] == 'internal') { ?>
                    <option value="internal" selected="selected">No</option>
                    <?php } else { ?>
                    <option value="internal">No</option>
                    <?php } ?>
                    <?php if ($section['link_type'] == 'external') { ?>
                    <option value="external" selected="selected">Yes</option>
                    <?php } else { ?>
                    <option value="external">Yes</option>
                    <?php } ?>
                  </select>
                  </td>
                <td class="text-left">
                <input type="text" class="form-control" name="sections[<?php echo $section_row; ?>][tooltip]" value="<?php echo isset($section['tooltip']) ? $section['tooltip'] : ''; ?>" />
                </td>
                <td class="text-left"><button type="button" onclick="$('#section-row<?php echo $section_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
              </tr>
              <?php $section_row++; ?>
			<?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="4"></td>
                <td class="text-left"><button type="button" onclick="addRow();" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
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
	html += '<select name="sections[' + section_row + '][social_type]" class="form-control">';	
	html += '<option value="fa-facebook">Facebook</option>';
    html += '<option value="fa-twitter">Twitter</option>';
    html += '<option value="fa-google-plus">Google+</option>';
    html += '<option value="fa-rss">RSS</option>';
    html += '<option value="fa-pinterest">Pinterest</option>';
    html += '<option value="fa-instagram">Instagram</option>';
    html += '<option value="fa-linkedin">Linkedin</option>';
    html += '<option value="fa-vimeo-square">Vimeo</option>';
    html += '<option value="fa-youtube">Youtube</option>';
    html += '<option value="fa-flickr">Flickr</option>';
    html += '<option value="fa-vk">VK</option>';
    html += '<option value="fa-dribbble">Dribbble</option>';
    html += '<option value="fa-spotify">Spotify</option>';
    html += '<option value="fa-tumblr">Tumblr</option>';
	html += '<option value="fa-xing">Xing</option>';
    html += '<option value="fa-wordpress">Wordpress</option>';
	html += '</select>';
	html += '</td>';
	html += '<td class="text-left">';
	html += '<input type="text" name="sections[' + section_row + '][link]" class="form-control"/>';	
	html += '</td>';
	html += '<td class="text-left">';
	html += '<select name="sections[' + section_row + '][link_type]" class="form-control">';	
	html += '<option value="internal">No</option>';
    html += '<option value="external">Yes</option>';
	html += '</select>';
	html += '</td>';
	html += '<td class="text-left">';
	html += '<input type="text" name="sections[' + section_row + '][tooltip]" class="form-control"/>';	
	html += '</td>';
	
	html += '  <td class="text-left"><button type="button" onclick="$(\'#section-row' + section_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#sections tbody').append(html);
	
	section_row++;
}
//--></script>


<style>
small {font-weight:normal; font-size:11px;}
</style>
<?php echo $footer; ?>