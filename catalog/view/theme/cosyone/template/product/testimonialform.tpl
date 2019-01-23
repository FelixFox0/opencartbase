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
    <div id="content" class="<?php echo $class; ?> margin-b"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      
      <p><?php echo $text_conditions ?></p>
  
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="testimonial" class="form-horizontal">
        
    	<div class="form-group">
    	<div class="col-sm-12">
	    <label class="control-label" for="input-review"><?php echo $entry_title ?></label>
    	<input type="text" name="title" id="input-title" value="<?php echo $title; ?>" class="form-control" />
	    </div>
	    </div>
        
        <div class="form-group required">
    	<div class="col-sm-12">
	    <label class="control-label" for="input-desc"><?php echo $entry_enquiry ?></label>
    	<textarea name="description" rows="10" id="input-desc" class="form-control"><?php echo $description; ?></textarea>
    	<?php if ($error_enquiry) { ?>
        <span class="text-danger"><?php echo $error_enquiry; ?></span>
        <?php } ?>
	    </div>
	    </div>
        
        <div class="form-group ">      
        <div class="col-sm-12">
	    <label class="control-label"><?php echo $entry_rating; ?></label>
    	&nbsp;<small><?php echo $entry_bad; ?></small>&nbsp;
		<input type="radio" name="rating" value="1" style="margin: 0;" <?php if ( $rating == 1 ) echo 'checked="checked"';?> />
		&nbsp;
		<input type="radio" name="rating" value="2" style="margin: 0;" <?php if ( $rating == 2 ) echo 'checked="checked"';?> />
		&nbsp;
		<input type="radio" name="rating" value="3" style="margin: 0;" <?php if ( $rating == 3 ) echo 'checked="checked"';?> />
		&nbsp;
		<input type="radio" name="rating" value="4" style="margin: 0;" <?php if ( $rating == 4 ) echo 'checked="checked"';?> />
		&nbsp;
		<input type="radio" name="rating" value="5" style="margin: 0;" <?php if ( $rating == 5 ) echo 'checked="checked"';?> />
		&nbsp; <small><?php echo $entry_good; ?></small>
	    </div>
	    </div>
    
        <div class="form-group">
    	<div class="col-sm-12">
	    <label class="control-label" for="input-name"><?php echo $entry_name ?></label>
        <input type="text" name="name" id="input-name" value="<?php echo $name; ?>" class="form-control" />
	    </div>
	    </div>
        
        <div class="form-group">
    	<div class="col-sm-12">
	    <label class="control-label" for="input-city"><?php echo $entry_city ?></label>
        <input type="text" name="city" id="input-city" value="<?php echo $city; ?>" class="form-control" />
	    </div>
	    </div>
        
        <div class="form-group">
    	<div class="col-sm-12">
	    <label class="control-label" for="input-email"><?php echo $entry_email ?></label>
        <input type="text" name="email" id="input-email" value="<?php echo $email; ?>" class="form-control" />
	    </div>
	    </div>
        
        <div class="form-group required">
        <div class="col-sm-12">

                  <label class="control-label" for="input-captcha_comment"><?php echo $entry_captcha; ?></label>
                    <div class="input-group">
                    <span class="input-group-addon captcha_wrap"><img src="index.php?route=blog/blog/captcha" alt="" id="captcha_comment" /></span>
                    <input type="text" name="captcha_comment" value="" id="input-captcha_comment" class="form-control" />
					</div>
                    <?php if ($error_captcha) { ?>
                    <span class="text-danger"><?php echo $error_captcha; ?></span>
                    <?php } ?>
                  
                </div>
        </div>
        

        
        
        <div class="form-group">
    	<div class="col-sm-12 text-right"><input class="btn btn-primary" type="submit" value="<?php echo $button_send; ?>" /></div>
        </div>


    </form>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 