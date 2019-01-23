<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      
      
      <?php if ($testimonials) { ?>
    
      <?php foreach ($testimonials as $testimonial) { ?>
      
      <div class="testimonial_list">
      <span class="heading"><?php echo $testimonial['title']; ?></span>

          <div class="testimonial"><?php echo $testimonial['description'] ; ?></div>

          
			<div class="contrast_font">
			<?php echo $testimonial['name']; ?>, 
			<span class="city"><?php echo $testimonial['city']; ?></span>
			</div>

                <?php if ($testimonial['rating']) { ?>
                <span class="rating r<?php echo $testimonial['rating']; ?>">
                <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                </span>
                <?php } ?>
    	</div>
      <?php } ?>

    	<?php if ( isset($pagination)) { ?>
    		<div class="pagination"><?php echo $pagination;?></div>
    		<div class="buttons" align="right">
            <a class="button remove" href="<?php echo $write_url;?>" title="<?php echo $write;?>"><i class="fa fa-pencil"></i> <?php echo $write;?></a>
            </div>
    	<?php }?>

    	<?php if (isset($showall_url)) { ?>
    		<div class="buttons" align="right">
            <a class="button remove" href="<?php echo $write_url;?>" title="<?php echo $write;?>"><i class="fa fa-pencil"></i> <?php echo $write;?></a>
            <a class="button remove" href="<?php echo $showall_url;?>" title="<?php echo $showall;?>"><?php echo $showall;?></a>
            </div>
    	<?php }?>
    <?php } ?>
      
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 