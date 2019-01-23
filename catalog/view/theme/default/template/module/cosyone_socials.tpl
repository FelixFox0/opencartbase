<div class="box">
<?php if ($module_title){ ?>
<div class="box-heading"><?php echo $module_title; ?></div>
<?php } ?>
<div class="box-content icons_wrapper">
<?php foreach($sections as $section){ ?>
<a href="<?php echo $section['link']; ?>" class="<?php echo $section['link_type']; ?> sq_icon" <?php if ($section['tooltip']){ ?> data-tooltip="<?php echo $section['tooltip']; ?>" <?php } ?>><i class="fa <?php echo $section['social_type']; ?>"></i></a>
<?php } ?>
<div class="clearfix"></div>
</div>
</div>