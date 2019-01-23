<?php echo $header; ?><?php echo $column_left; ?>
<?php 
(!isset($cosyone_menu_mega_second_image_w)) ? $cosyone_menu_mega_second_image_w = 165 : '';
(!isset($cosyone_menu_mega_second_image_h)) ? $cosyone_menu_mega_second_image_h = 100 : '';
(!isset($cosyone_refine_image_w)) ? $cosyone_refine_image_w = 190 : '';
(!isset($cosyone_refine_image_h)) ? $cosyone_refine_image_h = 190 : '';
?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
      <a class="btn btn-success" onclick="$('#save').val('stay');$('#form-cosyone').submit();"><i class="fa fa-check"></i> <?php echo $button_save_stay; ?></a>
	<button type="submit" form="form-cosyone" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Cosyone Theme v2.7</h3>
      </div>
    
   <div class="panel-body">
   <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cosyone">
   <input type="hidden" name="save" id="save" value="0">
      <ul class="nav nav-tabs main">
      <li class="active"><a href="#tab-general" data-toggle="tab"><i class="fa fa-cog"></i> <?php echo $text_tab_general;?></a></li>
      <li><a href="#tab-design" data-toggle="tab"><i class="fa fa-pencil"></i> <?php echo $text_tab_design;?></a></li>
      <li><a href="#tab-custom-css" data-toggle="tab"><i class="fa fa-code"></i> <?php echo $text_tab_custom_css;?></a></li>
      </ul>
       
      <div class="tab-content"> 
    <div id="tab-general" class="tab-pane active">
    
    <div class="row">
    
    <div class="col-sm-2 tabs-left">
    <ul class="nav nav-tabs nav-stacked">
    <li class="active"><a href="#tab-layout" data-toggle="tab">Layout</a></li>
    <li><a href="#tab-header" data-toggle="tab">Header</a></li>
    <li><a href="#tab-menu" data-toggle="tab">Menu</a></li>
    <li><a href="#tab-product-page" data-toggle="tab">Product page</a></li>
    <li><a href="#tab-category-page" data-toggle="tab">Category page</a></li>
    <li><a href="#tab-contact-page" data-toggle="tab">Contact page</a></li>
    <li><a href="#tab-product-listings" data-toggle="tab">Product listings</a></li>
    <li><a href="#tab-footer" data-toggle="tab">Footer</a></li>
    <li><a href="#tab-cookie" data-toggle="tab">Cookie bar</a></li>
    <li><a href="#tab-explorer" data-toggle="tab">Internet Explorer warning</a></li>
    </ul> <!-- vtabs ends -->
    </div>
    
    <div class="col-sm-10">
    <div class="tab-content">
    <div id="tab-layout" class="tab-pane active"> <!-- Tab layout start -->
    <h3><?php echo $text_heading_layout;?></h3><hr />
    
    <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_max_width;?></label>
	<select name="cosyone_max_width" class="form-control">
	<?php foreach($cosyone_max_width_list as $key=>$cosyone_max_width_list) { ?>
	<option value="<?php echo $key;?>" <?php if($cosyone_max_width==$key) { echo " selected"; }?> ><?php echo $cosyone_max_width_list;?></option>
	<?php } ?>
	</select>
	</div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_responsive_layout;?></label>
	<select name="cosyone_use_responsive" class="form-control">
	<?php foreach($cosyone_use_responsive_list as $key=>$cosyone_use_responsive_list) { ?>
	<option value="<?php echo $key;?>" <?php if($cosyone_use_responsive==$key) { echo " selected"; }?> ><?php echo $cosyone_use_responsive_list;?></option>
	<?php } ?>
	</select>
	</div>
    
	<div class="col-sm-12 form-group">
	<label class="control-label">Show breadcrumb</label>
	<select name="cosyone_use_breadcrumb" class="form-control">
	<?php foreach($cosyone_use_breadcrumb_list as $key=>$cosyone_use_breadcrumb_list) { ?>
	<option value="<?php echo $key;?>" <?php if($cosyone_use_breadcrumb==$key) { echo " selected"; }?> ><?php echo $cosyone_use_breadcrumb_list;?></option>
	<?php } ?>
	</select>
	</div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">
    Embed retina support *</label>
	<select name="cosyone_use_retina" class="form-control">
	<?php foreach($cosyone_use_retina_list as $key=>$cosyone_use_retina_list) { ?>
	<option value="<?php echo $key;?>" <?php if($cosyone_use_retina==$key) { echo " selected"; }?> ><?php echo $cosyone_use_retina_list;?></option>
	<?php } ?>
	</select>
	<span class="help-block">* Retina support will look for retina versions of images for visitors using a high resolution screen. To upload an extra image for retina users, upload the image twice as big, and add "@2x" to the image name. For example, if your logo is logo.png, you should upload the retina version in the same folder, named as logo@2x.png. Please note that when opencart resizes images, it wont create double sets for retina, so you need to upload these manually.</span>
	</div>
   
    </div> <!-- row ends -->
    
    </div> <!-- Tab layout ends -->
    
    
    
    <div id="tab-header" class="tab-pane"> <!-- Tab header start -->
    <h3>Header settings</h3><hr />
    
    <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Header style</label>
	<select name="cosyone_header_style" class="form-control">
      <?php foreach($cosyone_header_style_list as $key=>$cosyone_header_style_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_header_style==$key) { echo " selected"; }?> ><?php echo $cosyone_header_style_list;?></option>
      <?php } ?>
      </select>
	</div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Show header login</label>
	<select name="cosyone_header_login" class="form-control">
      <?php foreach($cosyone_header_login_list as $key=>$cosyone_header_login_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_header_login==$key) { echo " selected"; }?> ><?php echo $cosyone_header_login_list;?></option>
      <?php } ?>
      </select>
	</div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Show header wishlist</label>
	<select name="cosyone_header_wishlist" class="form-control">
	<?php foreach($cosyone_header_wishlist_list as $key=>$cosyone_header_wishlist_list) { ?>
<option value="<?php echo $key;?>" <?php if($cosyone_header_wishlist==$key) { echo " selected"; }?> ><?php echo $cosyone_header_wishlist_list;?></option>
	<?php } ?>
	</select>
	</div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Show header compare</label>
	<select name="cosyone_header_compare" class="form-control">
	<?php foreach($cosyone_header_compare_list as $key=>$cosyone_header_compare_list) { ?>
	<option value="<?php echo $key;?>" <?php if($cosyone_header_compare==$key) { echo " selected"; }?> ><?php echo $cosyone_header_compare_list;?></option>
	<?php } ?>
	</select>
	</div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Show header search</label>
	<select name="cosyone_header_search" class="form-control">
	<?php foreach($cosyone_header_search_list as $key=>$cosyone_header_search_list) { ?>
	<option value="<?php echo $key;?>" <?php if($cosyone_header_search==$key) { echo " selected"; }?> ><?php echo $cosyone_header_search_list;?></option>
	<?php } ?>
	</select>
	</div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Show header cart</label>
	<select name="cosyone_header_cart" class="form-control">
      <?php foreach($cosyone_header_cart_list as $key=>$cosyone_header_cart_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_header_cart==$key) { echo " selected"; }?> ><?php echo $cosyone_header_cart_list;?></option>
      <?php } ?>
      </select>
	</div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Top line promo message</label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
   	<input type="text" class="form-control" value="<?php echo isset($cosyone_top_promo_message[$language['language_id']]) ? $cosyone_top_promo_message[$language['language_id']] : ''; ?>" name="cosyone_top_promo_message[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    </div>
    
    </div> <!-- row ends -->
    </div> <!-- tab header ends -->
    
    <div id="tab-menu" class="tab-pane"> <!-- Tab menu start -->
    <h3><?php echo $text_heading_main_menu_general;?></h3><hr />
    
    <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Use sticky menu</label>
	<select name="cosyone_menu_sticky" class="form-control">
      <?php foreach($cosyone_menu_sticky_list as $key=>$cosyone_menu_sticky_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_menu_sticky==$key) { echo " selected"; }?> ><?php echo $cosyone_menu_sticky_list;?></option>
      <?php } ?>
      </select>
      <span class="help-block">* If sticky menu is enabled, the menu stays on top of screen when scrolling down</span>
	</div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_home_icon;?></label>
	<select name="cosyone_show_home_icon" class="form-control">
      <?php foreach($cosyone_show_home_icon_list as $key=>$cosyone_show_home_icon_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_show_home_icon==$key) { echo " selected"; }?> ><?php echo $cosyone_show_home_icon_list;?></option>
      <?php } ?>
      </select>
	</div>
	
    <div class="col-sm-12 form-group">
	<label class="control-label">Show border above menu</label>
	<select name="cosyone_menu_border" class="form-control">
      <?php foreach($cosyone_menu_border_list as $key=>$cosyone_menu_border_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_menu_border==$key) { echo " selected"; }?> ><?php echo $cosyone_menu_border_list;?></option>
      <?php } ?>
      </select>
	</div>
    
      </div> <!-- row ends -->
      <h3>Thumbs for second level categories</h3><hr />
      <div class="row">
      
       <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_menu_mega_second_thumb;?></label>
	 <select name="cosyone_menu_mega_second_thumb" class="form-control">
      <?php foreach($cosyone_menu_mega_second_thumb_list as $key=>$cosyone_menu_mega_second_thumb_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_menu_mega_second_thumb==$key) { echo " selected"; }?> ><?php echo $cosyone_menu_mega_second_thumb_list;?></option>
      <?php } ?>
      </select>
      <span class="help-block">* <?php echo $text_menu_mega_second_thumb_help;?></span>
	</div>
    
    <div class="col-sm-6 form-group">
	<label class="control-label"><?php echo $text_menu_mega_second_image_w;?></label>
	<input type="text" class="form-control" value="<?php echo $cosyone_menu_mega_second_image_w?>" name="cosyone_menu_mega_second_image_w" />
	</div>
    
    <div class="col-sm-6 form-group">
	<label class="control-label"><?php echo $text_menu_mega_second_image_h;?></label>
	<input type="text" class="form-control" value="<?php echo $cosyone_menu_mega_second_image_h?>" name="cosyone_menu_mega_second_image_h" />
	</div>
    
    </div> <!-- row ends -->
      
      <h3><?php echo $text_use_custom_menu_link1;?></h3><hr />
      
      <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_title1;?></label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
   	<input type="text" class="form-control" value="<?php echo isset($cosyone_custom_menu_title1[$language['language_id']]) ? $cosyone_custom_menu_title1[$language['language_id']] : ''; ?>" name="cosyone_custom_menu_title1[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    <span class="help-block">* Leave it blank to disable the link</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_url1;?></label>
	<input type="text" value="<?php echo $cosyone_custom_menu_url1?>" name="cosyone_custom_menu_url1" class="form-control" />
	</div>
    
    </div> <!-- row ends -->
      
      <h3><?php echo $text_use_custom_menu_link2;?></h3><hr />
      
      <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_title2;?></label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
    <input type="text" class="form-control" value="<?php echo isset($cosyone_custom_menu_title2[$language['language_id']]) ? $cosyone_custom_menu_title2[$language['language_id']] : ''; ?>" name="cosyone_custom_menu_title2[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    <span class="help-block">* Leave it blank to disable the link</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_url2;?></label>
	<input type="text" value="<?php echo $cosyone_custom_menu_url2?>" name="cosyone_custom_menu_url2" class="form-control" />
	</div>
    
    </div> <!-- row ends -->
    
    <h3><?php echo $text_use_custom_menu_link3;?></h3><hr />
      
      <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_title3;?></label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
    <input type="text" class="form-control" value="<?php echo isset($cosyone_custom_menu_title3[$language['language_id']]) ? $cosyone_custom_menu_title3[$language['language_id']] : ''; ?>" name="cosyone_custom_menu_title3[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    <span class="help-block">* Leave it blank to disable the link</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_url3;?></label>
	<input type="text" value="<?php echo $cosyone_custom_menu_url3?>" name="cosyone_custom_menu_url3" class="form-control" />
	</div>
    
    </div> <!-- row ends -->
    
    <h3><?php echo $text_use_custom_menu_link4;?></h3><hr />
      
      <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_title4;?></label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
    <input type="text" class="form-control" value="<?php echo isset($cosyone_custom_menu_title4[$language['language_id']]) ? $cosyone_custom_menu_title4[$language['language_id']] : ''; ?>" name="cosyone_custom_menu_title4[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    <span class="help-block">* Leave it blank to disable the link</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_url4;?></label>
	<input type="text" value="<?php echo $cosyone_custom_menu_url4?>" name="cosyone_custom_menu_url4" class="form-control" />
	</div>
    
    </div> <!-- row ends -->
    
    <h3><?php echo $text_use_custom_menu_link5;?></h3><hr />
      
      <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_title5;?></label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
    <input type="text" class="form-control" value="<?php echo isset($cosyone_custom_menu_title5[$language['language_id']]) ? $cosyone_custom_menu_title5[$language['language_id']] : ''; ?>" name="cosyone_custom_menu_title5[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    <span class="help-block">* Leave it blank to disable the link</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_url5;?></label>
	<input type="text" value="<?php echo $cosyone_custom_menu_url5?>" name="cosyone_custom_menu_url5" class="form-control" />
	</div>
    
    </div> <!-- row ends -->
    
    
    <h3><?php echo $text_use_custom_menu_link6;?></h3><hr />
      
      <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_title6;?></label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
    <input type="text" class="form-control" value="<?php echo isset($cosyone_custom_menu_title6[$language['language_id']]) ? $cosyone_custom_menu_title6[$language['language_id']] : ''; ?>" name="cosyone_custom_menu_title6[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    <span class="help-block">* Leave it blank to disable the link</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_url6;?></label>
	<input type="text" value="<?php echo $cosyone_custom_menu_url6?>" name="cosyone_custom_menu_url6" class="form-control" />
	</div>
    
    </div> <!-- row ends -->
    
    
    
      <h3><?php echo $text_use_custom_menu_block;?></h3><hr />
      
      <div class="row">
      
      <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_block;?></label>
	<select name="cosyone_custom_menu_block" class="form-control">
      <?php foreach($cosyone_custom_menu_block_list as $key=>$cosyone_custom_menu_block_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_custom_menu_block==$key) { echo " selected"; }?> ><?php echo $cosyone_custom_menu_block_list;?></option>
      <?php } ?>
      </select>
	</div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Custom block width</label>
	<input type="text" value="<?php echo $cosyone_menu_block_width?>" name="cosyone_menu_block_width" class="form-control" />
	</div>
      
     <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_menu_block_title;?></label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
   	<input type="text" class="form-control" value="<?php echo isset($cosyone_custom_menu_block_title[$language['language_id']]) ? $cosyone_custom_menu_block_title[$language['language_id']] : ''; ?>" name="cosyone_custom_menu_block_title[<?php echo $language['language_id']; ?>]" />

    </div>
	<?php } ?>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_menu_custom_block_content;?></label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
    <textarea name="cosyone_menu_custom_block_content[<?php echo $language['language_id']; ?>]" id="cosyone_menu_custom_block_content<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($cosyone_menu_custom_block_content[$language['language_id']]) ? $cosyone_menu_custom_block_content[$language['language_id']] : ''; ?></textarea>
    </div>
	<?php } ?>
    </div>  
    

    </div> <!-- row ends -->
    </div> <!-- tab menu ends -->
    
    <div id="tab-product-page" class="tab-pane"> <!-- Tab product page start -->
    <h3><?php echo $text_heading_product_page;?></h3><hr />
    
    <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label">addThis share buttons</label>
    <select name="cosyone_product_share" class="form-control">
     <?php foreach($cosyone_product_share_list as $key=>$cosyone_product_share_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_product_share==$key) { echo " selected"; }?> ><?php echo $cosyone_product_share_list;?></option>
      <?php } ?>
      </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Show "You save" amount on specials</label>
     <select name="cosyone_product_yousave" class="form-control">
      <?php foreach($cosyone_product_yousave_list as $key=>$cosyone_product_yousave_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_product_yousave==$key) { echo " selected"; }?> ><?php echo $cosyone_product_yousave_list;?></option>
      <?php } ?>
      </select>
      <span class="help-block">* Extended price information with old price, special price and discount amount.</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Show Timer countdown on specials</label>
     <select name="cosyone_product_countdown" class="form-control">
      <?php foreach($cosyone_product_countdown_list as $key=>$cosyone_product_countdown_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_product_countdown==$key) { echo " selected"; }?> ><?php echo $cosyone_product_countdown_list;?></option>
      <?php } ?>
      </select>
      <span class="help-block">* Note that you need to set an end date on the special price to enable countdown.</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Show items sold/items left below countdown</label>
     <select name="cosyone_product_hurry" class="form-control">
      <?php foreach($cosyone_product_hurry_list as $key=>$cosyone_product_hurry_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_product_hurry==$key) { echo " selected"; }?> ><?php echo $cosyone_product_hurry_list;?></option>
      <?php } ?>
      </select>
    </div>
      
      <div class="col-sm-12 form-group">
	<label class="control-label">Image zoom alternative on product page</label>
     <select name="cosyone_product_zoom" class="form-control">
      <?php foreach($cosyone_product_zoom_list as $key=>$cosyone_product_zoom_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_product_zoom==$key) { echo " selected"; }?> ><?php echo $cosyone_product_zoom_list;?></option>
      <?php } ?>
      </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Image options style</label>
     <select name="cosyone_image_options" class="form-control">
      <?php foreach($cosyone_image_options_list as $key=>$cosyone_image_options_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_image_options==$key) { echo " selected"; }?> ><?php echo $cosyone_image_options_list;?></option>
      <?php } ?>
      </select>
      <span class="help-block">* If product has options with the type <i>Image</i>. Clean thumbs shows only the image, while Opencart default style shows radio button + image thumb + option name. If Clean thumb is used, the image thumbs will be 20px high.</span>
    </div>
    
    

    </div> <!-- row ends -->
    </div> <!-- Tab product page ends -->
    
    <div id="tab-category-page" class="tab-pane"> <!-- Tab product page start -->
    <h3>Category page</h3><hr />
    
    <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_menu_mega_show_thumb;?> *</label>
    <select name="cosyone_category_thumb" class="form-control">
	<?php foreach($cosyone_category_thumb_list as $key=>$cosyone_category_thumb_list) { ?>
	<option value="<?php echo $key;?>" <?php if($cosyone_category_thumb==$key) { echo " selected"; }?> ><?php echo $cosyone_category_thumb_list;?></option>
	<?php } ?>
	</select>
	<span class="help-block">* <?php echo $text_menu_mega_show_thumb_help;?></span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Show sub-categories on category pages</label>
    <select name="cosyone_category_refine" class="form-control">
      <?php foreach($cosyone_category_refine_list as $key=>$cosyone_category_refine_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_category_refine==$key) { echo " selected"; }?> ><?php echo $cosyone_category_refine_list;?></option>
      <?php } ?>
      </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Sub-categories per row</label>
     <select name="cosyone_category_per_row" class="form-control">
      <?php foreach($cosyone_category_per_row_list as $key=>$cosyone_category_per_row_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_category_per_row==$key) { echo " selected"; }?> ><?php echo $cosyone_category_per_row_list;?></option>
      <?php } ?>
      </select>
    </div>

     <div class="col-sm-6 form-group">
	<label class="control-label">Sub-categories thumb size (width)</label>
     <input type="text" class="form-control" value="<?php echo $cosyone_refine_image_w?>" name="cosyone_refine_image_w" />
    </div>
    
    <div class="col-sm-6 form-group">
	<label class="control-label">Sub-categories thumb size (height)</label>
     <input type="text" class="form-control" value="<?php echo $cosyone_refine_image_h?>" name="cosyone_refine_image_h" />
    </div>

    </div> <!-- row ends -->
    </div> <!-- Tab category page ends -->
    
    
    <div id="tab-contact-page" class="tab-pane"> <!-- Tab contact page start -->
    <h3>Contact page</h3><hr />
    
    <div class="row">
 	
    <div class="col-sm-12 form-group">
	<label class="control-label">Google maps iframe</label>
    <textarea name="cosyone_google_map" class="form-control" style="height:200px"><?php echo $cosyone_google_map; ?></textarea>
	<span class="help-block">* Look in the theme documentation how to find the iframe code.</span>
    </div>
      
    </div> <!-- row ends -->
    </div> <!-- Tab contact page ends -->
    
    
    
    <div id="tab-product-listings" class="tab-pane"> <!-- Tab product listings start -->
    <h3><?php echo $text_heading_product_listings;?></h3><hr />
    
    <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Quicklook translation</label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
   	<input type="text" class="form-control" value="<?php echo isset($cosyone_text_ql[$language['language_id']]) ? $cosyone_text_ql[$language['language_id']] : ''; ?>" name="cosyone_text_ql[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    <span class="help-block">* Leave blank to disable quicklook</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Product listing style</label>
    <select name="cosyone_default_product_style" class="form-control">
      <?php foreach($cosyone_default_product_style_list as $key=>$cosyone_default_product_style_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_default_product_style==$key) { echo " selected"; }?> ><?php echo $cosyone_default_product_style_list;?></option>
      <?php } ?>
      </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_default_product_listing;?></label>
   <select name="cosyone_default_view" class="form-control">
      <?php foreach($cosyone_default_view_list as $key=>$cosyone_default_view_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_default_view==$key) { echo " selected"; }?> ><?php echo $cosyone_default_view_list;?></option>
      <?php } ?>
      </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_grid_category;?></label>
   <select name="cosyone_grid_category" class="form-control">
      <?php foreach($cosyone_grid_category_list as $key=>$cosyone_grid_category_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_grid_category==$key) { echo " selected"; }?> ><?php echo $cosyone_grid_category_list;?></option>
      <?php } ?>
      </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_grid_related;?></label>
   <select name="cosyone_grid_related" class="form-control">
      <?php foreach($cosyone_grid_related_list as $key=>$cosyone_grid_related_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_grid_related==$key) { echo " selected"; }?> ><?php echo $cosyone_grid_related_list;?></option>
      <?php } ?>
      </select>
    </div>
    
	<div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_rollover_effect;?></label>
    <select name="cosyone_rollover_effect" class="form-control">
      <?php foreach($cosyone_rollover_effect_list as $key=>$cosyone_rollover_effect_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_rollover_effect==$key) { echo " selected"; }?> ><?php echo $cosyone_rollover_effect_list;?></option>
      <?php } ?>
      </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_percentage_sale_badge;?></label>
    <select name="cosyone_percentage_sale_badge" class="form-control">
      <?php foreach($cosyone_percentage_sale_badge_list as $key=>$cosyone_percentage_sale_badge_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_percentage_sale_badge==$key) { echo " selected"; }?> ><?php echo $cosyone_percentage_sale_badge_list;?></option>
      <?php } ?>
      </select>
    </div>
    
     <div class="col-sm-12 form-group">
	<label class="control-label">Show brand name</label>
    <select name="cosyone_brand" class="form-control">
      <?php foreach($cosyone_brand_list as $key=>$cosyone_brand_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_brand==$key) { echo " selected"; }?> ><?php echo $cosyone_brand_list;?></option>
      <?php } ?>
      </select>
    </div>
     
    </div> <!-- row ends -->
    
    </div> <!-- Tab product listings ends -->
    
    <div id="tab-footer" class="tab-pane"> <!-- Tab footer start -->
    <h3>Footer modules</h3><hr />
    
    <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Modules per row</label>
    <select name="cosyone_footer_columns" class="form-control">
	<?php foreach($cosyone_footer_columns_list as $key=>$cosyone_footer_columns_list) { ?>
	<option value="<?php echo $key;?>" <?php if($cosyone_footer_columns==$key) { echo " selected"; }?> ><?php echo $cosyone_footer_columns_list;?></option>
	<?php } ?>
	</select>
    </div>
    
    </div> <!-- row ends -->
    
    <h3>Footer static block</h3><hr />
    
    <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Title</label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
   	<input type="text" class="form-control" value="<?php echo isset($cosyone_footer_custom_block_title[$language['language_id']]) ? $cosyone_footer_custom_block_title[$language['language_id']] : ''; ?>" name="cosyone_footer_custom_block_title[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    </div>
       
    <div class="col-sm-12 form-group">
	<label class="control-label">Custom content</label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
    <textarea name="cosyone_footer_custom_block[<?php echo $language['language_id']; ?>]" id="cosyone_footer_custom_block<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($cosyone_footer_custom_block[$language['language_id']]) ? $cosyone_footer_custom_block[$language['language_id']] : ''; ?></textarea>
    </div>
	<?php } ?>
    </div>
    
   </div> <!-- row ends -->
    
    <h3><?php echo $text_upload_payment_icon;?></h3><hr />
    
    <div class="row">
    
     <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_upload_payment_icon;?> </label><br />
	<a href="" id="thumb-payment" data-toggle="image" class="img-thumbnail"><img src="<?php echo $cosyone_footer_payment; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
	<input type="hidden" name="cosyone_footer_payment_icon" value="<?php echo $cosyone_footer_payment_icon; ?>" id="input-payment" />
	</div>
    
    </div> <!-- row ends -->
    </div> <!-- Tab footer ends -->
    
    <div id="tab-cookie" class="tab-pane"> <!-- Tab cookie control start -->
    <h3>Cookie notification</h3><hr />
    
    <div class="row">
 	
    <div class="col-sm-12 form-group">
	<label class="control-label">Show cookie notification</label>
    <select name="cosyone_use_cookie" class="form-control">
      <?php foreach($cosyone_use_cookie_list as $key=>$cosyone_use_cookie_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_cookie==$key) { echo " selected"; }?> ><?php echo $cosyone_use_cookie_list;?></option>
      <?php } ?>
      </select>
    </div>
    
	<div class="col-sm-12 form-group">
	<label class="control-label">Cookie information text</label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
   	<input type="text" class="form-control" value="<?php echo isset($cosyone_cookie_text[$language['language_id']]) ? $cosyone_cookie_text[$language['language_id']] : ''; ?>" name="cosyone_cookie_text[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    </div>
	
    <div class="col-sm-12 form-group">
	<label class="control-label">Read more link</label>
    <input type="text" class="form-control" value="<?php echo $cosyone_readmore_url?>" name="cosyone_readmore_url" size="40" />
    <span class="help-block">* Include fulll URL including http://<br />Leave empty to disable the Read more-button</span>
    </div>

    <div class="col-sm-12 form-group">
	<label class="control-label">Button text "Read more"</label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
   	<input type="text" class="form-control" value="<?php echo isset($cosyone_cookie_button_readmore[$language['language_id']]) ? $cosyone_cookie_button_readmore[$language['language_id']] : ''; ?>" name="cosyone_cookie_button_readmore[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Button text "Accept cookies"</label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
   	<input type="text" class="form-control" value="<?php echo isset($cosyone_cookie_button_accept[$language['language_id']]) ? $cosyone_cookie_button_accept[$language['language_id']] : ''; ?>" name="cosyone_cookie_button_accept[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    </div>
    
      
    </div> <!-- row ends -->
    
    </div> <!-- Tab cookie control ends -->
    
    <div id="tab-explorer" class="tab-pane"> <!-- Tab internet explorer start -->
    <h3>Warning for old Internet Explorer users</h3><hr />
    <div class="row">
 	
    <div class="col-sm-12 form-group">
	<label class="control-label">Show message to IE users</label>
    <select name="cosyone_use_ie" class="form-control">
      <?php foreach($cosyone_use_ie_list as $key=>$cosyone_use_ie_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_ie==$key) { echo " selected"; }?> ><?php echo $cosyone_use_ie_list;?></option>
      <?php } ?>
      </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Information text</label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
   	<input type="text" class="form-control" value="<?php echo isset($cosyone_ie_text[$language['language_id']]) ? $cosyone_ie_text[$language['language_id']] : ''; ?>" name="cosyone_ie_text[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Update now link</label>
    <input type="text" class="form-control" value="<?php echo $cosyone_ie_url?>" name="cosyone_ie_url" size="40" />
    <span class="help-block">Leave empty to disable the Update now button</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">"Update now" button text</label>
    <?php foreach ($languages as $language) { ?>
    <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
   	<input type="text" class="form-control" value="<?php echo isset($cosyone_ie_update_text[$language['language_id']]) ? $cosyone_ie_update_text[$language['language_id']] : ''; ?>" name="cosyone_ie_update_text[<?php echo $language['language_id']; ?>]" />
    </div>
	<?php } ?>
    </div>    
      
    </div> <!-- row ends -->
    </div> <!-- Tab internet explorer ends -->
    </div>
    </div>
    </div> <!-- row ends -->
    
    </div> <!-- #tab-general ends -->
    
    <div id="tab-design" class="tab-pane">
    
   

    <div class="row">
    
    
    <div class="col-sm-2 tabs-left">
    <ul class="nav nav-tabs nav-stacked">
    <li class="active"><a href="#tab-custom-design" data-toggle="tab">Custom design</a></li>
    <li><a href="#tab-font" data-toggle="tab">Custom fonts</a></li>
    </ul> <!-- vtabs ends -->
    </div>
    
    
    <div class="col-sm-10">
    <div class="tab-content">
    <div id="tab-custom-design" class="tab-pane active"> <!-- Tab design start -->
    
     
    <h3>Enable custom design</h3><hr />
    <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_design;?></label>
    <select name="cosyone_use_custom" class="form-control">
      <?php foreach($cosyone_use_custom_list as $key=>$cosyone_use_custom_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_custom==$key) { echo " selected"; }?> ><?php echo $cosyone_use_custom_list;?></option>
      <?php } ?>
      </select>
      <span class="help-block"><a id="reset_design" style="cursor:pointer;">Click here</a> to automatically fill in the default design scheme</span>
    </div>
    
      </div> <!-- row ends -->
      
      <h3>Container</h3><hr />
      <div class="row">
      
	<div class="col-sm-12 form-group">
	<label class="control-label">Container layout</label>
     <select name="cosyone_container_layout" class="form-control">
      <?php foreach($cosyone_container_layout_list as $key=>$cosyone_container_layout_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_container_layout==$key) { echo " selected"; }?> ><?php echo $cosyone_container_layout_list;?></option>
      <?php } ?>
      </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Body background color</label>
     <input type="text" class="form-control" value="<?php echo $cosyone_body_background?>" name="cosyone_body_background" id="cosyone_body_background" />
    <span class="help-block">* If Container layout is boxed</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Body background image</label>
     <select name="cosyone_body_image" id="cosyone_body_image" class="form-control">
      <?php foreach($cosyone_body_image_list as $key=>$cosyone_body_image_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_body_image==$key) { echo " selected"; }?> ><?php echo $cosyone_body_image_list;?></option>
      <?php } ?>
      </select>
    <span class="help-block">* If Container layout is boxed</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<div id="body_preview" style="width:100%;height:250px;background-color:#<?php echo $cosyone_body_background?>;background-image: url('../catalog/view/theme/cosyone/image/patterns/<?php echo $cosyone_body_image?>');">
      </div>
    <i class="help-block">* Preview of body background</i>
    </div>
            
      <div class="col-sm-12 form-group">
	<label class="control-label">Custom background image</label><br />
	<a href="" id="thumb-bg" data-toggle="image" class="img-thumbnail"><img src="<?php echo $cosyone_custom_bg; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
	<input type="hidden" name="cosyone_custom_bg_icon" id="input-bg" value="<?php echo $cosyone_custom_bg_icon; ?>" />
    <span class="help-block">* Custom background images will not be previewed above</span>
	</div>
    

      </div> <!-- row ends -->
      
      <h3>Top line</h3><hr />
      
      <div class="row">
      
      <div class="col-sm-12 form-group">
	<label class="control-label">Top line background</label>
     <input type="text" class="form-control" value="<?php echo $cosyone_top_border_background?>" name="cosyone_top_border_background" id="cosyone_top_border_background" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Top line border color</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_top_border_border?>" name="cosyone_top_border_border" id="cosyone_top_border_border" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Top line default text color</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_top_border_text?>" name="cosyone_top_border_text" id="cosyone_top_border_text" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Top line links</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_top_border_link?>" name="cosyone_top_border_link" id="cosyone_top_border_link" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Top line links (hover)</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_top_border_link_hover?>" name="cosyone_top_border_link_hover" id="cosyone_top_border_link_hover" />
    </div>
      
      </div> <!-- row ends -->
      
       <h3><?php echo $text_heading_design_main_menu;?></h3><hr />
       
       <div class="row">
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_main_menu_background;?></label>
	<input type="text" class="form-control" value="<?php echo $cosyone_menu_background?>" name="cosyone_menu_background" id="cosyone_menu_background" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_main_menu_link_color;?></label>
	<input type="text" class="form-control" value="<?php echo $cosyone_menu_link_color?>" name="cosyone_menu_link_color" id="cosyone_menu_link_color" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Menu link color (hover/active)</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_menu_link_color_hover?>" name="cosyone_menu_link_color_hover" id="cosyone_menu_link_color_hover" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Menu link background (hover/active)</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_menu_link_background_hover?>" name="cosyone_menu_link_background_hover" id="cosyone_menu_link_background_hover" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Shortcut separator color</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_shortcut_separator?>" name="cosyone_shortcut_separator" id="cosyone_shortcut_separator" />
    <span class="help-block">Separator between cart, compare &amp; wishlist if Header 1 is enabled</span>
    </div>

      </div> <!-- row ends -->
      
       <h3>General color</h3><hr />
       
       <div class="row">
       
    <div class="col-sm-12 form-group">
	<label class="control-label">Default link hover color</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_link_hover_color?>" name="cosyone_link_hover_color" id="cosyone_link_hover_color" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Primary color</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_primary_color?>" name="cosyone_primary_color" id="cosyone_primary_color" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_secondary_color;?></label>
	<input type="text" class="form-control" value="<?php echo $cosyone_secondary_color?>" name="cosyone_secondary_color" id="cosyone_secondary_color" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Offer color</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_offer_color?>" name="cosyone_offer_color" id="cosyone_offer_color" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_salebadge_background;?></label>
	<input type="text" class="form-control" value="<?php echo $cosyone_salebadge_background?>" name="cosyone_salebadge_background" id="cosyone_salebadge_background" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_price_color;?></label>
	<input type="text" class="form-control" value="<?php echo $cosyone_price_color?>" name="cosyone_price_color" id="cosyone_price_color" />
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_icons_background_hover;?></label>
	<input type="text" class="form-control" value="<?php echo $cosyone_icons_background_hover?>" name="cosyone_icons_background_hover" id="cosyone_icons_background_hover" />
    <span class="help-block">* Such as slider arrows and header drop down headings</span>
    </div>
      
      </div> <!-- row ends -->
     
       <h3><?php echo $text_heading_buttons;?></h3><hr />
       
       <div class="row">
      
      <div class="col-sm-12 form-group">
	<h4>Default button</h4>
    </div>
      
      <div class="col-sm-4 form-group">
	<label class="control-label">Color</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_button_color?>" name="cosyone_button_color" id="cosyone_button_color" />
    </div>
    
    <div class="col-sm-4 form-group">
	<label class="control-label">Border color</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_button_border?>" name="cosyone_button_border" id="cosyone_button_border" />
    </div>
    
    <div class="col-sm-4 form-group">
	<label class="control-label">Background</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_button_background?>" name="cosyone_button_background" id="cosyone_button_background" />
    </div>
    
    
    <div class="col-sm-4 form-group">
	<label class="control-label">Color (hover)</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_button_hover_color?>" name="cosyone_button_hover_color" id="cosyone_button_hover_color" />
    </div>
    
    <div class="col-sm-4 form-group">
	<label class="control-label">Border color (hover)</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_button_hover_border?>" name="cosyone_button_hover_border" id="cosyone_button_hover_border" />
    </div>
    
    <div class="col-sm-4 form-group">
	<label class="control-label">Background (hover)</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_button_hover_background?>" name="cosyone_button_hover_background" id="cosyone_button_hover_background" />
    </div>
    
 <div class="col-sm-12 form-group">
	<h4><br />Contrast button</h4>
    </div>
      
      <div class="col-sm-4 form-group">
	<label class="control-label">Color</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_button2_color?>" name="cosyone_button2_color" id="cosyone_button2_color" />
    </div>
    
    <div class="col-sm-4 form-group">
	<label class="control-label">Border color</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_button2_border?>" name="cosyone_button2_border" id="cosyone_button2_border" />
    </div>
    
    <div class="col-sm-4 form-group">
	<label class="control-label">Background</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_button2_background?>" name="cosyone_button2_background" id="cosyone_button2_background" />
    </div>
    
    
    <div class="col-sm-4 form-group">
	<label class="control-label">Color (hover)</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_button2_hover_color?>" name="cosyone_button2_hover_color" id="cosyone_button2_hover_color" />
    </div>
    
    <div class="col-sm-4 form-group">
	<label class="control-label">Border color (hover)</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_button2_hover_border?>" name="cosyone_button2_hover_border" id="cosyone_button2_hover_border" />
    </div>
    
    <div class="col-sm-4 form-group">
	<label class="control-label">Background (hover)</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_button2_hover_background?>" name="cosyone_button2_hover_background" id="cosyone_button2_hover_background" />
    </div>
      
     
       
      </div> <!-- row ends -->
       
      </div> <!-- Tab design end -->
      
       <div id="tab-font" class="tab-pane"> <!-- Tab font start -->
       
       <h3>Enable custom fonts</h3><hr />
    
       <div class="row">
      
      
    
      <div class="col-sm-12 form-group">
	<label class="control-label">Use custom fonts</label>
	<select name="cosyone_use_custom_font" class="form-control">
      <?php foreach($cosyone_use_custom_font_list as $key=>$cosyone_use_custom_font_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_custom_font==$key) { echo " selected"; }?> ><?php echo $cosyone_use_custom_font_list;?></option>
      <?php } ?>
      </select>
    <span class="help-block">* If set as Disabled, the default font Roboto will be used<br />* All available fonts can be found <a href="http://www.google.com/fonts/" target="_blank">here</a></span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Main font import</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_font1_import?>" name="cosyone_font1_import" id="cosyone_font1_import" />
    <span class="help-block"><i>This font will be used as body font, for paragraps etc.</i><br />Example: Exo:300,400,700</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Main font name</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_font1_name?>" name="cosyone_font1_name" id="cosyone_font1_name" />
    <span class="help-block">Example: font-family: 'Exo', sans-serif;</span>
    </div>
      
    <div class="col-sm-12 form-group">
	<label class="control-label">Contrast font import</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_font2_import?>" name="cosyone_font2_import" id="cosyone_font2_import" />
    <span class="help-block"><i>This font will be used as headings, menu links etc.</i><br />
