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
      <div class="blog blog_list">
		<h1><?php echo $heading_title; ?></h1>
  	
		<div class="main_description">
		<?php echo $blog_category_description; ?>
		</div>

  	<?php if($blogs){ ?>
		<div class="blog_grid_holder column-<?php echo $list_columns; ?>">
            
            <?php foreach ($blogs as $blog) { ?>
				<div class="blog_item">
                <?php if($blog['image']){ ?>
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
                <div class="blog_stats">
                <?php if($author_status){ ?><span><b class="text"><?php echo $text_posted_by; ?></b> <b class="hl"><?php echo $blog['author']; ?></b></span><?php } ?>
				<?php if($page_view_status){ ?><span><b class="text"><?php echo $text_read; ?></b> <b class="hl"><?php echo $blog['count_read']; ?></b></span><?php } ?>
                </div> <!-- blog-stats ends -->
                <p><?php echo $blog['short_description']; ?></p>
                <p><a href="<?php echo $blog['href']; ?>" class="button remove"><?php echo $text_read_more; ?></a></p>
                </div> <!-- right ends -->
               </div> <!-- summary ends -->
              </div> <!-- item ends -->

			<?php } ?>
            
          </div>
		<div class="row">
        <div class="col-sm-6 text-left"><?php echo $results; ?></div>
        <div class="col-sm-6 text-right"><?php echo $pagination; ?></div>
      </div>
	<?php }else{ ?>
		<?php echo $text_no_results; ?>
	<?php } ?>
    </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 