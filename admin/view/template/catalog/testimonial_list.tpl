<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
      <a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-testimonial').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
      
      
 <h3><?php echo $text_settings; ?></h3>
 	
    <div class="well">
    <form  method="post" enctype="multipart/form-data" id="form-settings">

    <div class="row">        
          
    <div class="col-sm-12">
    <div class="form-group"> 
	 <?php if (isset($testimonial_send_to_admin)) { ?>
	 <input type="checkbox" name="testimonial_send_to_admin" value="0" checked="checked" />
	 <?php } else { ?>
	 <input type="checkbox" name="testimonial_send_to_admin" value="0" />
	 <?php } ?> <?php echo $entry_send_to_admin; ?>
     </div>
     </div>
     
     <div class="col-sm-12">
    <div class="form-group"> 
	<?php if (isset($testimonial_admin_approved)) { ?>
	<input type="checkbox" name="testimonial_admin_approved" value="0" checked="checked" />
	<?php } else { ?>
	<input type="checkbox" name="testimonial_admin_approved" value="0" />
	<?php } ?><?php echo $entry_admin_approved; ?>
     </div>
     </div>  
     
     <div class="col-sm-12">
    <div class="form-group"> 
	<?php if (!isset($testimonial_default_rating)) $testimonial_default_rating = '3'; ?>
	     <?php echo $entry_default_rating; ?></td>
			<span><?php echo $entry_bad; ?></span>&nbsp;
        		<input type="radio" name="testimonial_default_rating" value="1" style="margin: 0;" <?php if ( $testimonial_default_rating == 1 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="testimonial_default_rating" value="2" style="margin: 0;" <?php if ( $testimonial_default_rating == 2 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="testimonial_default_rating" value="3" style="margin: 0;" <?php if ( $testimonial_default_rating == 3 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="testimonial_default_rating" value="4" style="margin: 0;" <?php if ( $testimonial_default_rating == 4 ) echo 'checked="checked"';?> />
        		&nbsp;
        		<input type="radio" name="testimonial_default_rating" value="5" style="margin: 0;" <?php if ( $testimonial_default_rating == 5 ) echo 'checked="checked"';?> />
        		&nbsp; <span><?php echo $entry_good; ?></span>
     </div>
     </div>    
    
     <div class="col-sm-12">
<button type="submit" form="form-settings" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp; Save Settings</button>
     </div>

    </div>
    </form>
    </div>
      
    <h3><?php echo $text_list; ?></h3>
 	<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-testimonial"> 
      <div class="table-responsive">
            <table class="table table-hover">
        <thead>
          <tr>
            <td width="1" style="align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>

            <td class="left"><?php if ($sort == 'td.description') { ?>
              <a href="<?php echo $sort_description; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_description; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_description; ?>"><?php echo $column_description; ?></a>
              <?php } ?></td>


            <td><?php if ($sort == 'td.title') { ?>
              <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
              <?php } ?></td>
            <td><?php if ($sort == 't.name') { ?>
              <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
              <?php } ?></td>
            <td class="text-right"><?php if ($sort == 't.date_added') { ?>
              <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
              <?php } ?></td>
            <td class="text-right"><?php if ($sort == 't.status') { ?>
              <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
              <?php } ?></td>
            <td class="text-right"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($testimonials) { ?>
          <?php foreach ($testimonials as $testimonial) { ?>
          <tr>
            <td style="align: center;"><?php if ($testimonial['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $testimonial['testimonial_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $testimonial['testimonial_id']; ?>" />
              <?php } ?></td>
            <td><?php echo $testimonial['description']; ?></td>
            <td><?php echo $testimonial['title']; ?></td>
            <td><?php echo $testimonial['name']; ?></td>
            <td class="text-right"><?php echo $testimonial['date_added']; ?></td>
            <td class="text-right"><?php echo $testimonial['status']; ?></td>
            <td class="text-right"><?php foreach ($testimonial['action'] as $action) { ?>
              <a href="<?php echo $action['href']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
              <?php } ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      </div>
    </form>
    <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>

