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
    <div class="blog_post">
	<?php if($main_thumb && $blogsetting_post_thumb){ ?>
    <div class="main_thumb zoom_image_container">
    <img src="<?php echo $blogsetting_post_thumb; ?>" class="zoom_image" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" />
    </div>
    <?php } ?>
    <div class="blog_summary">
    
    <div class="left contrast_font">
    <?php if($post_date_added_status){ ?>
    <div class="date_added blog_post secondary_background">
    <span class="day"><?php echo date("d",strtotime($date_added));?></span>
    <span class="month"><?php echo date("M",strtotime($date_added));?></span>
    </div>
    <?php } ?>
    
    <?php if($post_comments_count_status){ ?>
    <span class="comment_count"><i class="fa fa-comments"></i> <?php echo $comment_total;?></span>
    <?php } ?>
    
    <?php if($share_status){ ?>
    <div class="social-heading main_font"><?php echo $text_share_this;?></div>
    <!-- AddThis Button BEGIN -->
    <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
    <a class="addthis_button_preferred_1"></a>
    <a class="addthis_button_preferred_2"></a>
    <a class="addthis_button_preferred_3"></a>
    <a class="addthis_button_preferred_4"></a>
    <a class="addthis_button_compact"></a>
    </div>
    <script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js"></script>
    <!-- AddThis Button END -->
    <?php } ?>
    
    </div> <!-- left ends -->
                
    <div class="right">           
                
    <h1><?php echo $heading_title; ?></h1>
     
	<div class="blog_stats">
	<?php if($post_author_status){ ?><span><b class="text"><?php echo $text_posted_by; ?></b> <b class="hl"><?php echo $author; ?></b></span><?php } ?>
	<?php if($post_page_view_status){ ?><span><b class="text"><?php echo $text_read; ?></b> <b class="hl"><?php echo $new_read_counter_value; ?></b></span><?php } ?>
	</div>
    
	<?php echo $description; ?>
    
    <?php if ($tags) { ?>
	<div class="tags">
    <span class="contrast_font"><?php echo $text_tags; ?></span>
	<?php for ($i = 0; $i < count($tags); $i++) { ?>
	<?php if ($i < (count($tags) - 1)) { ?>
	<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>, 
	<?php } else { ?>
	<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
	<?php } ?>
	<?php } ?>
	</div>
	<?php } ?>
    </div>
    </div>

    <?php if ($related_blogs) { ?>
		<div class="box-heading"><?php echo $text_related_blog; ?></div>
		<div class="blog_grid_holder related column-<?php echo $rel_per_row; ?>">
            <?php foreach ($related_blogs as $blog) { ?>
            <div class="blog_item">
                <?php if(($blog['image']) && ($rel_thumb_status)){ ?>
                <div class="image zoom_image_container">
				<a href="<?php echo $blog['href']; ?>"><img src="<?php echo $blog['image']; ?>" class="zoom_image" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>" /></a>
                </div>
				<?php } ?>
                <div class="blog_summary">
                <div class="left contrast_font">
                <?php if($date_added_status){ ?>
            	<div class="date_added secondary_background">
				<span class="day"><?php echo date("d",strtotime($blog['date_added']));?></span>
				<span class="month"><?php echo date("M",strtotime($blog['date_added']));?></span>
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
                
                </div> <!-- right ends -->
               </div> <!-- summary ends -->
              </div> <!-- item ends -->
			<?php } ?>            
		</div>
	<?php } ?>
	 <!-- Related Blog End -->
	 
     <!-- Comment Area start -->
  		<?php if($allow_comment){ ?>
        <div class="box-heading"><?php echo $text_comments; ?></div>
              <form id="comment_form">
                <div id="comment"></div>
                <div class="box-heading"><?php echo $text_write_comment; ?></div>
                <div class="row">
				<div class="form-group col-sm-6 required">
                <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                <input type="text" name="name" value="" id="input-name" class="form-control" />
                </div>
                <div class="form-group col-sm-6 required">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="email" value="" id="input-email" class="form-control" />
                </div>
                </div>
                
                <div class="row">
                <div class="form-group col-sm-12 required">
                <label class="control-label" for="input-review"><?php echo $entry_comment; ?></label>
                <textarea name="comment" rows="5" id="input-comment" class="form-control"></textarea>
                </div>
                </div>
    
				<div class="row">
                <div class="col-sm-12">
                  <div class="form-group required">
                  <label class="control-label" for="input-captcha_comment"><?php echo $entry_captcha; ?></label>
                    <div class="input-group">
                    <span class="input-group-addon captcha_wrap"><img src="index.php?route=blog/blog/captcha" alt="" id="captcha_comment" /></span>
                    <input type="text" name="captcha_comment" value="" id="input-captcha_comment" class="form-control" />
                    </div>
                  </div>
                </div>
                </div>
    
				<div class="row">
                <div class="form-group col-sm-12 text-right">
                <button type="button" id="button-comment" class="btn btn-primary"><?php echo $button_send; ?></button>
                </div>
                </div>
				</form>
      <?php } ?>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--

$('#comment').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();
	$("html,body").animate({scrollTop:(($("#comment").offset().top)-50)},500);
    $('#comment').fadeOut(50);

    $('#comment').load(this.href);

    $('#comment').fadeIn(500);
	
});

$('#comment').load('index.php?route=blog/blog/comment&blog_id=<?php echo $blog_id; ?>');
//--></script>

<script type="text/javascript"><!--

$('#button-comment').on('click', function() {
	$.ajax({
		url: 'index.php?route=blog/blog/write&blog_id=<?php echo $blog_id; ?>',
		type: 'post',
		dataType: 'json',
		//data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&email=' + encodeURIComponent($('input[name=\'email\']').val()) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()) + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		data: $("#comment_form").serialize(),
		
		complete: function() {
			$('#button-comment').button('reset');
			$('input[name=\'captcha_comment\']').val('');
			$('#captcha_comment').attr('src', 'index.php?route=blog/blog/captcha#'+new Date().getTime());
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('#comment').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#comment').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				$('input[name=\'name\']').val('');
				$('input[name=\'email\']').val('');
				$('textarea[name=\'comment\']').val('');
				//$('input[name=\'captcha\']').val('');
			}
		}
	});
});     
</script>
<?php echo $footer; ?> 