<?php if($filter_groups || $categories || $options || $manufacturers || $attributes || $price_slider) { ?>
<div class="box filter_holder">
<div class="box-heading"><?php echo $heading_title; ?></div>

<div class="box" id="adv_ajaxfilter_box">

  
    <div class="bordered_content">
        
        <form id="adv_ajaxfilter">
            <div class="option_box" <?php if(!$instock_visible) echo 'style="display:none"'; ?>>
                <div class="option_name contrast_font"><?php echo $text_instock; ?></div>
                <div class="collapsible filters">
                    <input type="checkbox" class="filtered" name="instock" id="instock" <?php if($instock_checked) echo 'checked="checked"'; ?>><label for="instock"><?php echo $text_instock?></label>
                </div>
            </div>
            <div class="option_box" <?php if(!$price_slider) { echo 'style="display:none"';}?>>
                <div class="option_name contrast_font"><?php echo $text_price_range?></div>
                <div class="price_slider collapsible">
                <div class="price_range"><?php echo $text_range; ?>  
                <?php if($symbol_left){ echo $symbol_left; } ?><span id="min_p_holder"></span><?php if($symbol_right){ echo $symbol_right; } ?> - 
                <?php if($symbol_left){ echo $symbol_left; } ?><span id="max_p_holder"></span><?php if($symbol_right){ echo $symbol_right; } ?>
                </div>
                   
                    
                    <input type="hidden" id="min_price" type="text" value="-1" name="min_price" readonly="readonly" class="price_limit">
                    <input  type="hidden" id="max_price" type="text" value="-1" name="max_price" readonly="readonly" class="price_limit">
                    
                    <div id="slider-range"></div>
                </div>
            </div>
            <?php if($filter_groups) { ?>
                <?php if($display_filters == 'checkbox') { ?>
                    <?php foreach ($filter_groups as $filter_group) { ?>
                    <div class="option_box">
                        <div class="option_name contrast_font <?php if(empty($expanded_filters)){echo "hided";} ?>"><?php echo $filter_group['name']; ?></div>
                        <div class="collapsible filters" <?php if(empty($expanded_filters)){echo 'style="display:none"';}?>>
                              <?php foreach ($filter_group['filter'] as $filter) { ?>
                             
                                <input type="checkbox" class="filtered" name="filter[<?php echo $filter_group['filter_group_id']; ?>][]" value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>" />
                                <label for="filter<?php echo $filter['filter_id']; ?>"><?php echo $filter['name']; ?></label>
                              <?php } ?>
                            
                        </div>
                    </div>
                    <?php } ?>
                <?php } elseif($display_filters == 'radio') { ?>
                    <?php foreach ($filter_groups as $filter_group) { ?>
                    <div class="option_box">
                        <div class="option_name contrast_font <?php if(empty($expanded_filters)){echo "hided";} ?>"><?php echo $filter_group['name']; ?></div>
                        <div class="collapsible filters" <?php if(empty($expanded_filters)){echo 'style="display:none"';}?>>
                            
                              <?php foreach ($filter_group['filter'] as $filter) { ?>
                              
                                <input type="radio" class="filtered" name="filter[<?php echo $filter_group['filter_group_id']; ?>][]" value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>" />
                                <label for="filter<?php echo $filter['filter_id']; ?>"><?php echo $filter['name']; ?></label>
                              
                              
                              
                              <?php } ?>
                           
                        </div>
                    </div>
                    <?php } ?>
                <?php } elseif($display_filters == 'select') { ?>
                    <?php foreach ($filter_groups as $filter_group) { ?>
                    <div class="option_box">
                        <div class="option_name contrast_font <?php if(empty($expanded_filters)){echo "hided";} ?>"><?php echo $filter_group['name']; ?></div>
                        <div class="collapsible" <?php if(empty($expanded_filters)){echo 'style="display:none"';}?>>
                        <select id="filter_group_<?php echo $filter_group['filter_group_id']; ?>" name="filter[<?php echo $filter_group['filter_group_id']; ?>][]" class="filtered">
                            <option value=""><?php echo $text_all?></option>
                            <?php foreach ($filter_group['filter'] as $filter) { ?>
                                <option id="filter<?php echo $filter['filter_id']; ?>"  value="<?php echo $filter['filter_id']; ?>"><?php echo $filter['name']; ?></option>
                            <?php } ?>
                        </select>
                        </div>
                    </div>
                    <?php } ?>
                <?php } ?>
            <?php } ?>
            
            <?php if($manufacturers) { ?>
            <?php foreach($manufacturers as $manufacturer) { ?>
            <input type="hidden" class="m_name" id="m_<?php echo $manufacturer['manufacturer_id']?>" value="<?php echo $manufacturer['name']?>">
                <?php } ?>
            <?php } ?>

            <?php if($options) { ?>
            <?php foreach($options as $option) { ?>
                <?php foreach($option['option_values'] as $option_value) { ?>
                <input type="hidden" class="o_name" id="o_<?php echo $option_value['option_value_id']?>" value="<?php echo $option_value['name']?>">
                    <?php } ?>
                <?php } ?>
            <?php } ?>
            <?php if($category_id !== false) { ?>
                <input type="hidden" name="category_id" value="<?php echo $category_id ?>">
            <?php } ?>
            <?php if(isset($manufacturer_id)) { ?>
                <input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id ?>">
            <?php }?>
            <input type="hidden" name="page" id="adv_ajaxfilter_page" value="0">
            <input type="hidden" name="path" value="<?php echo $path ?>">
            <input type="hidden" name="sort" id="adv_ajaxfilter_sort" value="">
            <input type="hidden" name="order" id="adv_ajaxfilter_order" value="">
            <input type="hidden" name="limit" id="adv_ajaxfilter_limit" value="">
            <input type="hidden" name="old_route" value="<?php echo $old_route ?>">
            <input type="hidden" id="adv_ajaxfilter_container" value="<?php echo $adv_ajaxfilter_container?>">
            <input type="hidden" id="adv_ajaxfilter_url" value="<?php echo $url ?>">
            <input type="hidden" id="adv_ajaxfilter_route" value="<?php echo $route ?>">
            <input type="hidden" name="search" value="<?php echo $search ?>">
            <script type="text/javascript">
                function afterload(){
                    <?php echo $adv_ajaxfilter_afterload; ?>
                }
            </script>
            <?php if($categories) { ?>
            <div class="option_box">
                <div class="option_name contrast_font <?php if(empty($expanded_categories)){echo "hided";}?>"><?php echo $text_categories; ?></div>
                <div class="collapsible filters" <?php if(empty($expanded_categories)){echo 'style="display:none"';}?>>
                <?php if($display_categories == 'select') { ?>
                    <div>
                        <select name="categories[]" class="filtered">
                            <option value=""><?php echo $text_all?></option>
                            <?php foreach($categories as $category) { ?>
                            <option id="cat_<?php echo $category['category_id']; ?>" class="category_value"
                                    value="<?php echo $category['category_id']; ?>"><?php echo $category['name']?></option>
                            <?php } ?>
                        </select>
                    </div>
                <?php } elseif($display_categories == 'checkbox') { ?>
                        <div id="filter_categories">
                            <?php foreach($categories as $category) { ?>
                            
                                    
                                    <input id="cat_<?php echo $category['category_id']; ?>" class="filtered"
                                           type="checkbox" name="categories[]"
                                           value="<?php echo $category['category_id']; ?>">
                                    <label for="cat_<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></label>
                               
                            <?php } ?>
                        </div>
                    <?php } ?>
                </div>
            </div>
                <?php } ?>

                <?php if(isset($tags)) { ?>
            <div class="option_box">
                <div class="option_name contrast_font <?php if(empty($expanded_tags)){echo "hided";}?>"><?php echo $text_tags; ?></div>
                <div class="collapsible filters" <?php if(empty($expanded_tags)){echo 'style="display:none"';}?>>
                    <div id="filter_tags">
                        <?php foreach($tags as $tag) { ?>

                                
                                <input id="tag_<?php echo $tag['tag']; ?>" class="filtered"
                                       type="checkbox" name="tags[]"
                                       value="<?php echo $tag['tag']; ?>">
                                <label for="tag_<?php echo $tag['tag']; ?>"><?php echo $tag['name']; ?></label>
                        <?php } ?>
                    </div>
                </div>
            </div>
                <?php } ?>


                <?php if($manufacturers) { ?>
            <div class="option_box">
                <div class="option_name contrast_font <?php if(empty($expanded_manufacturer)){echo "hided";}?>"><?php echo $text_manufacturers; ?></div>
                <div class="collapsible filters" <?php if(empty($expanded_manufacturer)){echo 'style="display:none"';}?>>
                    <?php if($display_manufacturer == 'select') { ?>
                    <div>
                        <select name="manufacturer[]" class="filtered">
                            <option value=""><?php echo $text_all?></option>
                            <?php foreach($manufacturers as $manufacturer) { ?>
                            <option id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" class="manufacturer_value"
                                    value="<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <?php } elseif($display_manufacturer == 'checkbox') { ?>
                    
                        <?php foreach($manufacturers as $manufacturer) { ?>
                        
                        <input id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" class="manufacturer_value filtered" type="checkbox" name="manufacturer[]" value="<?php echo $manufacturer['manufacturer_id']?>">
                        <label for="manufacturer_<?php echo $manufacturer['manufacturer_id']?>"><span><?php echo $manufacturer['name']?></span></label>
                            
                        <?php } ?>
                    
                    <?php } elseif($display_manufacturer == 'radio') { ?>
                    
                        <?php foreach($manufacturers as $manufacturer) { ?>
                       
                                <input id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" class="manufacturer_value filtered"
                                       type="radio" name="manufacturer[]"
                                       value="<?php echo $manufacturer['manufacturer_id']?>">
                            
                                <label for="manufacturer_<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']?></label>
                           
                        <?php } ?>
                    
                    <?php } elseif($display_manufacturer == 'image') { ?>
                    <div class="filter_image_holder">
                        <?php foreach($manufacturers as $manufacturer) { ?>
                                <input style="display: none;" class="filtered manufacturer_value" id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" type="checkbox" name="manufacturer[]" value="<?php echo $manufacturer['manufacturer_id']?>">
                                <img src="<?php echo $manufacturer['image']?>" data-toggle="tooltip" title="<?php echo $manufacturer['name']?>" alt="<?php echo $manufacturer['name']?>"/>
                        <?php } ?>
                        </div>
                    <?php }?>
                </div>
            </div>
                <?php } ?>

                <?php if($attributes) { ?>
                <?php foreach($attributes as $attribute_group_id => $attribute) { ?>
                <?php if($attr_group) { ?>
                <div class="option_box">
                    <div class="attribute_group_name contrast_font"><?php echo $attribute['name']; ?></div>
                <?php } ?>

                    <?php foreach($attribute['attribute_values'] as $attribute_value_id => $attribute_value) { ?>
                    <div class="attribute_box <?php if($attr_group=="0") echo "option_box"; ?>">

                        <div class="option_name contrast_font <?php if(!$attribute_value['expanded']){echo "hided";}?>"><?php echo $attribute_value['name']; ?></div>
                        <div class="collapsible filters" <?php if(!$attribute_value['expanded']){echo 'style="display:none"';}?>>
                            <?php if($attribute_value['display'] == 'select') { ?>
                            <div>
                                <select class="filtered" name="attribute_value[<?php echo $attribute_value_id?>][]">
                                    <option value=""><?php echo $text_all?></option>
                                    <?php foreach($attribute_value['values'] as $i => $value) { ?>
                                    <option class="a_name"
                                            at_v_i="<?php echo $attribute_value_id . '_' . $value ?>"
                                            at_v_t="<?php echo $attribute_value_id . '_' . htmlspecialchars(preg_replace('/\s+|\n|\r|\s+$/m', '_', $value)) ?>"
                                            data-value="<?php echo $value ?>"
                                            value="<?php echo $value ?>"><?php echo $value ?></option>
                                    <?php }?>
                                </select>
                            </div>
                            <?php } elseif($attribute_value['display'] == 'checkbox') { ?>
                            
                                <?php foreach($attribute_value['values'] as $i => $value) { ?>
                                
                                        <input class="filtered a_name"
                                               id="attribute_value_<?php echo $attribute_value_id . $i; ?>"
                                               type="checkbox" name="attribute_value[<?php echo $attribute_value_id?>][]"
                                               at_v_i="<?php echo $attribute_value_id . '_' . $value; ?>"
                                               value="<?php echo $value ?>">
                                    
                                        <label for="attribute_value_<?php echo $attribute_value_id . $i; ?>"
                                               at_v_t="<?php echo $attribute_value_id . '_' . htmlspecialchars(preg_replace('/\s+|\n|\r|\s+$/m', '_', $value)); ?>"
                                               data-value="<?php echo $value; ?>"
                                               value="<?php echo $value ?>"><?php echo $value?></label>
                                   
                                <?php } ?>
                            
                            <?php } elseif($attribute_value['display'] == 'radio') { ?>
                            
                                <?php foreach($attribute_value['values'] as $i => $value) { ?>
                                
                                        <input class="filtered a_name"
                                               id="attribute_value_<?php echo $attribute_value_id . $i; ?>"
                                               type="radio" name="attribute_value[<?php echo $attribute_value_id?>][]"
                                               at_v_i="<?php echo $attribute_value_id . '_' . $value ?>"
                                               value="<?php echo $value ?>">
                                    
                                        <label for="attribute_value_<?php echo $attribute_value_id . $i; ?>"
                                               at_v_t="<?php echo $attribute_value_id . '_' . htmlspecialchars(preg_replace('/\s+|\n|\r|\s+$/m', '_', $value)) ?>"
                                               data-value="<?php echo $value ?>"
                                               value="<?php echo $value ?>"><?php echo $value?></label>
                                   
                                <?php } ?>
                            
                            <?php } elseif($attribute_value['display'] == 'slider') { ?>
                            <table style="width:100%">
                                <tr>
                                    <td style="width: 50%"><span id="attribute_label_<?php echo $attribute_value_id; ?>_min"><?php echo $attribute_value['values'][0].' '.$attribute_value['suffix']; ?> </span>
                                        <input type="hidden" id="attribute_value_<?php echo $attribute_value_id; ?>_min" name="attr_slider[<?php echo $attribute_value_id?>][min]" value="">
                                    </td>
                                    <td style="text-align: right;"><span id="attribute_label_<?php echo $attribute_value_id; ?>_max"><?php echo $attribute_value['values'][count($attribute_value['values'])-1].' '.$attribute_value['suffix']; ?></span>
                                        <input type="hidden" id="attribute_value_<?php echo $attribute_value_id; ?>_max" name="attr_slider[<?php echo $attribute_value_id?>][max]" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div id="slider-range-<?php echo $attribute_value_id; ?>" style="margin-left: 9px;margin-right: 8px;"></div>
                                    </td>
                                </tr>
                            </table>
                            <script>
                                var attr_arr_<?php echo $attribute_value_id; ?> = [<?php echo implode(',', $attribute_value['values']); ?>];
                                $('#slider-range-<?php echo $attribute_value_id; ?>').slider({
                                    range:true,
                                    min:0,
                                    max:<?php echo count($attribute_value['values'])-1 ; ?>,
                                    values:[0, <?php echo count($attribute_value['values'])-1 ; ?>],
                                    slide:function (a, b) {
                                        var min = attr_arr_<?php echo $attribute_value_id; ?>[b.values[0]];
                                        var max = attr_arr_<?php echo $attribute_value_id; ?>[b.values[1]];
                                        $("#attribute_label_<?php echo $attribute_value_id; ?>_min").html(min ? (min + '<?php echo $attribute_value['suffix']; ?>') : '0');
                                        $("#attribute_label_<?php echo $attribute_value_id; ?>_max").html(max?(max + '<?php echo $attribute_value['suffix']; ?>'):'&infin;');
                                    },
                                    stop:function (a, b) {
                                        var min = attr_arr_<?php echo $attribute_value_id; ?>[b.values[0]];
                                        var max = attr_arr_<?php echo $attribute_value_id; ?>[b.values[1]];
                                        $("#attribute_value_<?php echo $attribute_value_id; ?>_min").val(min);
                                        $("#attribute_value_<?php echo $attribute_value_id; ?>_max").val(max);
                                        delayedFilter()
                                    }
                                });
                            </script>
                            </table>
                            <?php } ?>
                        </div>
                    </div>
                    <?php } ?>
                    <?php if($attr_group) { ?>
                </div>
                    <?php } ?>
                    <?php } ?>
                <?php } ?>

                <?php if($options) { ?>
                <?php foreach($options as $option) { ?>
                <div class="option_box">
                    <div class="option_name contrast_font <?php if(!$option['expanded']){echo "hided";}?>"><?php echo $option['name']; ?></div>
                    <?php if($option['display'] == 'select') { ?>
                    <div class="collapsible" <?php if(!$option['expanded']){echo 'style="display:none"';}?>>
                        <select class="filtered" name="option_value[<?php echo $option['option_id']?>][]">
                            <option value=""><?php echo $text_all?></option>
                            <?php foreach($option['option_values'] as $option_value) { ?>
                            <option class="option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
                                    value="<?php echo $option_value['option_value_id'] ?>"><?php echo $option_value['name']?></option>
                            <?php }?>
                        </select>
                    </div>
                    <?php } elseif($option['display'] == 'checkbox') { ?>
                    <div class="collapsible filters" <?php if(!$option['expanded']){echo 'style="display:none"';}?>>
                        <?php foreach($option['option_values'] as $option_value) { ?>
                       
                                <input class="filtered option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
                                       type="checkbox" name="option_value[<?php echo $option['option_id']?>][]"
                                       value="<?php echo $option_value['option_value_id']?>">
                           
                                <label for="option_value_<?php echo $option_value['option_value_id']?>"><?php echo $option_value['name']?></label>
                           
                        <?php } ?>
                    </div>
                    <?php } elseif($option['display'] == 'radio') { ?>
                    <div class="collapsible filters" <?php if(!$option['expanded']){echo 'style="display:none"';}?>>
                        <?php foreach($option['option_values'] as $option_value) { ?>
                        
                                <input class="filtered option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
                                       type="radio" name="option_value[<?php echo $option['option_id']?>][]"
                                       value="<?php echo $option_value['option_value_id']?>">
                            
                                <label for="option_value_<?php echo $option_value['option_value_id']?>"><?php echo $option_value['name']?></label>
                            
                        <?php } ?>
                    </div>
                    <?php } elseif($option['display'] == 'image') { ?>
                    <div class="collapsible" <?php if(!$option['expanded']) { echo 'style="display:none"'; }?>>
                    <div class="filter_image_holder">
                        <?php foreach($option['option_values'] as $option_value) { ?>
						
                                <input style="display: none;" class="filtered option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
                                       type="checkbox" name="option_value[<?php echo $option['option_id']?>][]"
                                       value="<?php echo $option_value['option_value_id']?>">
                                <img src="<?php echo $option_value['thumb'];?>" data-toggle="tooltip" title="<?php echo $option_value['name'];?>" alt="<?php echo $option_value['name'];?>"/>

                        <?php } ?>
                        </div>
                    </div>
                    <?php }?>
                </div>
                <?php } ?>
            <?php } ?>
        </form>
        <div class="clear_filter">
            <a class="button remove"><i class="fa fa-refresh"></i> <?php echo $clear_filter?></a>
        </div>
    </div>
</div>
</div>
<?php } ?>