<?php if (!isset($redirect)) { ?>
<div class="checkout-product">
  <table class="list" style="margin-bottom:0">
    <thead class="contrast_font">
      <tr>
        <td class="name"><?php echo $column_name; ?></td>
        <td class="model mobile_hide"><?php echo $column_model; ?></td>
        <td class="quantity"><?php echo $column_quantity; ?></td>
        <td class="price mobile_hide"><?php echo $column_price; ?></td>
        <td class="total"><?php echo $column_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="name"><a class="contrast_font" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?>
          <?php if($product['recurring']) { ?>
          <br />
          <span class="label label-info"><?php echo $text_recurring; ?></span> <small><?php echo $product['recurring']; ?></small>
          <?php } ?></td>
        <td class="model mobile_hide"><?php echo $product['model']; ?></td>
        <td class="quantity"><?php echo $product['quantity']; ?></td>
        <td class="price mobile_hide"><?php echo $product['price']; ?></td>
        <td class="total"><?php echo $product['total']; ?></td>
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>        
        <td class="name"><?php echo $voucher['description']; ?></td>
        <td class="model mobile_hide"></td>
        <td class="quantity">1</td>
        <td class="price mobile_hide"><?php echo $voucher['amount']; ?></td>
        <td class="total"><?php echo $voucher['amount']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
    </table>
        <table class="quickcheckout-cart contrast_font" style="margin-top:-1px">
        <tbody>
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td colspan="4" class="price"><b><?php echo $total['title']; ?>:</b></td>
        <td class="total"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
</div>
<div class="payment"><?php echo $payment; ?></div>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>
<?php if ($auto_submit) { ?>
<script type="text/javascript"><!--
$('.payment form').submit();
$('.payment input[type=\'button\']').trigger('click');
$('.payment #button-confirm').trigger('click');
//--></script> 
<?php } ?>