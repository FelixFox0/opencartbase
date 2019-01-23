<div class="box">
<?php if ($module_title){ ?>
<div class="box-heading"><?php echo $module_title; ?></div>
<?php } ?>
<div class="box-content">

<div class="tweet-feed-widget">
<div class="tweetfeed-list-container-wrapper">
<div class="tweetfeed-list-container">
<div class="tweetfeed-item-content-container tweetfeed-unbound">
<div class="tweetfeed-date-container">
</div></div></div></div></div>
</div></div>

<script>
$(document).ready(function() {
$(".tweetfeed-list-container").tweecool({
//settings
username : '<?php echo $widget_id; ?>',
limit : <?php echo $limit; ?>
});
});
</script>