Example: Alegreya+Sans+SC:300,400,700</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Contrast font name</label>
	<input type="text" class="form-control" value="<?php echo $cosyone_font2_name?>" name="cosyone_font2_name" id="cosyone_font2_name" />
    <span class="help-block">Example: font-family: 'Alegreya Sans SC', sans-serif;</span>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Font weight: Light</label>
	<select name="cosyone_use_font_light" class="form-control">
	<?php foreach($cosyone_use_font_light_list as $key=>$cosyone_use_font_light_list) { ?>
	<option value="<?php echo $key;?>" <?php if($cosyone_use_font_light==$key) { echo " selected"; }?> ><?php echo $cosyone_use_font_light_list;?></option>
	<?php } ?>
    </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Font weight: Regular</label>
	<select name="cosyone_use_font_regular" class="form-control">
      <?php foreach($cosyone_use_font_regular_list as $key=>$cosyone_use_font_regular_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_font_regular==$key) { echo " selected"; }?> ><?php echo $cosyone_use_font_regular_list;?></option>
      <?php } ?>
      </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Font weight: Medium</label>
	<select name="cosyone_use_font_semibold" class="form-control">
      <?php foreach($cosyone_use_font_semibold_list as $key=>$cosyone_use_font_semibold_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_font_semibold==$key) { echo " selected"; }?> ><?php echo $cosyone_use_font_semibold_list;?></option>
      <?php } ?>
      </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Font weight: Bold</label>
	<select name="cosyone_use_font_bold" class="form-control">
      <?php foreach($cosyone_use_font_bold_list as $key=>$cosyone_use_font_bold_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_font_bold==$key) { echo " selected"; }?> ><?php echo $cosyone_use_font_bold_list;?></option>
      <?php } ?>
      </select>
    </div>
     
      
      
      </div> <!-- row ends -->
       
       
       
      </div> <!-- Tab font end -->
      </div>
      </div>
      </div>
      </div> <!-- #tab-design ends -->
      
      <div id="tab-custom-css" class="tab-pane">
      
      
      <div class="row">
    
    
    <div class="col-sm-2 tabs-left">
    <ul class="nav nav-tabs nav-stacked">
    <li class="active"><a href="#tab-custom-css-final" data-toggle="tab">Custom CSS</a></li>
    <li><a href="#tab-custom-javascript" data-toggle="tab">Custom Javascript</a></li>
    </ul> 
    </div>
      
      <div class="col-sm-10">
      
      <div class="tab-content">
      
      
      <div id="tab-custom-css-final" class="tab-pane active">
      
      <div class="row">
      
      
	<div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_use_custom_css;?></label>
	<select name="cosyone_use_custom_css" class="form-control">
	<?php foreach($cosyone_use_custom_css_list as $key=>$cosyone_use_custom_css_list) { ?>
	<option value="<?php echo $key;?>" <?php if($cosyone_use_custom_css==$key) { echo " selected"; }?> ><?php echo $cosyone_use_custom_css_list;?></option>
	<?php } ?>
	</select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label"><?php echo $text_custom_css;?></label>
	<textarea class="form-control" style="height:250px" name="cosyone_custom_css_content"><?php echo $cosyone_custom_css_content?></textarea>
    <span class="help-block"><?php echo $text_custom_css_help;?></span>
    </div>

    
      
       </div> <!-- row ends -->
      
      </div>
      
      <div id="tab-custom-javascript" class="tab-pane">
      <div class="row">
      
      
      <div class="col-sm-12 form-group">
	<label class="control-label">Enable custom Javascript</label>
	 <select name="cosyone_use_custom_javascript" class="form-control">
      <?php foreach($cosyone_use_custom_javascript_list as $key=>$cosyone_use_custom_javascript_list) { ?>
      <option value="<?php echo $key;?>" <?php if($cosyone_use_custom_javascript==$key) { echo " selected"; }?> ><?php echo $cosyone_use_custom_javascript_list;?></option>
      <?php } ?>
      </select>
    </div>
    
    <div class="col-sm-12 form-group">
	<label class="control-label">Javascript content</label>
	 <textarea class="form-control" style="height:250px" name="cosyone_custom_javascript_content"><?php echo $cosyone_custom_javascript_content?></textarea>
	  <span class="help-block">Use plain scripts without tags</span>
    </div>
    
      </div> <!-- row ends -->
      
      </div>
      </div>
      </div>
      </div> <!-- #tab-custom-css/script ends -->
      </div> <!-- Tab content ends -->
      
     </form>
    </div> <!-- content ends -->
  </div>
  </div>
  </div>
