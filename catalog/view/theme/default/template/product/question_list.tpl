<?php if ($questions) { ?>
<?php foreach ($questions as $question) { ?>
<div class="well question">
<p style="margin-bottom:5px"><b class="contrast_font"><?php echo $text_question_from; ?> <?php echo $question['author']; ?></b> - <span style="color:#999999"><?php echo $question['date_added']; ?></span></p>
<p style="margin-bottom:20px">- <?php echo $question['text']; ?></p>
<?php if ($question['answer']) { ?>
<p style="margin-bottom:5px"><b class="contrast_font"><?php echo $text_our_answer; ?></b></p>
<p><?php echo $question['answer']; ?></p>
<?php } else { ?>
<p><i><?php echo $text_no_answer; ?></i></p>
<?php } ?>
</div>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_questions; ?></p>
<?php } ?>