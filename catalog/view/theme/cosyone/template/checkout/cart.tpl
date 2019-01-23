<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
      </h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="basket">
        <div class="cart-info-wrapper">
    	<div class="cart-info">
          <table class="contrast_font">
            <thead>
              <tr>
            <td class="image mobile_hide"><?php echo $column_image; ?></td>
            <td class="name"><?php echo $column_name; ?></td>
            <td class="model mobile_hide"><?php echo $column_model; ?></td>
            <td class="price mobile_hide"><?php echo $column_price; ?></td>
            <td class="quantity"><?php echo $column_quantity; ?></td>
            <td class="total mobile_hide"><?php echo $column_total; ?></td>
            <td class="remove mobile_hide"></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="image mobile_hide"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                  <?php } ?></td>
                <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <small><?php echo $text_recurring_item; ?>: <?php echo $product['recurring']; ?></small>
                  <?php } ?>
                  <div class="up_to_mobile">
              <small><?php echo $column_price; ?>: <?php echo $product['price']; ?></small>
              <small><?php echo $column_total; ?>: <?php echo $product['total']; ?></small>
              <small><a class="remove_link" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>">[<?php echo $button_remove; ?>]</a></small>
              </div></td>
                <td class="model mobile_hide"><?php echo $product['model']; ?></td>
                <td class="unit_price mobile_hide"><?php echo $product['price']; ?></td>
                <td class="quantity">
            <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
             <a onclick="$('#basket').submit();" data-tooltip="<?php echo $button_update; ?>" class="sq_icon"><i class="fa fa-refresh"></i></a>
             </td>
                <td class="price total mobile_hide"><?php echo $product['total']; ?></td>
                <td class="remove mobile_hide">
                <a onclick="cart.remove('<?php echo $product['cart_id']; ?>');" data-tooltip="<?php echo $button_remove; ?>" class="sq_icon"><i class="fa fa-times"></i></a>
                </td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $vouchers) { ?>
              <tr>
            <td class="image mobile_hide"></td>
            <td class="name"><?php echo $vouchers['description']; ?>
            <small><a class="remove_link up_to_mobile" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');" title="<?php echo $button_remove; ?>">[<?php echo $button_remove; ?>]</a></small>
            </td>
            <td class="model mobile_hide"></td>
            <td class="unit_price mobile_hide"><?php echo $vouchers['amount']; ?></td>
            <td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled" /></td>
            <td class="price total mobile_hide"><?php echo $vouchers['amount']; ?></td>
             <td class="remove mobile_hide">
             <a onclick="voucher.remove('<?php echo $vouchers['key']; ?>');" data-tooltip="<?php echo $button_remove; ?>" class="sq_icon"><i class="fa fa-times"></i></a>
             </td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
          <div class="cart_bottom_line"><a href="<?php echo $continue; ?>" class="button contrast"><?php echo $button_shopping; ?></a></div>
          </div>
        </div>
      </form>
      
      <div class="row">
      
      <div class="col-sm-8">
      <?php if ($modules) { ?>
      <div class="row">
      <?php foreach ($modules as $module) { ?>
        <?php echo $module; ?>
        <?php } ?>
      </div>
      <?php } ?>
      </div>
      
      <div class="col-sm-4">
      <div class="cart-total">
       <table id="total" class="contrast_font">
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td class="right"><?php echo $total['title']; ?></td>
        <td class="right amounts"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </table>
    <div class="cart-total-bottom">
    <a href="<?php echo $checkout; ?>" class="button active checkout"><?php echo $button_checkout; ?></a>
    </div>
       </div>
      </div>
      
      </div>
      
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 