<style>
label {
	font-weight:normal;
	font-size:14px;
	color:#333333;
}
.row {
	margin-bottom:25px;
}
.input-group, .help-block {
	margin-bottom:5px;
}
.nav-tabs.main a {
	font-size:14px;
}
a, a:hover, a:active, a:focus {
   outline: 0;
}
.tabs-left > .nav-tabs > li,
.tabs-right > .nav-tabs > li {
  float: none;
}

.tabs-left > .nav-tabs > li > a,
.tabs-right > .nav-tabs > li > a {
  min-width: 74px;
  margin-right: 0;
  margin-bottom: 3px;
}

.tabs-left > .nav-tabs {
  border-right: 1px solid #ddd;
  border-bottom:none;
}

.tabs-left > .nav-tabs > li > a {
  margin-right: -1px;
  -webkit-border-radius: 4px 0 0 4px;
     -moz-border-radius: 4px 0 0 4px;
          border-radius: 4px 0 0 4px;
}

.tabs-left > .nav-tabs > li > a:hover,
.tabs-left > .nav-tabs > li > a:focus {
  border-color: #eeeeee #dddddd #eeeeee #eeeeee;
}

.tabs-left > .nav-tabs .active > a,
.tabs-left > .nav-tabs .active > a:hover,
.tabs-left > .nav-tabs .active > a:focus {
  border-color: #ddd transparent #ddd #ddd;
  *border-right-color: #ffffff;
}
hr {
	margin-top:10px;
}
</style>
<!-- Import requred files --> 
<script type="text/javascript" src="view/javascript/colorpicker/js/colorpicker.js"></script>
<link rel="stylesheet" type="text/css" href="view/javascript/colorpicker/css/colorpicker.css" />
<!-- Import requred files -->

