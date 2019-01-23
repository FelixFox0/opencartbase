<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
    <div class="container-fluid">
    <div class="pull-right">
    <a class="btn btn-success" onclick="$('#save').val('stay');$('#form-showintabs').submit();" data-toggle="tooltip" title="<?php echo $button_save_stay; ?>"><i class="fa fa-check"></i></a>
    <button type="submit" form="form-showintabs" data-toggle="tooltip" title="<?php echo $button_save_exit; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
  <h1><?php echo $heading_title; ?></h1>
  <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-showintabs" class="form-vertical">
      <input type="hidden" name="save" id="save" value="0">
        <div class="col-sm-2">
      		<ul class="nav nav-pills nav-stacked" id="tab" data-tabs="tabs">
                <?php $tab_row = 1; ?>
                <?php foreach ($tabs as $keyTab => $tab) { ?>
                     <?php $tab_row++; ?>
        		<li><a href="#tab-tab-<?php echo $keyTab; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-tab-<?php echo $keyTab; ?>\']').parent().remove(); $('#tab-tab-<?php echo $keyTab; ?>').remove(); $('#tab a:first').tab('show');"></i> <?php echo $tab['tab_title']; ?></a></li>
        		<?php } ?>
                <li id="tab-add" style="cursor:pointer"><a onclick="addTab();"><i class="fa fa-plus-circle"></i> <?php echo $button_add_tab; ?></a></li>        	</ul>
        </div> <!-- col-sm-2 -->
     <div class="col-sm-10">
        <div class="tab-content first">
        <?php foreach ($tabs as $keyTab => $tab) { ?>
        <?php $tab_row++; ?>
        <div class="tab-pane" id="tab-tab-<?php echo $keyTab; ?>">
        
        <h4><?php echo $entry_title; ?></h4>
            <div class="form-group">
            <?php foreach ($languages as $language) { ?><div class="input-group">
            <span class="input-group-addon">
            <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['language_id']; ?>" />
            </span>
            <input class="form-control" type="text" name="showintabs_tab[<?php echo $keyTab; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo $tab['title'][$language['language_id']]; ?>" <?php if( $language['language_id'] == $language_admin_id ){ echo 'class="language-title"'; } ?> />
            </div>
            <?php } ?>
            </div>
        
                     <h4 class="source"><?php echo $entry_source; ?></h4>          
                                <fieldset>
                                  <legend>
                                    <input type="radio" id="select_product<?php echo $keyTab; ?>" name="showintabs_tab[<?php echo $keyTab; ?>][data_source]" value="SP" <?php if (!isset($tab['data_source']) || (isset($tab['data_source']) && $tab['data_source'] == 'SP')) { echo 'checked="checked"'; } ?> />
                                    <label for="select_product<?php echo $keyTab; ?>" ><?php echo $header_products_select; ?></label>
                                  </legend>
                                  <div class="field_cont" <?php if (isset($tab['data_source']) && $tab['data_source'] != 'SP') { echo 'style="display:none"'; } ?> >
                                      <label><?php echo $entry_products; ?></label>
                                      <input type="text" class="form-control" name="products" value="" id="<?php echo $keyTab; ?>"/>
                                    <div id="products-tabs-<?php echo $keyTab; ?>" class="well well-sm" style="height: 150px; overflow: auto;">
                                    <?php if(isset($tab['products'])){ ?>
                                    <?php foreach ($tab['products'] as $product_tab) { ?>
                                    <div id="product-tabs-<?php echo $keyTab; ?>-<?php echo $product_tab['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_tab['name']; ?>
                                    <input type="hidden" name="showintabs_tab[<?php echo $keyTab; ?>][products][<?php echo $product_tab['product_id']; ?>][product_id]" value="<?php echo $product_tab['product_id']; ?>" />
                                    </div>
                                    <?php } ?>
                                    <?php } ?>
                                    </div>
                                  </div>
                                </fieldset>
                                <fieldset>
                                  
                                  <legend>
                                    <input type="radio" id="predef_groups<?php echo $keyTab; ?>" name="showintabs_tab[<?php echo $keyTab; ?>][data_source]" value="PG" <?php if (isset($tab['data_source']) && $tab['data_source'] == 'PG') { echo 'checked="checked"'; } ?> />
                                    <label for="predef_groups<?php echo $keyTab; ?>"><?php echo $header_predefined_groups; ?></label>
                                  </legend>
                                  <div class="field_cont" <?php if (isset($tab['data_source']) && $tab['data_source'] != 'PG') { echo 'style="display:none"'; } ?> >
                                    <label><?php echo $entry_group; ?></label>
                                    <select name="showintabs_tab[<?php echo $keyTab; ?>][product_group]" class="form-control">
                                      <option value="BS" <?php if (isset($tab['product_group']) && $tab['product_group'] == 'BS') { echo 'selected="selected"'; } ?> ><?php echo $text_best_seller; ?></option>
                                      <option value="LA" <?php if (isset($tab['product_group']) && $tab['product_group'] == 'LA') { echo 'selected="selected"'; } ?> ><?php echo $text_latest_products; ?></option>
                                      <option value="SP" <?php if (isset($tab['product_group']) && $tab['product_group'] == 'SP') { echo 'selected="selected"'; } ?> ><?php echo $text_special_products; ?></option>
                                      <option value="PP" <?php if (isset($tab['product_group']) && $tab['product_group'] == 'PP') { echo 'selected="selected"'; } ?> ><?php echo $text_popular_products; ?></option>
                                    </select>
                                  </div>
                                </fieldset>
                                <fieldset>
                                
                                  <legend>
                                    <input type="radio" id="custom_query<?php echo $keyTab; ?>" name="showintabs_tab[<?php echo $keyTab; ?>][data_source]" value="CQ" <?php if (isset($tab['data_source']) && $tab['data_source'] == 'CQ') { echo 'checked="checked"'; } ?>/>
                                    <label for="custom_query<?php echo $keyTab; ?>"><?php echo $header_custom_query; ?></label>
                                  </legend>
                                  
                                  <div class="field_cont" <?php if (isset($tab['data_source']) && $tab['data_source'] != 'CQ') { echo 'style="display:none"'; } ?> >
                                    <label><?php echo $text_category; ?></label>
                                      <select name="showintabs_tab[<?php echo $keyTab; ?>][filter_category]" class="form-control">
                                          <option value="ALL"><?php echo $text_all_categories; ?></option>
                                        <?php foreach ($categories as $category) { ?>
                                          <option value="<?php echo $category['category_id']; ?>" <?php if (isset($tab['filter_category']) && $tab['filter_category'] == $category['category_id']) { echo 'selected="selected"'; } ?> ><?php echo $category['name']; ?></option>
                                        <?php } ?>
                                      </select>
                                      
                                      <label><?php echo $text_manufacturer; ?></label>
                                      <select name="showintabs_tab[<?php echo $keyTab; ?>][filter_manufacturer]" class="form-control">
                                          <option value="ALL"><?php echo $text_all_manufacturer; ?></option>
                                        <?php foreach ($manufacturers as $manufacturer) { ?>
                                          <option value="<?php echo $manufacturer['manufacturer_id']; ?>" <?php if (isset($tab['filter_manufacturer']) && $tab['filter_manufacturer'] == $manufacturer['manufacturer_id']) { echo 'selected="selected"'; } ?> ><?php echo $manufacturer['name']; ?></option>
                                        <?php } ?>
                                      </select>
                                      
                                      <label><?php echo $entry_sort_query; ?></label>
                                      <select class="margin_top form-control" name="showintabs_tab[<?php echo $keyTab; ?>][sort]">
                                          <option value="pd.name" <?php if (isset($tab['sort']) && $tab['sort'] == 'pd.name') { echo 'selected="selected"'; } ?> ><?php echo $text_sort_name; ?></option>
                                          <option value="rating" <?php if (isset($tab['sort']) && $tab['sort'] == 'rating') { echo 'selected="selected"'; } ?> ><?php echo $text_sort_rating; ?></option>
                                          <option value="sort_order" <?php if (isset($tab['sort']) && $tab['sort'] == 'sort_order') { echo 'selected="selected"'; } ?> ><?php echo $text_sort_sort_order; ?></option>
                                          <option value="p.price" <?php if (isset($tab['sort']) && $tab['sort'] == 'p.price') { echo 'selected="selected"'; } ?> ><?php echo $text_sort_price; ?></option>
                                          <option value="p.date_added" <?php if (isset($tab['sort']) && $tab['sort'] == 'p.date_added') { echo 'selected="selected"'; } ?> ><?php echo $text_sort_added; ?></option>  
                                      </select>
                                   </div>
                                </fieldset>
                        </div>
                    <?php } ?>

      </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
