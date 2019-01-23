
<?php if ($module_title){ ?>
<div class="box-heading"><?php echo $module_title; ?></div>
<?php } ?>
<div class="box rich_banner grid_holder">
<?php foreach($sections as $section){ ?>
<div class="banner_<?php echo $columns; ?>">
<div class="image zoom_image_container"><img class="zoom_image" alt="" src="<?php echo $section['image']; ?>" />
<?php echo $section['description']; ?>
</div>
</div>
<?php } ?>
</div>