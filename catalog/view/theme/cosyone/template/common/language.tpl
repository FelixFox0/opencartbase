<?php if (count($languages) > 1) { ?>
<div class="language_current contrast_font">
<?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $code) { ?>
    <a class="head"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
    <i class="fa fa-angle-down"></i></a>
    <?php } ?>
    <?php } ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
 
  <div class="top_header_drop_down">
    <?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $code) { ?>
    <a class="current"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /><?php echo $language['name']; ?></a>
    <?php } else { ?>
    <a href="<?php echo $language['code']; ?>">
    <img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /><?php echo $language['name']; ?></a>
    <?php } ?>
    <?php } ?>
    <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </div>
</form>
</div>
<?php } ?>