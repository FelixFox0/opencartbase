<?php if ($template == 'action2'){ ?>
</div> <!-- #content ends -->
<div class="clearfix"></div>
</div> <!-- .container ends -->
</div> <!-- .row ends -->
<div class="full_width_wrapper">
<div class="container">
<?php } ?>

<div class="box custom <?php echo $template; ?> <?php echo $columns; ?>">
<?php if ($module_title){ ?>
<div class="box-heading"><?php echo $module_title; ?></div>
<?php } ?>
<div class="box-content">
<?php foreach($sections as $section){ ?><!--
--><div class="box-single">
<?php if ($section['title']){ ?><div class="box-heading"><?php echo $section['title']; ?></div><?php } ?>
<?php echo $section['description']; ?>
</div><!--
--><?php } ?>
</div>
</div>

<?php if ($template == 'action2'){ ?>
</div>
<div class="clearfix"></div>
</div>
<div>
<div class="container">
<div>
<?php } ?>