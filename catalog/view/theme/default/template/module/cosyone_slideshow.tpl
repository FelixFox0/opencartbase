<div class="r_slideshow-wrapper">
<a class="slider_next<?php echo $module; ?> slide_arrow_next icon"><i class="fa fa-angle-right"></i></a>
<a class="slider_prev<?php echo $module; ?> slide_arrow_prev icon"><i class="fa fa-angle-left"></i></a>
<div class="cycle-slideshow"
    data-cycle-slides="> div"
    data-cycle-pager=".cycle-pager"
    data-cycle-fx="<?php echo $chosen_transition_effect; ?>"
	data-cycle-easing="<?php echo $chosen_easing_effect; ?>"
	data-cycle-sync="<?php echo $chosen_sync_effect; ?>"
	data-cycle-delay="<?php echo $slider_delaytime; ?>"
	data-cycle-timeout="<?php echo $slider_pausetime; ?>"
	data-cycle-speed="<?php echo $slider_transition_speed; ?>"
	data-cycle-pause="1"
	data-cycle-prev=".slider_prev<?php echo $module; ?>"
	data-cycle-next=".slider_next<?php echo $module; ?>"
    data-cycle-swipe="true">
    
    <?php foreach ($banners as $banner) { ?>
		<?php if ($banner['link']) { ?>
		<div><a href="<?php echo $banner['link']; ?>">
        <img src="<?php echo $banner['image']; ?>" class="slide" alt="<?php echo $banner['title']; ?>" />
        </a></div>
   		<?php } else { ?>
    	<div><img src="<?php echo $banner['image']; ?>" class="slide" alt="<?php echo $banner['title']; ?>" /></div>
    	<?php } ?>
    	<?php } ?>
</div>
<div class="cycle-pager"></div>
</div>