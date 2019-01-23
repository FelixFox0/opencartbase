 <div class="deals_heading heading welcome"><?php echo $heading_title; ?></div>
  <div class="deals_wrapper">
      <?php foreach ($products as $product) { ?> 
      <div class="deals">
     <div class="deals_content">
        <?php if ($product['thumb']) { ?>
        <div class="image" style="width:<?php echo $images_width; ?>px;"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="info">
        <div class="name contrast_font"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['rating']) { ?>
        <span class="rating r<?php echo $product['rating']; ?>">
        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
        <?php } ?>
        <div class="description">
        <?php echo $product['description']; ?>
        </div>
        <?php if ($product['price']) { ?>
        <div class="extended_offer">
        <?php if ($product['special']) { ?>
        <div class="price-new"><?php echo $text_special_price; ?><span class="amount contrast_font"><?php echo $product['special']; ?></span></div>
        <div class="price-old"><?php echo $text_old_price; ?><span class="amount contrast_font"><?php echo $product['price']; ?></span></div>
        <div class="price-save"><?php echo $text_you_save; ?><span class="amount contrast_font"><?php echo $product['yousave']; ?></span> </div>
        <?php } else { ?>
        <div class="price-regular"><span class="amount price"><?php echo $product['price']; ?></span></div>
        <?php } ?>
        </div>        
        <?php if (($product['special_date_end'] > 0) && ($cosyone_product_countdown)) { ?>
        <div class="contrast_font"><div class="offer <?php echo $product['product_id']; ?>"></div></div> 
        <script type="text/javascript">
		$('.offer.<?php echo $product['product_id']; ?>').countdown({
		until: <?php echo $product['special_date_end']; ?>, 
		layout: '<span class="main_font"><?php echo $text_expire; ?></span> <i>{dn}</i> {dl}&nbsp; <i>{hn}</i>  {hl}&nbsp; <i>{mn}</i>  {ml}&nbsp; <i>{sn}</i> {sl}'});
		</script>
		
        <?php if ($cosyone_product_hurry) { ?>
        <div class="hurry">
        <span class="items_left contrast_color"><?php echo $product['stock_quantity']; ?></span>
        <span class="items_sold"><?php echo $product['items_sold']; ?></span>
        </div>
        <?php } ?>
        
        <?php } ?>
        <?php } ?> <!-- if price ends -->
        <div class="cart">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="button contrast"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
         <div class="icons_wrapper">
    <a class="sq_icon" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a>
    <a class="sq_icon compare" onclick="compare.add('<?php echo $product['product_id']; ?>');" data-tooltip="<?php echo $button_compare; ?>"><i class="fa fa-arrow-right"></i><i class="fa fa-arrow-left"></i></a>
        </div>
        </div>
        </div>
      </div>  
      </div>
<?php } ?>

</div>

<script type="text/javascript">
$(document).ready(function() {
$('.deals_wrapper').owlCarousel({
singleItem : true,
mouseDrag:false,
autoPlay:<?php echo $autoplay; ?>,
stopOnHover:true,
autoHeight:true,
transitionStyle:"backSlide"
});
});
</script> 