<div class="box">
<div class="box-heading"><?php echo $heading_title_category; ?></div>
<div class="box-content box-category">
<?php if (!empty($categories)) { ?>
<ul>
<?php foreach ($categories as $category_1) { ?>
   <?php if ($category_1['category_1_id'] == $category_1_id) { ?>
     <li class="open active"><a href="<?php echo $category_1['href']; ?>" ><?php echo $category_1['name']; ?></a>
      <?php } else { ?>
      <li><a href="<?php echo $category_1['href']; ?>" ><?php echo $category_1['name']; ?></a> 
      <?php } ?>
      <?php if ($category_1['children']) { ?>
      <div class="sign"><span class="plus">+</span><span class="minus">-</span></div>
      <ul>
      <?php foreach ($category_1['children'] as $category_2) { ?>
      <li class="active"><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a></li>
      <?php } ?>
      </ul>
      <?php } ?>
    </li>
    <?php } ?>
</ul>
<?php } ?>
</div>
</div>
<script>        
	$('.box-category li').bind().click(function(e) {
	$(this).toggleClass("open").find('>ul').stop(true, true).slideToggle(500)
	.end().siblings().find('>ul').slideUp().parent().removeClass("open");
	e.stopPropagation();
	});
	$('.blog-category li a').click(function(e) {
	e.stopPropagation();
	});
</script>