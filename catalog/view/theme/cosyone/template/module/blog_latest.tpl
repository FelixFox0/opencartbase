<div class="box">
	<div class="box-heading"><?php echo $heading_title_latest; ?></div>
    <div class="box-content latest">
    <?php if(!empty($posts)){ ?>
	<div class="blog_grid_holder latest column-<?php echo $columns; ?> carousel-<?php echo $carousel; ?> <?php echo $module; ?>">
    <?php foreach ($posts as $blog) { ?>
				<div class="blog_item">
                <?php if($blog['image'] && $thumb){ ?>
                <div class="image zoom_image_container">
				<a href="<?php echo $blog['href']; ?>"><img src="<?php echo $blog['image']; ?>" class="zoom_image" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>" /></a>
                </div>
				<?php } ?>
                <div class="blog_summary">
                <div class="left contrast_font">
                <?php if($date_added_status){ ?>
            	<div class="date_added secondary_background">
				<span class="day"><?php echo date("d",strtotime($blog['date_added_full']));?></span>
				<span class="month"><?php echo date("M",strtotime($blog['date_added_full']));?></span>
				</div>
                <?php } ?>
                <?php if($comments_count_status){ ?>
        		<a href="<?php echo $blog['href'];?>" title="<?php echo $blog['title'];?>"><span class="comment_count"><i class="fa fa-comments"></i> <?php echo $blog['comment_total'];?></span></a>
				<?php } ?>
                </div> <!-- left ends -->
                
                <div class="right">
                <h2 class="blog_title"><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h2>
                
                <?php if(!$characters == '0'){ ?>
            	<p><?php echo $blog['description']; ?></p>
                <?php } ?>
                </div>
                </div>
               </div>
			<?php } ?>
		</div>
	<?php } ?>
</div>
</div>


<?php if($carousel) { ?>
<script type="text/javascript">
$(document).ready(function() {
$('.blog_grid_holder.carousel-1.<?php echo $module; ?>').owlCarousel({
itemsCustom: [ [0, 1], [500, 2], [767, <?php echo $columns;?>]],
pagination: false,
navigation:true,
navigationText: [
"<div class='slide_arrow_prev'><i class='fa fa-angle-left'></i></div>",
"<div class='slide_arrow_next'><i class='fa fa-angle-right'></i></div>"],
slideSpeed:500
}); });
</script>
<?php } ?>