function addTab(){
  //Caculamos numero de pestaña es valor de ultima + 1
  if(! $('input[name=\'products\']').last().attr('id')){
    var tab_row = 1;
  }else{
    var tab_row = parseInt($('input[name=\'products\']').last().attr('id'), 10) + 1;
  }

  //COmponemos html de una pestaña
  var html = '';
  
  html  = '<div class="tab-pane" id="tab-tab-' + tab_row + '">';
  html += '<h4><?php echo $entry_title; ?></h4>';
  html += '<div class="form-group">';
  
  <?php foreach ($languages as $language) { ?>
  html += '<div class="input-group">';
  html += '<span class="input-group-addon">';
  html += '<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
  html += '</span>';
  html += '<input class="form-control" type="text" name="showintabs_tab[' + tab_row + '][title][<?php echo $language['language_id']; ?>]" value="" <?php if( $language['language_id'] == $language_admin_id ){ echo 'class="language-title"'; } ?> />';
  html += '</div>';
  <?php } ?>

  html += '<h4 class="source"><?php echo $entry_source; ?></h4>';
  html += '<fieldset><legend>';
  html += '<input type="radio" id="select_product' + tab_row + '" name="showintabs_tab[' + tab_row + '][data_source]" value="SP" checked="checked"/> <label for="select_product' + tab_row + '"><?php echo $header_products_select; ?></label> </legend>';
  html += '<div class="field_cont">';
  html += '<label><?php echo $entry_products; ?></label>';
  html += '<input type="text" class="form-control" name="products" value="" id="' + tab_row + '"/>';
  html += '<div id="products-tabs-' + tab_row + '" class="well well-sm" style="height: 150px; overflow: auto;"></div>';
  html += '</div>';
  html += '</fieldset><fieldset><legend>';
  
  html += '<input type="radio" id="predef_groups' + tab_row + '" name="showintabs_tab[' + tab_row + '][data_source]" value="PG" /> <label for="predef_groups' + tab_row + '"><?php echo $header_predefined_groups; ?></label></legend>';
  html += '<div class="field_cont" style="display:none" >';
  html += '<label><?php echo $entry_group; ?></label>';
  html += '<select class="form-control" name="showintabs_tab[' + tab_row + '][product_group]">';
  html += '<option value="BS" ><?php echo $text_best_seller; ?></option>';
  html += '<option value="LA" ><?php echo $text_latest_products; ?></option>';
  html += '<option value="SP" ><?php echo $text_special_products; ?></option>';
  html += '<option value="PP" ><?php echo $text_popular_products; ?></option>';
  html += '</select></div></fieldset><fieldset>';
  
  html += '<legend>';                  
  html += '<input type="radio" id="custom_query' + tab_row + '" name="showintabs_tab[' + tab_row + '][data_source]" value="CQ" /> <label for="custom_query' + tab_row + '"> <?php echo $header_custom_query; ?></label> </legend>';
  html += '<div class="field_cont" style="display:none">';
  
  html += '<label><?php echo $text_category; ?></label>';
  html += '<select class="form-control" name="showintabs_tab[' + tab_row + '][filter_category]">';
  html += '<option value="ALL"><?php echo $text_all_categories; ?></option>';
  <?php foreach ($categories as $category) { ?>
  html += '<option value="<?php echo $category['category_id']; ?>" ><?php echo addslashes($category['name']); ?></option>';
  <?php } ?>
  html += '</select>';

  html += '<label><?php echo $text_manufacturer; ?></label>';
  html += '<select name="showintabs_tab[' + tab_row + '][filter_manufacturer]" class="form-control">';
  html += '<option value="ALL"><?php echo $text_all_manufacturer; ?></option>';
         <?php foreach ($manufacturers as $manufacturer) { ?>
  html += '<option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo addslashes($manufacturer['name']); ?></option>';
         <?php } ?>
  html += '</select>';
  html += '<label><?php echo $entry_sort_query; ?></label>';
  html += '<select class="form-control" name="showintabs_tab[' + tab_row + '][sort]">';
  html += '<option value="pd.name" ><?php echo $text_sort_name; ?></option>';
  html += '<option value="rating" ><?php echo $text_sort_rating; ?></option>';
  html += '<option value="sort_order" ><?php echo $text_sort_sort_order; ?></option>';
  html += '<option value="p.price" ><?php echo $text_sort_price; ?></option>';
  html += '<option value="p.date_added" ><?php echo $text_sort_added; ?></option>';  
  html += '</select></div></fieldset>';
  html += '</div>';

  $('.tab-content.first').append(html);
  
  $('#tab-add').before('<li><a href="#tab-tab-' + tab_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-tab-' + tab_row + '\\\']\').parent().remove(); $(\'#tab-tab-' + tab_row + '\').remove(); $(\'#tab a:first\').tab(\'show\');"></i> ' + '<?php echo $text_tab; ?>' + tab_row + '</a></li>');
	
  $('#tab a[href=\'#tab-tab-' + tab_row + '\']').tab('show');
  
  //Enable autocomplete
  $('input[name=\'products\']').autocomplete(autocomp_cfg);
  
  //Remove products from individual list
  $('.well').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
  });

  //open/close the filter methods
  $('legend > input').on('change', function() {
  $(this).closest('div').find('div.field_cont').hide();
  $(this).closest('fieldset').find('div.field_cont').fadeIn();
  });

}

