<?php if (!isset($redirect)) { ?>
<div class="cart-info-wrapper">
  <div class="cart-info confirm">
  <table class="contrast_font">
    <thead>
      <tr>       
        <td class="name"><?php echo $column_name; ?></td>
        <td class="model mobile_remove"><?php echo $column_model; ?></td>
        <td class="price mobile_remove"><?php echo $column_price; ?></td>
        <td class="quantity"><?php echo $column_quantity; ?></td>
        <td class="total"><?php echo $column_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php foreach ($product['option'] as $option) { ?>

          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?>
          <?php if($product['recurring']) { ?>
          <small><?php echo $text_recurring_item; ?>: <?php echo $product['recurring']; ?></small>
          <?php } ?></td>
        
        <td class="model mobile_remove"><?php echo $product['model']; ?></td>
        <td class="price mobile_remove"><?php echo $product['price']; ?></td>
        <td class="quantity"><?php echo $product['quantity']; ?></td>
        <td class="total"><?php echo $product['total']; ?></td>
        
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>       
        <td class="name"><?php echo $voucher['description']; ?></td>
        <td class="model mobile_remove"></td>
        <td class="price mobile_remove"><?php echo $voucher['amount']; ?></td>
        <td class="quantity">1</td>
        <td class="total"><?php echo $voucher['amount']; ?></td>
        
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>

      
      <tr class="confirm_totals">
        <td colspan="4" class="price"><b><?php echo $total['title']; ?>:</b></td>
        <td class="total"><?php echo $total['text']; ?></td>
      </tr>
      
      <?php } ?>
    </tfoot>
  </table>
  <div class="cart_bottom_line">
<div class="payment"><?php echo $payment; ?></div>
</div>
  </div>
</div>




<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>
