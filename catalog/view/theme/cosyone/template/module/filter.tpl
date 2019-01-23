<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  
  <div class="box-content box-category">
    <?php foreach ($filter_groups as $filter_group) { ?>
    <div class="filter_group">
    <span class="contrast_font"><?php echo $filter_group['name']; ?></span>
      <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
        <?php foreach ($filter_group['filter'] as $filter) { ?>
        <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
        <label class="checkbox">
          <input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
          <?php echo $filter['name']; ?></label>
        <?php } else { ?>
        <label class="checkbox">
          <input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" />
          <?php echo $filter['name']; ?></label>
        <?php } ?>
        <?php } ?>
      </div>
      </div>
    <?php } ?>
</div>
  
    <button type="button" id="button-filter" class="btn btn-primary"><?php echo $button_filter; ?></button>
  
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	filter = [];
	
	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});
	
	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script> 
