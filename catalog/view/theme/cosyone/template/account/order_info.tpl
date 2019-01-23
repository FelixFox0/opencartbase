<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
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
      <h1><?php echo $heading_title; ?></h1>
      
      <table class="list">
        <thead>
          <tr>
            <td class="contrast_font" colspan="2"><?php echo $text_order_detail; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>              
          <td class="left" style="width: 50%;"><?php if ($invoice_no) { ?>
          <?php echo $text_invoice_no; ?> <?php echo $invoice_no; ?><br />
          <?php } ?>
          <?php echo $text_order_id; ?> #<?php echo $order_id; ?><br />
          <?php echo $text_date_added; ?> <?php echo $date_added; ?></td>
        <td class="left" style="width: 50%;"><?php if ($payment_method) { ?>
          <?php echo $text_payment_method; ?> <?php echo $payment_method; ?><br />
          <?php } ?>
          <?php if ($shipping_method) { ?>
          <?php echo $text_shipping_method; ?> <?php echo $shipping_method; ?>
          <?php } ?></td>
          </tr>
        </tbody>
      </table>
      
      <table class="list">
    <thead>
      <tr>
        <td class="left contrast_font"><?php echo $text_payment_address; ?></td>
        <?php if ($shipping_address) { ?>
        <td class="left contrast_font"><?php echo $text_shipping_address; ?></td>
        <?php } ?>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="left"><?php echo $payment_address; ?></td>
        <?php if ($shipping_address) { ?>
        <td class="left"><?php echo $shipping_address; ?></td>
        <?php } ?>
      </tr>
    </tbody>
  </table>
      
      
      <table class="list">
    <thead>
      <tr>
        <td class="left contrast_font"><?php echo $column_name; ?></td>
        <td class="left contrast_font"><?php echo $column_model; ?></td>
        <td class="right contrast_font"><?php echo $column_quantity; ?></td>
        <td class="right contrast_font"><?php echo $column_price; ?></td>
        <td class="right contrast_font"><?php echo $column_total; ?></td>
        
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
     
       
          <td><?php echo $product['name']; ?>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?>
          <br />
		<a class="return_link" href="<?php echo $product['return']; ?>"><i class="fa fa-reply"></i> <?php echo $button_return; ?></a>&nbsp;&nbsp;
        <a class="return_link" href="<?php echo $product['reorder']; ?>"><i class="fa fa-shopping-cart"></i> <?php echo $button_reorder; ?></a>
        </td>
        <td class="left"><?php echo $product['model']; ?></td>
        <td class="right"><?php echo $product['quantity']; ?></td>
        <td class="right"><?php echo $product['price']; ?></td>
        <td class="right"><?php echo $product['total']; ?></td>
        
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td class="left"><?php echo $voucher['description']; ?></td>
        <td class="left"></td>
        <td class="right">1</td>
        <td class="right"><?php echo $voucher['amount']; ?></td>
        <td class="right"><?php echo $voucher['amount']; ?></td>
        
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td colspan="3"></td>
        <td class="right"><?php echo $total['title']; ?>:</td>
        <td class="right"><?php echo $total['text']; ?></td>
       
      </tr>
      <?php } ?>
    </tfoot>
  </table>

      <?php if ($comment) { ?>
      <table class="list">
    <thead>
      <tr>
        <td class="left contrast_font"><?php echo $text_comment; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="left"><?php echo $comment; ?></td>
      </tr>
    </tbody>
  </table>
      <?php } ?>
      
      <?php if ($histories) { ?>
      <h3><?php echo $text_history; ?></h3>
      
      <table class="list">
    <thead>
      <tr>
        <td class="left contrast_font"><?php echo $column_date_added; ?></td>
        <td class="left contrast_font"><?php echo $column_status; ?></td>
        <td class="left contrast_font"><?php echo $column_comment; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($histories as $history) { ?>
      <tr>
        <td class="left"><?php echo $history['date_added']; ?></td>
        <td class="left"><?php echo $history['status']; ?></td>
        <td class="left"><?php echo $history['comment']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
  
  
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>