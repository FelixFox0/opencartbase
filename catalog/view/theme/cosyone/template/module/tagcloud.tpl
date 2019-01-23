<?php
//-----------------------------------------------------
// TagCloud for Opencart v1.5.6    						
// Adapted by villagedefrance                          		
// contact@villagedefrance.net                       		
//-----------------------------------------------------
?>


	<div class="box">
		<?php if($title) { ?>
        <div class="box-heading"><?php echo $title; ?></div>	
		<?php } ?>
				
				
			
		
		<div class="box-content tags contrast_font"> 
		<?php if($tagcloud) { ?>
        <div class="icons_wrapper">
			<?php echo $tagcloud; ?>
            </div>
		<?php } else { ?>
			<?php echo $text_notags; ?>
		<?php } ?>
		</div>
	</div>