<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#cosyone_menu_custom_block_content<?php echo $language['language_id']; ?>').summernote({height: 200});
<?php } ?>

<?php foreach ($languages as $language) { ?>
$('#cosyone_footer_custom_block<?php echo $language['language_id']; ?>').summernote({height: 200});
<?php } ?>

//--></script>

<script type="text/javascript"><!--
$('#cosyone_header_text, #cosyone_user_menu_text, #cosyone_user_menu_text_hover, #cosyone_menu_link_color, #cosyone_menu_link_color_hover, #cosyone_menu_link_background_hover, #cosyone_shortcut_separator, #cosyone_primary_color, #cosyone_link_hover_color, #cosyone_secondary_color, #cosyone_offer_color, #cosyone_h1_color, #cosyone_heading_color, #cosyone_footer_heading, #cosyone_footer_links, #cosyone_footer_links_hover, #cosyone_user_menu_background, #cosyone_search_field_text, #cosyone_search_field_background, #cosyone_search_field_background_hover, #cosyone_top_border_background, #cosyone_top_border_border, #cosyone_top_border_text, #cosyone_top_border_link_hover, #cosyone_top_border_link, #cosyone_highlight_background, #cosyone_salebadge_background, #cosyone_price_color, #cosyone_module_heading_background, #cosyone_module_heading_color, #cosyone_product_tabs_heading, #cosyone_product_tabs_content, #cosyone_button_color, #cosyone_button_background, #cosyone_button_border, #cosyone_button_hover_color, #cosyone_button_hover_background, #cosyone_button_hover_border, #cosyone_button2_color, #cosyone_button2_background, #cosyone_button2_border, #cosyone_button2_hover_color, #cosyone_button2_hover_background, #cosyone_button2_hover_border, #cosyone_button3_color, #cosyone_button3_background, #cosyone_button3_border, #cosyone_button3_hover_color, #cosyone_button3_hover_background, #cosyone_button3_hover_border, #cosyone_icons_background, #cosyone_icons_background_hover, #cosyone_footer_social_icons_background, #cosyone_footer_social_icons_hover').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val(hex);
		$(el).ColorPickerHide();
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
	
});
// Header background also change header preview
$('#cosyone_body_background').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val(hex);
		$(el).ColorPickerHide();
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	},
	onChange: function (hsb, hex, rgb) {
		$('#body_preview').css('backgroundColor', '#' + hex);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
});
// Menu background also change menu preview
$('#cosyone_menu_background').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val(hex);
		$(el).ColorPickerHide();
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	},
	onChange: function (hsb, hex, rgb) {
		$('#menu_preview').css('backgroundColor', '#' + hex);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
});

