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
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($returns) { ?>
      <?php foreach ($returns as $return) { ?>
      <table class="compare-info">
    <tbody>
       <tr>
       <td class="contrast_font history"><?php echo $column_return_id; ?></td>
       <td class="contrast_font">#<?php echo $return['return_id']; ?></td>
      </tr>
      <tr>
       <td class="contrast_font history"><?php echo $column_status; ?></td>
       <td class="contrast_font"><?php echo $return['status']; ?></td>
      </tr>
      <tr>
       <td class="contrast_font history"><?php echo $column_date_added; ?></td>
       <td class="contrast_font"><?php echo $return['date_added']; ?></td>
      </tr>
      <tr>
       <td class="contrast_font history"><?php echo $column_order_id; ?></td>
       <td class="contrast_font"><?php echo $return['order_id']; ?></td>
      </tr>
      <tr>
       <td class="contrast_font history"><?php echo $column_customer; ?></td>
       <td class="contrast_font"><?php echo $return['name']; ?></td>
      </tr>
      <tr>
       <td colspan="2" class="white_back">
       <a class="button contrast" href="<?php echo $return['href']; ?>"><?php echo $button_view; ?></a>
		</td>
      </tr>
    </tbody>
   </table>
    <?php } ?>
      <div class="text-right"><?php echo $pagination; ?></div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>