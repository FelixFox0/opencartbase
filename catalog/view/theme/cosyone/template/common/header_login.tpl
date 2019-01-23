<?php if($cosyone_header_login == 'enabled'){ ?>
<?php if (!$logged) { ?>
	<div class="login_drop_heading contrast_font">
  		<a  class="log_link" href="<?php echo $login_link; ?>"><i class="fa fa-user"></i> <?php echo $text_login; ?></a>
   		<div id="login" class="top_header_drop_down">
   		<div class="top">
   		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
          <?php echo $entry_email; ?><br />
          <input type="text" name="email" class="login_input" value="<?php echo $email; ?>" />
          <?php echo $entry_password; ?><br />
          <input type="password" name="password" class="login_input" value="<?php echo $password; ?>" />
          <input type="submit" value="<?php echo $button_login; ?>" class="button active" />
          <?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
          <?php } ?>
      	</form>
       	<a href="<?php echo $forgotten; ?>" class="forgotten"><?php echo $text_forgotten; ?></a>
      </div>
      <div id="social_login_header_holder"></div>
      <div class="bottom">
   		<span class="heading"><?php echo $text_new_customer; ?></span>
       	<a href="<?php echo $register; ?>" class="button"><?php echo $text_register; ?></a>
      </div>
	</div>
	</div>
<?php } else { ?>
	<div class="login_drop_heading contrast_font">
  	<a class="log_link" href="<?php echo $logout_link; ?>"><i class="fa fa-user"></i> <?php echo $text_logout; ?></a>
    </div>
<?php } ?>
<?php } ?>