//--></script> 
<script type="text/javascript"><!--
// Update background images in header preview 
$("#cosyone_body_image").change(function () {
	$('#body_preview').css('background-image', 'url("../catalog/view/theme/cosyone/image/patterns/' + $(this).val() +'")');
});
//--></script>
<script type="text/javascript"><!--
// Update background images in menu preview 
$("#cosyone_menu_pattern1").change(function () {
	$('#menu_preview').css('background-image', 'url("../catalog/view/theme/cosyone/image/patterns/' + $(this).val() +'.png")');
});
$("#cosyone_menu_pattern2").change(function () {
	$('#menu_preview2').css('background-image', 'url("../catalog/view/theme/cosyone/image/patterns/' + $(this).val() +'.png")');
});
//--></script>
<script type="text/javascript"><!--
// Update background images in header preview 
$("#cosyone_footer_pattern1").change(function () {
	$('#footer_preview').css('background-image', 'url("../catalog/view/theme/cosyone/image/patterns/' + $(this).val() +'.png")');
});
$("#cosyone_footer_pattern2").change(function () {
	$('#footer_preview2').css('background-image', 'url("../catalog/view/theme/cosyone/image/patterns/' + $(this).val() +'.png")');
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 

<script type="text/javascript"><!-- 
$('#reset_design').click(function() {    
$('#cosyone_container_layout').val("boxed").attr("selected", "selected");
$('#cosyone_body_background').val("ffffff");
$('#cosyone_body_image').val("1.jpg").attr("selected", "selected");
$('#cosyone_top_border_background').val("f9f9fa");
$('#cosyone_top_border_border').val("e5e5e5");
$('#cosyone_top_border_text').val("8c8c8c");
$('#cosyone_top_border_link').val("222226");
$('#cosyone_top_border_link_hover').val("276658");
$('#cosyone_menu_background').val("222226");
$('#cosyone_menu_link_color').val("bdbebf");
$('#cosyone_menu_link_color_hover').val("ffffff");
$('#cosyone_menu_link_background_hover').val("d6a916");
$('#cosyone_link_hover_color').val("276658");
$('#cosyone_primary_color').val("d6a916");
$('#cosyone_secondary_color').val("276658");
$('#cosyone_offer_color').val("2c6095");
$('#cosyone_salebadge_background').val("d6a916");
$('#cosyone_price_color').val("276658");
$('#cosyone_icons_background_hover').val("222222");

$('#cosyone_button_color').val("222222");
$('#cosyone_button_border').val("222222");
$('#cosyone_button_background').val("ffffff");
$('#cosyone_button_hover_color').val("ffffff");
$('#cosyone_button_hover_border').val("222222");
$('#cosyone_button_hover_background').val("222222");

$('#cosyone_button2_color').val("d6a916");
$('#cosyone_button2_border').val("d6a916");
$('#cosyone_button2_background').val("ffffff");
$('#cosyone_button2_hover_color').val("ffffff");
$('#cosyone_button2_hover_border').val("d6a916");
$('#cosyone_button2_hover_background').val("d6a916");
});
//--></script>

<?php echo $footer; ?>