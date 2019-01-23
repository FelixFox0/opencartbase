<?php if ($testimonial_contrast) { ?>
</div> <!-- #content ends -->
<div class="clearfix"></div>
</div> <!-- .container ends -->
</div> <!-- .row ends -->
<div class="full_width_wrapper">
<div class="container">
<?php } ?>
<div class="box">
  <div class="box-heading"><?php echo $testimonial_title; ?></div>
  <div class="box-content">
    <div class="grid_holder <?php echo $testimonial_columns; ?>">
    <div class="product-grid testimonial m<?php echo $module; ?> <?php if ($testimonial_carousel) { ?>carousel<?php } ?> ">
      <?php foreach ($testimonials as $testimonial) { ?><!--
      --><div class="item testimonial">
          <a href="<?php echo $testimonial['link']; ?>" class="heading"><?php echo $testimonial['title']; ?></a>
          <div class="testimonial"><?php echo $testimonial['description'] ; ?></div>
			<div class="contrast_font">
			<a href="<?php echo $testimonial['link']; ?>"><?php echo $testimonial['name']; ?></a>, 
			<span class="city"><?php echo $testimonial['city']; ?></span>
			</div>
             <?php if ($testimonial['rating']) { ?>
              <span class="rating r<?php echo $testimonial['rating']; ?>">
              <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
              </span>
             <?php } ?>
      	</div><!--
      --><?php } ?>
	</div>
	<?php if ($testimonial_links) { ?>
    <div class="testimonials_links">
	<a href="<?php echo $showall_url;?>"><?php echo $show_all; ?></a>
	<a href="<?php echo $href_write_testimonial; ?>"><?php echo $write_testimonial; ?></a>
    </div>
	<?php } ?>
    </div>
  </div>
</div>
<?php if ($testimonial_contrast) { ?>
</div>
<div class="clearfix"></div>
</div>
<div>
<div class="container">
<div>
<?php } ?>
<?php if ($testimonial_carousel) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
var grid1 = 1;
var grid2 = 2;
var grid3 = 3;
var grid4 = 4;
$('.product-grid.testimonial.m<?php echo $module; ?>').owlCarousel({
itemsCustom: [[0, 1], [767, <?php echo $testimonial_columns; ?>]],
pagination: false,
navigation:true,
slideSpeed:500,
scrollPerPage:false,
navigationText: [
"<div class='slide_arrow_prev'><i class='fa fa-angle-left'></i></div>",
"<div class='slide_arrow_next'><i class='fa fa-angle-right'></i></div>"
]
}); 
});	
//--></script>
<?php } ?>