// show first tab on page load
$('#tab li:first-child a').tab('show');

//Autocomplete
var autocomp_cfg = {
  delay: 500,
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=module/showintabs/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {   
        response($.map(json, function(item) {
          return {
            label: item.name,
            value: item.product_id
          }
        }));
      }
    });
  }, 
  
  select: function(item) {
    var tab_row = $(this).attr('id');

    $('#product-tabs-' + tab_row + '-' + item.value).remove();

    var prodElement = '';
    prodElement += '<div id="product-tabs-' + tab_row + '-' + item.value + '">' + '<i class="fa fa-minus-circle"></i> ' + item.label ;
    prodElement += '  <input type="hidden" name="showintabs_tab[' + tab_row + '][products][' + item.value + '][product_id]" value="' + item.value + '" />';
    prodElement += '</div>';

    $('#products-tabs-' + tab_row).append(prodElement);
        
    return false;
  },
  focus: function(event, ui) {
      return false;
  }
};

// Autocomplet de productos
$('input[name=\'products\']').autocomplete(autocomp_cfg);

//Delete de productos
$('.well').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
<script type="text/javascript"><!--
//open/close the filter methods
$('legend > input').on('change', function() {
  $(this).closest('div').find('div.field_cont').hide();
  $(this).closest('fieldset').find('div.field_cont').fadeIn();
});
//--></script> 
<script type="text/javascript"><!--
//cambio de titulo de pestaña cuando escribe el user
$('.language-title').on('keyup input paste', function() {
  var href = $(this).closest('div').attr('id');
  $('a[href="#' + href + '"] > div').text($(this).val());
});
//--></script> 
<script type="text/javascript"><!--
//control delete pestañas
function removeTab(TabId) {
  $('#tab-' + TabId ).remove(); 
  $('#tab-tab-' + TabId).remove(); 
  $('.vtabs a:first').trigger('click');
  $('input[value="' + TabId + '"]:checkbox').parent().remove(); 
}
//--></script>
 </div>
</div>
</div>
<style>
legend {
	border-bottom:none;
	background:#f3f3f3;
	line-height:20px;
	padding:10px;
	border-radius:5px;
	border:1px solid #dddddd;
	margin-bottom:10px;
}
legend label {
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
	color:#888888;
	margin:0px;
	padding-bottom:5px;
	vertical-align:top;
}
legend input[type="radio"]:checked+label { 
	color:#222222;
}
.field_cont {
	padding-bottom:20px;
}
label {
	font-weight:normal;
	font-size:14px;
	margin-top:10px;
}

h4 {
	font-size:18px;
}
h4.source {
	margin-top:25px;
}
.well {
	margin-bottom:0;
}
</style>
<?php echo $footer; ?>