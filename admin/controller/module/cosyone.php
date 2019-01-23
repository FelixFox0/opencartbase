<?php
class ControllerModuleCosyone extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/cosyone');
		$this->load->model('localisation/language');
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('cosyone', $this->request->post);	
			
			if (isset($this->request->post['save']) && $this->request->post['save'] == 'stay') {
				$this->session->data['success'] = $this->language->get('text_success');
				$this->response->redirect($this->url->link('module/cosyone', 'token=' . $this->session->data['token'], true)); 
			}
				
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		
		// Language starts
		$data['heading_title'] = $this->language->get('heading_title');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_save_stay'] = $this->language->get('button_save_stay');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		// Tabs
		$data['text_tab_general'] = $this->language->get('text_tab_general');
		$data['text_tab_design'] = $this->language->get('text_tab_design');
		$data['text_tab_custom_css'] = $this->language->get('text_tab_custom_css');
		
		// General settings
		$data['text_heading_google_fonts'] = $this->language->get('text_heading_google_fonts');
		$data['text_use_google_fonts'] = $this->language->get('text_use_google_fonts');
		$data['text_google_font_family'] = $this->language->get('text_google_font_family');
		$data['text_google_font_weight'] = $this->language->get('text_google_font_weight');
		$data['text_google_font_latin_extended'] = $this->language->get('text_google_font_latin_extended');

		$data['text_heading_layout'] = $this->language->get('text_heading_layout');
		$data['text_max_width'] = $this->language->get('text_max_width');
		$data['text_use_responsive_layout'] = $this->language->get('text_use_responsive_layout');
		$data['text_custom_top_promo_message'] = $this->language->get('text_custom_top_promo_message');
		$data['text_custom_top_promo_message_help'] = $this->language->get('text_custom_top_promo_message_help');
		
		$data['text_heading_main_menu_general'] = $this->language->get('text_heading_main_menu_general');
		$data['text_heading_mega_menu_settings'] = $this->language->get('text_heading_mega_menu_settings');

		$data['text_use_home_icon'] = $this->language->get('text_use_home_icon');

		$data['text_menu_mega_second_thumb'] = $this->language->get('text_menu_mega_second_thumb');
		$data['text_menu_mega_second_thumb_help'] = $this->language->get('text_menu_mega_second_thumb_help');
		
		$data['text_menu_mega_second_image_w'] = $this->language->get('text_menu_mega_second_image_w');
		$data['text_menu_mega_second_image_h'] = $this->language->get('text_menu_mega_second_image_h');
		$data['text_menu_mega_show_thumb'] = $this->language->get('text_menu_mega_show_thumb');
		$data['text_menu_mega_show_thumb_help'] = $this->language->get('text_menu_mega_show_thumb_help');
		$data['text_use_custom_menu_link1'] = $this->language->get('text_use_custom_menu_link1');
		$data['text_use_custom_menu_title1'] = $this->language->get('text_use_custom_menu_title1');
		$data['text_use_custom_menu_url1'] = $this->language->get('text_use_custom_menu_url1');
		$data['text_use_custom_menu_link2'] = $this->language->get('text_use_custom_menu_link2');
		$data['text_use_custom_menu_title2'] = $this->language->get('text_use_custom_menu_title2');
		$data['text_use_custom_menu_url2'] = $this->language->get('text_use_custom_menu_url2');
		$data['text_use_custom_menu_link3'] = $this->language->get('text_use_custom_menu_link3');
		$data['text_use_custom_menu_title3'] = $this->language->get('text_use_custom_menu_title3');
		$data['text_use_custom_menu_url3'] = $this->language->get('text_use_custom_menu_url3');
		$data['text_use_custom_menu_link4'] = $this->language->get('text_use_custom_menu_link4');
		$data['text_use_custom_menu_title4'] = $this->language->get('text_use_custom_menu_title4');
		$data['text_use_custom_menu_url4'] = $this->language->get('text_use_custom_menu_url4');
		$data['text_use_custom_menu_link5'] = $this->language->get('text_use_custom_menu_link5');
		$data['text_use_custom_menu_title5'] = $this->language->get('text_use_custom_menu_title5');
		$data['text_use_custom_menu_url5'] = $this->language->get('text_use_custom_menu_url5');                
                $data['text_use_custom_menu_link6'] = $this->language->get('text_use_custom_menu_link6');
		$data['text_use_custom_menu_title6'] = $this->language->get('text_use_custom_menu_title6');
		$data['text_use_custom_menu_url6'] = $this->language->get('text_use_custom_menu_url6');
		$data['text_use_custom_menu_block'] = $this->language->get('text_use_custom_menu_block');
		$data['text_use_custom_menu_block_title'] = $this->language->get('text_use_custom_menu_block_title');
		$data['text_menu_custom_block_content'] = $this->language->get('text_menu_custom_block_content');
		$data['text_menu_custom_block_content_help'] = $this->language->get('text_menu_custom_block_content_help');
		$data['text_heading_product_page'] = $this->language->get('text_heading_product_page');
		$data['text_heading_product_listings'] = $this->language->get('text_heading_product_listings');
		$data['text_grid_home'] = $this->language->get('text_grid_home');
		$data['text_grid_category'] = $this->language->get('text_grid_category');
		$data['text_grid_related'] = $this->language->get('text_grid_related');
		$data['text_default_product_listing'] = $this->language->get('text_default_product_listing');
		$data['text_percentage_sale_badge'] = $this->language->get('text_percentage_sale_badge');
		$data['text_rollover_effect'] = $this->language->get('text_rollover_effect');
		
		$data['text_heading_footer_social'] = $this->language->get('text_heading_footer_social');
		
		
		$data['text_upload_payment_icon'] = $this->language->get('text_upload_payment_icon');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');
		
		// Design settings
		$data['text_use_custom_design'] = $this->language->get('text_use_custom_design');
		$data['text_reset_design'] = $this->language->get('text_reset_design');
		$data['text_reset_design_info'] = $this->language->get('text_reset_design_info');
		$data['text_heading_header'] = $this->language->get('text_heading_header');
		$data['text_header_background'] = $this->language->get('text_header_background');

		$data['text_top_border_background'] = $this->language->get('text_top_border_background');
		$data['text_top_border_opacity'] = $this->language->get('text_top_border_opacity');
		$data['text_top_border_text'] = $this->language->get('text_top_border_text');
		$data['text_top_border_text_hover'] = $this->language->get('text_top_border_text_hover');
		$data['text_lang_curr_style'] = $this->language->get('text_lang_curr_style');
		$data['text_header_text_color'] = $this->language->get('text_header_text_color');
		$data['text_heading_design_usermenu'] = $this->language->get('text_heading_design_usermenu');
		$data['text_user_menu_background'] = $this->language->get('text_user_menu_background');
		$data['text_user_menu_background_opacity'] = $this->language->get('text_user_menu_background_opacity');
		$data['text_user_menu_background_opacity_hover'] = $this->language->get('text_user_menu_background_opacity_hover');
		$data['text_opacity_help'] = $this->language->get('text_opacity_help');
		
		$data['text_heading_search_field'] = $this->language->get('text_heading_search_field');
		$data['text_search_field_text_color'] = $this->language->get('text_search_field_text_color');
		$data['text_search_field_background'] = $this->language->get('text_search_field_background');
		$data['text_search_field_background_hover'] = $this->language->get('text_search_field_background_hover');
		$data['text_search_field_icons'] = $this->language->get('text_search_field_icons');
		
		$data['text_user_menu_icon'] = $this->language->get('text_user_menu_icon');
		$data['text_user_menu_link'] = $this->language->get('text_user_menu_link');
		$data['text_user_menu_link_hover'] = $this->language->get('text_user_menu_link_hover');
		$data['text_heading_design_main_menu'] = $this->language->get('text_heading_design_main_menu');
		$data['text_main_menu_background'] = $this->language->get('text_main_menu_background');
		$data['text_main_menu_pattern1'] = $this->language->get('text_main_menu_pattern1');
		$data['text_main_menu_pattern2'] = $this->language->get('text_main_menu_pattern2');
		$data['text_main_menu_link_color'] = $this->language->get('text_main_menu_link_color');
		$data['text_main_menu_link_shadow'] = $this->language->get('text_main_menu_link_shadow');
		$data['text_main_menu_icon_style'] = $this->language->get('text_main_menu_icon_style');
		$data['text_heading_design_content'] = $this->language->get('text_heading_design_content');
		$data['text_primary_color'] = $this->language->get('text_primary_color');
		$data['text_secondary_color'] = $this->language->get('text_secondary_color');
		$data['text_h1_color'] = $this->language->get('text_h1_color');
		$data['text_sub_heading_color'] = $this->language->get('text_sub_heading_color');
		
		$data['text_highlight_background_color'] = $this->language->get('text_highlight_background_color');
		$data['text_highlight_background_help'] = $this->language->get('text_highlight_background_help');
		$data['text_salebadge_background'] = $this->language->get('text_salebadge_background');
		$data['text_price_color'] = $this->language->get('text_price_color');
		
		$data['text_heading_modules'] = $this->language->get('text_heading_modules');
		$data['text_module_heading_background'] = $this->language->get('text_module_heading_background');
		$data['text_module_heading_color'] = $this->language->get('text_module_heading_color');
		
		$data['text_heading_product_tabs'] = $this->language->get('text_heading_product_tabs');
		$data['text_product_tabs_heading'] = $this->language->get('text_product_tabs_heading');
		$data['text_product_tabs_content'] = $this->language->get('text_product_tabs_content');
		
		$data['text_heading_buttons'] = $this->language->get('text_heading_buttons');
		$data['text_button_color'] = $this->language->get('text_button_color');
		$data['text_button_background'] = $this->language->get('text_button_background');
		$data['text_button_color_hover'] = $this->language->get('text_button_color_hover');
		$data['text_button_background_hover'] = $this->language->get('text_button_background_hover');
		$data['text_button2_color'] = $this->language->get('text_button2_color');
		$data['text_button2_background'] = $this->language->get('text_button2_background');
		
		$data['text_heading_icons'] = $this->language->get('text_heading_icons');
		$data['text_icons_background'] = $this->language->get('text_icons_background');
		$data['text_icons_background_help'] = $this->language->get('text_icons_background_help');
		$data['text_icons_background_hover'] = $this->language->get('text_icons_background_hover');
		
		$data['text_heading_design_footer'] = $this->language->get('text_heading_design_footer');
		$data['text_footer_background'] = $this->language->get('text_footer_background');
		$data['text_footer_pattern1'] = $this->language->get('text_footer_pattern1');
		$data['text_footer_pattern2'] = $this->language->get('text_footer_pattern2');
		$data['text_footer_social_icons_style'] = $this->language->get('text_footer_social_icons_style');
		$data['text_footer_social_icons_background'] = $this->language->get('text_footer_social_icons_background');
		$data['text_footer_social_icons_hover'] = $this->language->get('text_footer_social_icons_hover');
		$data['text_footer_content_background'] = $this->language->get('text_footer_content_background');
		$data['text_footer_headings'] = $this->language->get('text_footer_headings');
		$data['text_footer_links'] = $this->language->get('text_footer_links');
		$data['text_footer_links_hover'] = $this->language->get('text_footer_links_hover');
		$data['text_company_info_icons_style'] = $this->language->get('text_company_info_icons_style');
		
		// Custom CSS 
		$data['text_use_custom_css'] = $this->language->get('text_use_custom_css');
		$data['text_custom_css'] = $this->language->get('text_custom_css');
		$data['text_custom_css_help'] = $this->language->get('text_custom_css_help');
		// Language ends
		
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
			
		} 
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true),
      		'separator' => ' :: '
   		);
		
		
		$data['token'] = $this->session->data['token'];
		
		// Content starts
		// Font settings
		$data['cosyone_use_google_fonts_list'] = $this->language->get('cosyone_use_google_fonts_list');
		if (isset($this->request->post['cosyone_use_google_fonts'])) {
			$data['cosyone_use_google_fonts'] = $this->request->post['cosyone_use_google_fonts'];
		} else {
			$data['cosyone_use_google_fonts'] = $this->config->get('cosyone_use_google_fonts');
		}
		
		
		// General settings
		$data['cosyone_max_width_list'] = $this->language->get('cosyone_max_width_list');
		
		if (isset($this->request->post['cosyone_max_width'])) {
			$data['cosyone_max_width'] = $this->request->post['cosyone_max_width'];
		} else {
			$data['cosyone_max_width'] = $this->config->get('cosyone_max_width');
		}
		
		$data['cosyone_container_layout_list'] = $this->language->get('cosyone_container_layout_list');
		if (isset($this->request->post['cosyone_container_layout'])) {
			$data['cosyone_container_layout'] = $this->request->post['cosyone_container_layout'];
		} else {
			$data['cosyone_container_layout'] = $this->config->get('cosyone_container_layout');
		}
		
		$data['cosyone_use_responsive_list'] = $this->language->get('cosyone_use_responsive_list');
		
		if (isset($this->request->post['cosyone_use_responsive'])) {
			$data['cosyone_use_responsive'] = $this->request->post['cosyone_use_responsive'];
		} else {
			$data['cosyone_use_responsive'] = $this->config->get('cosyone_use_responsive');
		}
		
		$data['cosyone_use_breadcrumb_list'] = $this->language->get('cosyone_use_breadcrumb_list');
		
		if (isset($this->request->post['cosyone_use_breadcrumb'])) {
			$data['cosyone_use_breadcrumb'] = $this->request->post['cosyone_use_breadcrumb'];
		} else {
			$data['cosyone_use_breadcrumb'] = $this->config->get('cosyone_use_breadcrumb');
		}
		
		$data['cosyone_use_retina_list'] = $this->language->get('cosyone_use_retina_list');
		
		if (isset($this->request->post['cosyone_use_retina'])) {
			$data['cosyone_use_retina'] = $this->request->post['cosyone_use_retina'];
		} else {
			$data['cosyone_use_retina'] = $this->config->get('cosyone_use_retina');
		}
		
		
		
		
		if (isset($this->request->post['cosyone_top_promo_message'])) {
			$data['cosyone_top_promo_message'] = $this->request->post['cosyone_top_promo_message'];
		} else {
			$data['cosyone_top_promo_message'] = $this->config->get('cosyone_top_promo_message');
		}
		
		
	
		
		$data['cosyone_show_home_icon_list'] = $this->language->get('cosyone_show_home_icon_list');
		
		if (isset($this->request->post['cosyone_show_home_icon'])) {
			$data['cosyone_show_home_icon'] = $this->request->post['cosyone_show_home_icon'];
		} else {
			$data['cosyone_show_home_icon'] = $this->config->get('cosyone_show_home_icon');
		}
		
		$data['cosyone_menu_border_list'] = $this->language->get('cosyone_menu_border_list');
		
		if (isset($this->request->post['cosyone_menu_border'])) {
			$data['cosyone_menu_border'] = $this->request->post['cosyone_menu_border'];
		} else {
			$data['cosyone_menu_border'] = $this->config->get('cosyone_menu_border');
		}
		
		$data['cosyone_menu_sticky_list'] = $this->language->get('cosyone_menu_sticky_list');
		
		if (isset($this->request->post['cosyone_menu_sticky'])) {
			$data['cosyone_menu_sticky'] = $this->request->post['cosyone_menu_sticky'];
		} else {
			$data['cosyone_menu_sticky'] = $this->config->get('cosyone_menu_sticky');
		}
		
		
		$data['cosyone_menu_mega_second_thumb_list'] = $this->language->get('cosyone_menu_mega_second_thumb_list');
		if (isset($this->request->post['cosyone_menu_mega_second_thumb'])) {
			$data['cosyone_menu_mega_second_thumb'] = $this->request->post['cosyone_menu_mega_second_thumb'];
		} else {
			$data['cosyone_menu_mega_second_thumb'] = $this->config->get('cosyone_menu_mega_second_thumb');
		}
		
		
		
		if (isset($this->request->post['cosyone_menu_mega_second_image_w'])) {
			$data['cosyone_menu_mega_second_image_w'] = $this->request->post['cosyone_menu_mega_second_image_w'];
		} else {
			$data['cosyone_menu_mega_second_image_w'] = $this->config->get('cosyone_menu_mega_second_image_w');
		}
		
		if (isset($this->request->post['cosyone_menu_mega_second_image_h'])) {
			$data['cosyone_menu_mega_second_image_h'] = $this->request->post['cosyone_menu_mega_second_image_h'];
		} else {
			$data['cosyone_menu_mega_second_image_h'] = $this->config->get('cosyone_menu_mega_second_image_h');
		}
		
		
		$data['cosyone_category_thumb_list'] = $this->language->get('cosyone_category_thumb_list');
		if (isset($this->request->post['cosyone_category_thumb'])) {
			$data['cosyone_category_thumb'] = $this->request->post['cosyone_category_thumb'];
		} else {
			$data['cosyone_category_thumb'] = $this->config->get('cosyone_category_thumb');
		}
				
		if (isset($this->request->post['cosyone_custom_menu_title1'])) {
			$data['cosyone_custom_menu_title1'] = $this->request->post['cosyone_custom_menu_title1'];
		} else {
			$data['cosyone_custom_menu_title1'] = $this->config->get('cosyone_custom_menu_title1');
		}
		
		if (isset($this->request->post['cosyone_custom_menu_title2'])) {
			$data['cosyone_custom_menu_title2'] = $this->request->post['cosyone_custom_menu_title2'];
		} else {
			$data['cosyone_custom_menu_title2'] = $this->config->get('cosyone_custom_menu_title2');
		}
		
		if (isset($this->request->post['cosyone_custom_menu_title3'])) {
			$data['cosyone_custom_menu_title3'] = $this->request->post['cosyone_custom_menu_title3'];
		} else {
			$data['cosyone_custom_menu_title3'] = $this->config->get('cosyone_custom_menu_title3');
		}
		
		if (isset($this->request->post['cosyone_custom_menu_title4'])) {
			$data['cosyone_custom_menu_title4'] = $this->request->post['cosyone_custom_menu_title4'];
		} else {
			$data['cosyone_custom_menu_title4'] = $this->config->get('cosyone_custom_menu_title4');
		}
		
		if (isset($this->request->post['cosyone_custom_menu_title5'])) {
			$data['cosyone_custom_menu_title5'] = $this->request->post['cosyone_custom_menu_title5'];
		} else {
			$data['cosyone_custom_menu_title5'] = $this->config->get('cosyone_custom_menu_title5');
		}
		
                if (isset($this->request->post['cosyone_custom_menu_title6'])) {
			$data['cosyone_custom_menu_title6'] = $this->request->post['cosyone_custom_menu_title6'];
		} else {
			$data['cosyone_custom_menu_title6'] = $this->config->get('cosyone_custom_menu_title6');
		}
                
		if (isset($this->request->post['cosyone_text_ql'])) {
			$data['cosyone_text_ql'] = $this->request->post['cosyone_text_ql'];
		} else {
			$data['cosyone_text_ql'] = $this->config->get('cosyone_text_ql');
		}
		
		if (isset($this->request->post['cosyone_custom_menu_url1'])) {
			$data['cosyone_custom_menu_url1'] = $this->request->post['cosyone_custom_menu_url1'];
		} else {
			$data['cosyone_custom_menu_url1'] = $this->config->get('cosyone_custom_menu_url1');
		}
		
		if (isset($this->request->post['cosyone_custom_menu_url2'])) {
			$data['cosyone_custom_menu_url2'] = $this->request->post['cosyone_custom_menu_url2'];
		} else {
			$data['cosyone_custom_menu_url2'] = $this->config->get('cosyone_custom_menu_url2');
		}
		
		if (isset($this->request->post['cosyone_custom_menu_url3'])) {
			$data['cosyone_custom_menu_url3'] = $this->request->post['cosyone_custom_menu_url3'];
		} else {
			$data['cosyone_custom_menu_url3'] = $this->config->get('cosyone_custom_menu_url3');
		}
		
		if (isset($this->request->post['cosyone_custom_menu_url4'])) {
			$data['cosyone_custom_menu_url4'] = $this->request->post['cosyone_custom_menu_url4'];
		} else {
			$data['cosyone_custom_menu_url4'] = $this->config->get('cosyone_custom_menu_url4');
		}
		
		$data['cosyone_custom_menu_block_list'] = $this->language->get('cosyone_custom_menu_block_list');
		if (isset($this->request->post['cosyone_custom_menu_block'])) {
			$data['cosyone_custom_menu_block'] = $this->request->post['cosyone_custom_menu_block'];
		} else {
			$data['cosyone_custom_menu_block'] = $this->config->get('cosyone_custom_menu_block');
		}
		
		if (isset($this->request->post['cosyone_custom_menu_url5'])) {
			$data['cosyone_custom_menu_url5'] = $this->request->post['cosyone_custom_menu_url5'];
		} else {
			$data['cosyone_custom_menu_url5'] = $this->config->get('cosyone_custom_menu_url5');
		}
		if (isset($this->request->post['cosyone_custom_menu_url6'])) {
			$data['cosyone_custom_menu_url6'] = $this->request->post['cosyone_custom_menu_url6'];
		} else {
			$data['cosyone_custom_menu_url6'] = $this->config->get('cosyone_custom_menu_url6');
		}
		if (isset($this->request->post['cosyone_menu_block_width'])) {
			$data['cosyone_menu_block_width'] = $this->request->post['cosyone_menu_block_width'];
		} else {
			$data['cosyone_menu_block_width'] = $this->config->get('cosyone_menu_block_width');
		}
				
		if (isset($this->request->post['cosyone_custom_menu_block_title'])) {
			$data['cosyone_custom_menu_block_title'] = $this->request->post['cosyone_custom_menu_block_title'];
		} else {
			$data['cosyone_custom_menu_block_title'] = $this->config->get('cosyone_custom_menu_block_title');
		}
		
		if (isset($this->request->post['cosyone_menu_custom_block_content'])) {
			$data['cosyone_menu_custom_block_content'] = $this->request->post['cosyone_menu_custom_block_content'];
		} else {
			$data['cosyone_menu_custom_block_content'] = $this->config->get('cosyone_menu_custom_block_content');
		}
		
		if (isset($this->request->post['cosyone_google_map'])) {
			$data['cosyone_google_map'] = $this->request->post['cosyone_google_map'];
		} else {
			$data['cosyone_google_map'] = $this->config->get('cosyone_google_map');
		}
		
		
		$data['cosyone_grid_category_list'] = $this->language->get('cosyone_grid_category_list');
		if (isset($this->request->post['cosyone_grid_category'])) {
			$data['cosyone_grid_category'] = $this->request->post['cosyone_grid_category'];
		} else {
			$data['cosyone_grid_category'] = $this->config->get('cosyone_grid_category');
		}
		
		$data['cosyone_grid_related_list'] = $this->language->get('cosyone_grid_related_list');
		if (isset($this->request->post['cosyone_grid_related'])) {
			$data['cosyone_grid_related'] = $this->request->post['cosyone_grid_related'];
		} else {
			$data['cosyone_grid_related'] = $this->config->get('cosyone_grid_related');
		}
		
		$data['cosyone_product_share_list'] = $this->language->get('cosyone_product_share_list');
		if (isset($this->request->post['cosyone_product_share'])) {
			$data['cosyone_product_share'] = $this->request->post['cosyone_product_share'];
		} else {
			$data['cosyone_product_share'] = $this->config->get('cosyone_product_share');
		}
		
		$data['cosyone_product_countdown_list'] = $this->language->get('cosyone_product_countdown_list');
		if (isset($this->request->post['cosyone_product_countdown'])) {
			$data['cosyone_product_countdown'] = $this->request->post['cosyone_product_countdown'];
		} else {
			$data['cosyone_product_countdown'] = $this->config->get('cosyone_product_countdown');
		}
		
		$data['cosyone_product_hurry_list'] = $this->language->get('cosyone_product_hurry_list');
		if (isset($this->request->post['cosyone_product_hurry'])) {
			$data['cosyone_product_hurry'] = $this->request->post['cosyone_product_hurry'];
		} else {
			$data['cosyone_product_hurry'] = $this->config->get('cosyone_product_hurry');
		}
		
		$data['cosyone_product_zoom_list'] = $this->language->get('cosyone_product_zoom_list');
		if (isset($this->request->post['cosyone_product_zoom'])) {
			$data['cosyone_product_zoom'] = $this->request->post['cosyone_product_zoom'];
		} else {
			$data['cosyone_product_zoom'] = $this->config->get('cosyone_product_zoom');
		}
		
		$data['cosyone_image_options_list'] = $this->language->get('cosyone_image_options_list');
		if (isset($this->request->post['cosyone_image_options'])) {
			$data['cosyone_image_options'] = $this->request->post['cosyone_image_options'];
		} else {
			$data['cosyone_image_options'] = $this->config->get('cosyone_image_options');
		}
		
		$data['cosyone_product_break_list'] = $this->language->get('cosyone_product_break_list');
		if (isset($this->request->post['cosyone_product_break'])) {
			$data['cosyone_product_break'] = $this->request->post['cosyone_product_break'];
		} else {
			$data['cosyone_product_break'] = $this->config->get('cosyone_product_break');
		}
		
		
		
		$data['cosyone_product_yousave_list'] = $this->language->get('cosyone_product_yousave_list');
		if (isset($this->request->post['cosyone_product_yousave'])) {
			$data['cosyone_product_yousave'] = $this->request->post['cosyone_product_yousave'];
		} else {
			$data['cosyone_product_yousave'] = $this->config->get('cosyone_product_yousave');
		}
		
		
		$data['cosyone_category_refine_list'] = $this->language->get('cosyone_category_refine_list');
		if (isset($this->request->post['cosyone_category_refine'])) {
			$data['cosyone_category_refine'] = $this->request->post['cosyone_category_refine'];
		} else {
			$data['cosyone_category_refine'] = $this->config->get('cosyone_category_refine');
		}
		
		$data['cosyone_category_per_row_list'] = $this->language->get('cosyone_category_per_row_list');
		if (isset($this->request->post['cosyone_category_per_row'])) {
			$data['cosyone_category_per_row'] = $this->request->post['cosyone_category_per_row'];
		} else {
			$data['cosyone_category_per_row'] = $this->config->get('cosyone_category_per_row');
		}
		
		if (isset($this->request->post['cosyone_refine_image_w'])) {
			$data['cosyone_refine_image_w'] = $this->request->post['cosyone_refine_image_w'];
		} else {
			$data['cosyone_refine_image_w'] = $this->config->get('cosyone_refine_image_w');
		}
		
		if (isset($this->request->post['cosyone_refine_image_h'])) {
			$data['cosyone_refine_image_h'] = $this->request->post['cosyone_refine_image_h'];
		} else {
			$data['cosyone_refine_image_h'] = $this->config->get('cosyone_refine_image_h');
		}
		
		$data['cosyone_default_product_style_list'] = $this->language->get('cosyone_default_product_style_list');
		if (isset($this->request->post['cosyone_default_product_style'])) {
			$data['cosyone_default_product_style'] = $this->request->post['cosyone_default_product_style'];
		} else {
			$data['cosyone_default_product_style'] = $this->config->get('cosyone_default_product_style');
		}
		
		$data['cosyone_default_view_list'] = $this->language->get('cosyone_default_view_list');
		if (isset($this->request->post['cosyone_default_view'])) {
			$data['cosyone_default_view'] = $this->request->post['cosyone_default_view'];
		} else {
			$data['cosyone_default_view'] = $this->config->get('cosyone_default_view');
		}
		
		$data['cosyone_rollover_effect_list'] = $this->language->get('cosyone_rollover_effect_list');
		if (isset($this->request->post['cosyone_rollover_effect'])) {
			$data['cosyone_rollover_effect'] = $this->request->post['cosyone_rollover_effect'];
		} else {
			$data['cosyone_rollover_effect'] = $this->config->get('cosyone_rollover_effect');
		}
		
		$data['cosyone_percentage_sale_badge_list'] = $this->language->get('cosyone_percentage_sale_badge_list');
		if (isset($this->request->post['cosyone_percentage_sale_badge'])) {
			$data['cosyone_percentage_sale_badge'] = $this->request->post['cosyone_percentage_sale_badge'];
		} else {
			$data['cosyone_percentage_sale_badge'] = $this->config->get('cosyone_percentage_sale_badge');
		}
		
		$data['cosyone_brand_list'] = $this->language->get('cosyone_brand_list');
		if (isset($this->request->post['cosyone_brand'])) {
			$data['cosyone_brand'] = $this->request->post['cosyone_brand'];
		} else {
			$data['cosyone_brand'] = $this->config->get('cosyone_brand');
		}
		
		$data['cosyone_footer_columns_list'] = $this->language->get('cosyone_footer_columns_list');
		if (isset($this->request->post['cosyone_footer_columns'])) {
			$data['cosyone_footer_columns'] = $this->request->post['cosyone_footer_columns'];
		} else {
			$data['cosyone_footer_columns'] = $this->config->get('cosyone_footer_columns');
		}
		
		
		if (isset($this->request->post['cosyone_footer_custom_block_title'])) {
			$data['cosyone_footer_custom_block_title'] = $this->request->post['cosyone_footer_custom_block_title'];
		} else {
			$data['cosyone_footer_custom_block_title'] = $this->config->get('cosyone_footer_custom_block_title');
		}
				
		if (isset($this->request->post['cosyone_footer_custom_block'])) {
			$data['cosyone_footer_custom_block'] = $this->request->post['cosyone_footer_custom_block'];
		} else {
			$data['cosyone_footer_custom_block'] = $this->config->get('cosyone_footer_custom_block');
		}
		
		$this->load->model('tool/image');
		
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		if (isset($this->request->post['cosyone_footer_payment_icon'])) {
			$data['cosyone_footer_payment_icon'] = $this->request->post['cosyone_footer_payment_icon'];
		} else {
			$data['cosyone_footer_payment_icon'] = $this->config->get('cosyone_footer_payment_icon');
		}
		
		if (isset($this->request->post['cosyone_footer_payment_icon']) && is_file(DIR_IMAGE . $this->request->post['cosyone_footer_payment_icon'])) {
			$data['cosyone_footer_payment'] = $this->model_tool_image->resize($this->request->post['cosyone_footer_payment_icon'], 100, 100);
		} elseif ($this->config->get('cosyone_footer_payment_icon') && is_file(DIR_IMAGE . $this->config->get('cosyone_footer_payment_icon'))) {
			$data['cosyone_footer_payment'] = $this->model_tool_image->resize($this->config->get('cosyone_footer_payment_icon'), 100, 100);
		} else {
			$data['cosyone_footer_payment'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		if (isset($this->request->post['cosyone_custom_bg_icon'])) {
			$data['cosyone_custom_bg_icon'] = $this->request->post['cosyone_custom_bg_icon'];
		} else {
			$data['cosyone_custom_bg_icon'] = $this->config->get('cosyone_custom_bg_icon');
		}
		
		if (isset($this->request->post['cosyone_custom_bg_icon']) && is_file(DIR_IMAGE . $this->request->post['cosyone_custom_bg_icon'])) {
			$data['cosyone_custom_bg'] = $this->model_tool_image->resize($this->request->post['cosyone_custom_bg_icon'], 100, 100);
		} elseif ($this->config->get('cosyone_custom_bg_icon') && is_file(DIR_IMAGE . $this->config->get('cosyone_custom_bg_icon'))) {
			$data['cosyone_custom_bg'] = $this->model_tool_image->resize($this->config->get('cosyone_custom_bg_icon'), 100, 100);
		} else {
			$data['cosyone_custom_bg'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		
		
		
		
		
		
		
		$data['cosyone_use_cookie_list'] = $this->language->get('cosyone_use_cookie_list');
		if (isset($this->request->post['cosyone_use_cookie'])) {
			$data['cosyone_use_cookie'] = $this->request->post['cosyone_use_cookie'];
		} else {
			$data['cosyone_use_cookie'] = $this->config->get('cosyone_use_cookie');
		}
		
		if (isset($this->request->post['cosyone_cookie_text'])) {
			$data['cosyone_cookie_text'] = $this->request->post['cosyone_cookie_text'];
		} else {
			$data['cosyone_cookie_text'] = $this->config->get('cosyone_cookie_text');
		}
		
		if (isset($this->request->post['cosyone_readmore_url'])) {
			$data['cosyone_readmore_url'] = $this->request->post['cosyone_readmore_url'];
		} else {
			$data['cosyone_readmore_url'] = $this->config->get('cosyone_readmore_url');
		}
		
		if (isset($this->request->post['cosyone_cookie_button_readmore'])) {
			$data['cosyone_cookie_button_readmore'] = $this->request->post['cosyone_cookie_button_readmore'];
		} else {
			$data['cosyone_cookie_button_readmore'] = $this->config->get('cosyone_cookie_button_readmore');
		}
		
		if (isset($this->request->post['cosyone_cookie_button_accept'])) {
			$data['cosyone_cookie_button_accept'] = $this->request->post['cosyone_cookie_button_accept'];
		} else {
			$data['cosyone_cookie_button_accept'] = $this->config->get('cosyone_cookie_button_accept');
		}
		
		$data['cosyone_use_ie_list'] = $this->language->get('cosyone_use_ie_list');
		if (isset($this->request->post['cosyone_use_ie'])) {
			$data['cosyone_use_ie'] = $this->request->post['cosyone_use_ie'];
		} else {
			$data['cosyone_use_ie'] = $this->config->get('cosyone_use_ie');
		}
		
		if (isset($this->request->post['cosyone_ie_text'])) {
			$data['cosyone_ie_text'] = $this->request->post['cosyone_ie_text'];
		} else {
			$data['cosyone_ie_text'] = $this->config->get('cosyone_ie_text');
		}
		
		if (isset($this->request->post['cosyone_ie_update_text'])) {
			$data['cosyone_ie_update_text'] = $this->request->post['cosyone_ie_update_text'];
		} else {
			$data['cosyone_ie_update_text'] = $this->config->get('cosyone_ie_update_text');
		}
		
		if (isset($this->request->post['cosyone_ie_url'])) {
			$data['cosyone_ie_url'] = $this->request->post['cosyone_ie_url'];
		} else {
			$data['cosyone_ie_url'] = $this->config->get('cosyone_ie_url');
		}
		
		// General settings ends
		
		// Design options
		
		$data['cosyone_header_style_list'] = $this->language->get('cosyone_header_style_list');
		
		if (isset($this->request->post['cosyone_header_style'])) {
			$data['cosyone_header_style'] = $this->request->post['cosyone_header_style'];
		} else {
			$data['cosyone_header_style'] = $this->config->get('cosyone_header_style');
		}
		
		$data['cosyone_header_login_list'] = $this->language->get('cosyone_header_login_list');
		
		if (isset($this->request->post['cosyone_header_login'])) {
			$data['cosyone_header_login'] = $this->request->post['cosyone_header_login'];
		} else {
			$data['cosyone_header_login'] = $this->config->get('cosyone_header_login');
		}
		
		$data['cosyone_header_wishlist_list'] = $this->language->get('cosyone_header_wishlist_list');
		
		if (isset($this->request->post['cosyone_header_wishlist'])) {
			$data['cosyone_header_wishlist'] = $this->request->post['cosyone_header_wishlist'];
		} else {
			$data['cosyone_header_wishlist'] = $this->config->get('cosyone_header_wishlist');
		}
		
		$data['cosyone_header_compare_list'] = $this->language->get('cosyone_header_compare_list');
		
		if (isset($this->request->post['cosyone_header_compare'])) {
			$data['cosyone_header_compare'] = $this->request->post['cosyone_header_compare'];
		} else {
			$data['cosyone_header_compare'] = $this->config->get('cosyone_header_compare');
		}
		
		$data['cosyone_header_search_list'] = $this->language->get('cosyone_header_search_list');
		
		if (isset($this->request->post['cosyone_header_search'])) {
			$data['cosyone_header_search'] = $this->request->post['cosyone_header_search'];
		} else {
			$data['cosyone_header_search'] = $this->config->get('cosyone_header_search');
		}
		
		$data['cosyone_header_cart_list'] = $this->language->get('cosyone_header_cart_list');
		
		if (isset($this->request->post['cosyone_header_cart'])) {
			$data['cosyone_header_cart'] = $this->request->post['cosyone_header_cart'];
		} else {
			$data['cosyone_header_cart'] = $this->config->get('cosyone_header_cart');
		}
		
		// Fonts
		$data['cosyone_use_custom_font_list'] = $this->language->get('cosyone_use_custom_font_list');
		
		if (isset($this->request->post['cosyone_use_custom_font'])) {
			$data['cosyone_use_custom_font'] = $this->request->post['cosyone_use_custom_font'];
		} else {
			$data['cosyone_use_custom_font'] = $this->config->get('cosyone_use_custom_font');
		}
		
		if (isset($this->request->post['cosyone_font1_import'])) {
			$data['cosyone_font1_import'] = $this->request->post['cosyone_font1_import'];
		} else {
			$data['cosyone_font1_import'] = $this->config->get('cosyone_font1_import');
		}
		
		if (isset($this->request->post['cosyone_font1_name'])) {
			$data['cosyone_font1_name'] = $this->request->post['cosyone_font1_name'];
		} else {
			$data['cosyone_font1_name'] = $this->config->get('cosyone_font1_name');
		}
		
		if (isset($this->request->post['cosyone_font2_import'])) {
			$data['cosyone_font2_import'] = $this->request->post['cosyone_font2_import'];
		} else {
			$data['cosyone_font2_import'] = $this->config->get('cosyone_font2_import');
		}
		
		if (isset($this->request->post['cosyone_font2_name'])) {
			$data['cosyone_font2_name'] = $this->request->post['cosyone_font2_name'];
		} else {
			$data['cosyone_font2_name'] = $this->config->get('cosyone_font2_name');
		}
		
		$data['cosyone_use_font_light_list'] = $this->language->get('cosyone_use_font_light_list');
		
		if (isset($this->request->post['cosyone_use_font_light'])) {
			$data['cosyone_use_font_light'] = $this->request->post['cosyone_use_font_light'];
		} else {
			$data['cosyone_use_font_light'] = $this->config->get('cosyone_use_font_light');
		}
		
		$data['cosyone_use_font_regular_list'] = $this->language->get('cosyone_use_font_regular_list');
		
		if (isset($this->request->post['cosyone_use_font_regular'])) {
			$data['cosyone_use_font_regular'] = $this->request->post['cosyone_use_font_regular'];
		} else {
			$data['cosyone_use_font_regular'] = $this->config->get('cosyone_use_font_regular');
		}
		
		$data['cosyone_use_font_semibold_list'] = $this->language->get('cosyone_use_font_semibold_list');
		
		if (isset($this->request->post['cosyone_use_font_semibold'])) {
			$data['cosyone_use_font_semibold'] = $this->request->post['cosyone_use_font_semibold'];
		} else {
			$data['cosyone_use_font_semibold'] = $this->config->get('cosyone_use_font_semibold');
		}
		
		$data['cosyone_use_font_bold_list'] = $this->language->get('cosyone_use_font_bold_list');
		
		if (isset($this->request->post['cosyone_use_font_bold'])) {
			$data['cosyone_use_font_bold'] = $this->request->post['cosyone_use_font_bold'];
		} else {
			$data['cosyone_use_font_bold'] = $this->config->get('cosyone_use_font_bold');
		}
		
		// Fonts
		
		$data['cosyone_use_custom_list'] = $this->language->get('cosyone_use_custom_list');
		
		if (isset($this->request->post['cosyone_use_custom'])) {
			$data['cosyone_use_custom'] = $this->request->post['cosyone_use_custom'];
		} else {
			$data['cosyone_use_custom'] = $this->config->get('cosyone_use_custom');
		}
		
		if (isset($this->request->post['cosyone_body_background'])) {
			$data['cosyone_body_background'] = $this->request->post['cosyone_body_background'];
		} else {
			$data['cosyone_body_background'] = $this->config->get('cosyone_body_background');
		}
		
		$data['cosyone_body_image_list'] = $this->language->get('cosyone_body_image_list');
		if (isset($this->request->post['cosyone_body_image'])) {
			$data['cosyone_body_image'] = $this->request->post['cosyone_body_image'];
		} else {
			$data['cosyone_body_image'] = $this->config->get('cosyone_body_image');
		}
		
		
		
		if (isset($this->request->post['cosyone_top_border_background'])) {
			$data['cosyone_top_border_background'] = $this->request->post['cosyone_top_border_background'];
		} else {
			$data['cosyone_top_border_background'] = $this->config->get('cosyone_top_border_background');
		}
		
		if (isset($this->request->post['cosyone_top_border_border'])) {
			$data['cosyone_top_border_border'] = $this->request->post['cosyone_top_border_border'];
		} else {
			$data['cosyone_top_border_border'] = $this->config->get('cosyone_top_border_border');
		}
		
		if (isset($this->request->post['cosyone_top_border_text'])) {
			$data['cosyone_top_border_text'] = $this->request->post['cosyone_top_border_text'];
		} else {
			$data['cosyone_top_border_text'] = $this->config->get('cosyone_top_border_text');
		}
		
		if (isset($this->request->post['cosyone_top_border_link'])) {
			$data['cosyone_top_border_link'] = $this->request->post['cosyone_top_border_link'];
		} else {
			$data['cosyone_top_border_link'] = $this->config->get('cosyone_top_border_link');
		}
		
		if (isset($this->request->post['cosyone_top_border_link_hover'])) {
			$data['cosyone_top_border_link_hover'] = $this->request->post['cosyone_top_border_link_hover'];
		} else {
			$data['cosyone_top_border_link_hover'] = $this->config->get('cosyone_top_border_link_hover');
		}
		
		$data['cosyone_language_currency_list'] = $this->language->get('cosyone_language_currency_list');
		
		if (isset($this->request->post['cosyone_language_currency'])) {
			$data['cosyone_language_currency'] = $this->request->post['cosyone_language_currency'];
		} else {
			$data['cosyone_language_currency'] = $this->config->get('cosyone_language_currency');
		}		
		
		if (isset($this->request->post['cosyone_header_text'])) {
			$data['cosyone_header_text'] = $this->request->post['cosyone_header_text'];
		} else {
			$data['cosyone_header_text'] = $this->config->get('cosyone_header_text');
		}
		
		if (isset($this->request->post['cosyone_search_field_text'])) {
			$data['cosyone_search_field_text'] = $this->request->post['cosyone_search_field_text'];
		} else {
			$data['cosyone_search_field_text'] = $this->config->get('cosyone_search_field_text');
		}
		
		if (isset($this->request->post['cosyone_search_field_background'])) {
			$data['cosyone_search_field_background'] = $this->request->post['cosyone_search_field_background'];
		} else {
			$data['cosyone_search_field_background'] = $this->config->get('cosyone_search_field_background');
		}
		
		if (isset($this->request->post['cosyone_search_field_background_hover'])) {
			$data['cosyone_search_field_background_hover'] = $this->request->post['cosyone_search_field_background_hover'];
		} else {
			$data['cosyone_search_field_background_hover'] = $this->config->get('cosyone_search_field_background_hover');
		}
		
		$data['cosyone_search_field_icons_list'] = $this->language->get('cosyone_search_field_icons_list');
		if (isset($this->request->post['cosyone_search_field_icons'])) {
			$data['cosyone_search_field_icons'] = $this->request->post['cosyone_search_field_icons'];
		} else {
			$data['cosyone_search_field_icons'] = $this->config->get('cosyone_search_field_icons');
		}
		
		if (isset($this->request->post['cosyone_user_menu_background'])) {
			$data['cosyone_user_menu_background'] = $this->request->post['cosyone_user_menu_background'];
		} else {
			$data['cosyone_user_menu_background'] = $this->config->get('cosyone_user_menu_background');
		}
		
		if (isset($this->request->post['cosyone_user_menu_background_opacity'])) {
			$data['cosyone_user_menu_background_opacity'] = $this->request->post['cosyone_user_menu_background_opacity'];
		} else {
			$data['cosyone_user_menu_background_opacity'] = $this->config->get('cosyone_user_menu_background_opacity');
		}
		
		if (isset($this->request->post['cosyone_user_menu_background_opacity_hover'])) {
			$data['cosyone_user_menu_background_opacity_hover'] = $this->request->post['cosyone_user_menu_background_opacity_hover'];
		} else {
			$data['cosyone_user_menu_background_opacity_hover'] = $this->config->get('cosyone_user_menu_background_opacity_hover');
		}
		
		$data['cosyone_user_menu_icons_list'] = $this->language->get('cosyone_user_menu_icons_list');
		
		if (isset($this->request->post['cosyone_user_menu_icons'])) {
			$data['cosyone_user_menu_icons'] = $this->request->post['cosyone_user_menu_icons'];
		} else {
			$data['cosyone_user_menu_icons'] = $this->config->get('cosyone_user_menu_icons');
		}
		
		if (isset($this->request->post['cosyone_user_menu_text'])) {
			$data['cosyone_user_menu_text'] = $this->request->post['cosyone_user_menu_text'];
		} else {
			$data['cosyone_user_menu_text'] = $this->config->get('cosyone_user_menu_text');
		}
		
		if (isset($this->request->post['cosyone_user_menu_text_hover'])) {
			$data['cosyone_user_menu_text_hover'] = $this->request->post['cosyone_user_menu_text_hover'];
		} else {
			$data['cosyone_user_menu_text_hover'] = $this->config->get('cosyone_user_menu_text_hover');
		}
		
		if (isset($this->request->post['cosyone_menu_background'])) {
			$data['cosyone_menu_background'] = $this->request->post['cosyone_menu_background'];
		} else {
			$data['cosyone_menu_background'] = $this->config->get('cosyone_menu_background');
		}
		
		$data['cosyone_menu_pattern1_list'] = $this->language->get('cosyone_menu_pattern1_list');
		if (isset($this->request->post['cosyone_menu_pattern1'])) {
			$data['cosyone_menu_pattern1'] = $this->request->post['cosyone_menu_pattern1'];
		} else {
			$data['cosyone_menu_pattern1'] = $this->config->get('cosyone_menu_pattern1');
		}
		
		$data['cosyone_menu_pattern2_list'] = $this->language->get('cosyone_menu_pattern2_list');
		if (isset($this->request->post['cosyone_menu_pattern2'])) {
			$data['cosyone_menu_pattern2'] = $this->request->post['cosyone_menu_pattern2'];
		} else {
			$data['cosyone_menu_pattern2'] = $this->config->get('cosyone_menu_pattern2');
		}
		
		if (isset($this->request->post['cosyone_menu_link_color'])) {
			$data['cosyone_menu_link_color'] = $this->request->post['cosyone_menu_link_color'];
		} else {
			$data['cosyone_menu_link_color'] = $this->config->get('cosyone_menu_link_color');
		}
		
		if (isset($this->request->post['cosyone_menu_link_color_hover'])) {
			$data['cosyone_menu_link_color_hover'] = $this->request->post['cosyone_menu_link_color_hover'];
		} else {
			$data['cosyone_menu_link_color_hover'] = $this->config->get('cosyone_menu_link_color_hover');
		}
		
		if (isset($this->request->post['cosyone_menu_link_background_hover'])) {
			$data['cosyone_menu_link_background_hover'] = $this->request->post['cosyone_menu_link_background_hover'];
		} else {
			$data['cosyone_menu_link_background_hover'] = $this->config->get('cosyone_menu_link_background_hover');
		}
		
		if (isset($this->request->post['cosyone_shortcut_separator'])) {
			$data['cosyone_shortcut_separator'] = $this->request->post['cosyone_shortcut_separator'];
		} else {
			$data['cosyone_shortcut_separator'] = $this->config->get('cosyone_shortcut_separator');
		}
		
		
		if (isset($this->request->post['cosyone_primary_color'])) {
			$data['cosyone_primary_color'] = $this->request->post['cosyone_primary_color'];
		} else {
			$data['cosyone_primary_color'] = $this->config->get('cosyone_primary_color');
		}
		
		if (isset($this->request->post['cosyone_secondary_color'])) {
			$data['cosyone_secondary_color'] = $this->request->post['cosyone_secondary_color'];
		} else {
			$data['cosyone_secondary_color'] = $this->config->get('cosyone_secondary_color');
		}
		
		if (isset($this->request->post['cosyone_link_hover_color'])) {
			$data['cosyone_link_hover_color'] = $this->request->post['cosyone_link_hover_color'];
		} else {
			$data['cosyone_link_hover_color'] = $this->config->get('cosyone_link_hover_color');
		}
		
		if (isset($this->request->post['cosyone_offer_color'])) {
			$data['cosyone_offer_color'] = $this->request->post['cosyone_offer_color'];
		} else {
			$data['cosyone_offer_color'] = $this->config->get('cosyone_offer_color');
		}
		
		if (isset($this->request->post['cosyone_h1_color'])) {
			$data['cosyone_h1_color'] = $this->request->post['cosyone_h1_color'];
		} else {
			$data['cosyone_h1_color'] = $this->config->get('cosyone_h1_color');
		}
		
		if (isset($this->request->post['cosyone_heading_color'])) {
			$data['cosyone_heading_color'] = $this->request->post['cosyone_heading_color'];
		} else {
			$data['cosyone_heading_color'] = $this->config->get('cosyone_heading_color');
		}
		
		if (isset($this->request->post['cosyone_highlight_background'])) {
			$data['cosyone_highlight_background'] = $this->request->post['cosyone_highlight_background'];
		} else {
			$data['cosyone_highlight_background'] = $this->config->get('cosyone_highlight_background');
		}
		
		if (isset($this->request->post['cosyone_salebadge_background'])) {
			$data['cosyone_salebadge_background'] = $this->request->post['cosyone_salebadge_background'];
		} else {
			$data['cosyone_salebadge_background'] = $this->config->get('cosyone_salebadge_background');
		}
		
		if (isset($this->request->post['cosyone_price_color'])) {
			$data['cosyone_price_color'] = $this->request->post['cosyone_price_color'];
		} else {
			$data['cosyone_price_color'] = $this->config->get('cosyone_price_color');
		}
		
		if (isset($this->request->post['cosyone_module_heading_background'])) {
			$data['cosyone_module_heading_background'] = $this->request->post['cosyone_module_heading_background'];
		} else {
			$data['cosyone_module_heading_background'] = $this->config->get('cosyone_module_heading_background');
		}
		
		if (isset($this->request->post['cosyone_module_heading_color'])) {
			$data['cosyone_module_heading_color'] = $this->request->post['cosyone_module_heading_color'];
		} else {
			$data['cosyone_module_heading_color'] = $this->config->get('cosyone_module_heading_color');
		}
		
		if (isset($this->request->post['cosyone_product_tabs_heading'])) {
			$data['cosyone_product_tabs_heading'] = $this->request->post['cosyone_product_tabs_heading'];
		} else {
			$data['cosyone_product_tabs_heading'] = $this->config->get('cosyone_product_tabs_heading');
		}
		
		if (isset($this->request->post['cosyone_product_tabs_content'])) {
			$data['cosyone_product_tabs_content'] = $this->request->post['cosyone_product_tabs_content'];
		} else {
			$data['cosyone_product_tabs_content'] = $this->config->get('cosyone_product_tabs_content');
		}
		
		if (isset($this->request->post['cosyone_button_color'])) {
			$data['cosyone_button_color'] = $this->request->post['cosyone_button_color'];
		} else {
			$data['cosyone_button_color'] = $this->config->get('cosyone_button_color');
		}
		
		if (isset($this->request->post['cosyone_button_background'])) {
			$data['cosyone_button_background'] = $this->request->post['cosyone_button_background'];
		} else {
			$data['cosyone_button_background'] = $this->config->get('cosyone_button_background');
		}
		
		if (isset($this->request->post['cosyone_button_border'])) {
			$data['cosyone_button_border'] = $this->request->post['cosyone_button_border'];
		} else {
			$data['cosyone_button_border'] = $this->config->get('cosyone_button_border');
		}
		
		
		
		if (isset($this->request->post['cosyone_button_hover_color'])) {
			$data['cosyone_button_hover_color'] = $this->request->post['cosyone_button_hover_color'];
		} else {
			$data['cosyone_button_hover_color'] = $this->config->get('cosyone_button_hover_color');
		}
		
		if (isset($this->request->post['cosyone_button_hover_background'])) {
			$data['cosyone_button_hover_background'] = $this->request->post['cosyone_button_hover_background'];
		} else {
			$data['cosyone_button_hover_background'] = $this->config->get('cosyone_button_hover_background');
		}
		
		if (isset($this->request->post['cosyone_button_hover_border'])) {
			$data['cosyone_button_hover_border'] = $this->request->post['cosyone_button_hover_border'];
		} else {
			$data['cosyone_button_hover_border'] = $this->config->get('cosyone_button_hover_border');
		}
		
		
		
		if (isset($this->request->post['cosyone_button2_color'])) {
			$data['cosyone_button2_color'] = $this->request->post['cosyone_button2_color'];
		} else {
			$data['cosyone_button2_color'] = $this->config->get('cosyone_button2_color');
		}
		
		if (isset($this->request->post['cosyone_button2_background'])) {
			$data['cosyone_button2_background'] = $this->request->post['cosyone_button2_background'];
		} else {
			$data['cosyone_button2_background'] = $this->config->get('cosyone_button2_background');
		}
		
		if (isset($this->request->post['cosyone_button2_border'])) {
			$data['cosyone_button2_border'] = $this->request->post['cosyone_button2_border'];
		} else {
			$data['cosyone_button2_border'] = $this->config->get('cosyone_button2_border');
		}
		
		
		if (isset($this->request->post['cosyone_button2_hover_color'])) {
			$data['cosyone_button2_hover_color'] = $this->request->post['cosyone_button2_hover_color'];
		} else {
			$data['cosyone_button2_hover_color'] = $this->config->get('cosyone_button2_hover_color');
		}
		
		if (isset($this->request->post['cosyone_button2_hover_background'])) {
			$data['cosyone_button2_hover_background'] = $this->request->post['cosyone_button2_hover_background'];
		} else {
			$data['cosyone_button2_hover_background'] = $this->config->get('cosyone_button2_hover_background');
		}
		
		if (isset($this->request->post['cosyone_button2_hover_border'])) {
			$data['cosyone_button2_hover_border'] = $this->request->post['cosyone_button2_hover_border'];
		} else {
			$data['cosyone_button2_hover_border'] = $this->config->get('cosyone_button2_hover_border');
		}
		
		
		
		if (isset($this->request->post['cosyone_icons_background'])) {
			$data['cosyone_icons_background'] = $this->request->post['cosyone_icons_background'];
		} else {
			$data['cosyone_icons_background'] = $this->config->get('cosyone_icons_background');
		}
		
		if (isset($this->request->post['cosyone_icons_background_hover'])) {
			$data['cosyone_icons_background_hover'] = $this->request->post['cosyone_icons_background_hover'];
		} else {
			$data['cosyone_icons_background_hover'] = $this->config->get('cosyone_icons_background_hover');
		}
		
		if (isset($this->request->post['cosyone_footer_background'])) {
			$data['cosyone_footer_background'] = $this->request->post['cosyone_footer_background'];
		} else {
			$data['cosyone_footer_background'] = $this->config->get('cosyone_footer_background');
		}
		
		$data['cosyone_footer_pattern1_list'] = $this->language->get('cosyone_footer_pattern1_list');
		if (isset($this->request->post['cosyone_footer_pattern1'])) {
			$data['cosyone_footer_pattern1'] = $this->request->post['cosyone_footer_pattern1'];
		} else {
			$data['cosyone_footer_pattern1'] = $this->config->get('cosyone_footer_pattern1');
		}
		
		$data['cosyone_footer_pattern2_list'] = $this->language->get('cosyone_footer_pattern2_list');
		if (isset($this->request->post['cosyone_footer_pattern2'])) {
			$data['cosyone_footer_pattern2'] = $this->request->post['cosyone_footer_pattern2'];
		} else {
			$data['cosyone_footer_pattern2'] = $this->config->get('cosyone_footer_pattern2');
		}
		
		$data['cosyone_footer_social_icons_style_list'] = $this->language->get('cosyone_footer_social_icons_style_list');
		if (isset($this->request->post['cosyone_footer_social_icons_style'])) {
			$data['cosyone_footer_social_icons_style'] = $this->request->post['cosyone_footer_social_icons_style'];
		} else {
			$data['cosyone_footer_social_icons_style'] = $this->config->get('cosyone_footer_social_icons_style');
		}
		
		if (isset($this->request->post['cosyone_footer_social_icons_background'])) {
			$data['cosyone_footer_social_icons_background'] = $this->request->post['cosyone_footer_social_icons_background'];
		} else {
			$data['cosyone_footer_social_icons_background'] = $this->config->get('cosyone_footer_social_icons_background');
		}
		
		if (isset($this->request->post['cosyone_footer_social_icons_hover'])) {
			$data['cosyone_footer_social_icons_hover'] = $this->request->post['cosyone_footer_social_icons_hover'];
		} else {
			$data['cosyone_footer_social_icons_hover'] = $this->config->get('cosyone_footer_social_icons_hover');
		}
		
		$data['cosyone_footer_content_background_list'] = $this->language->get('cosyone_footer_content_background_list');
		if (isset($this->request->post['cosyone_footer_content_background'])) {
			$data['cosyone_footer_content_background'] = $this->request->post['cosyone_footer_content_background'];
		} else {
			$data['cosyone_footer_content_background'] = $this->config->get('cosyone_footer_content_background');
		}
		
		if (isset($this->request->post['cosyone_footer_heading'])) {
			$data['cosyone_footer_heading'] = $this->request->post['cosyone_footer_heading'];
		} else {
			$data['cosyone_footer_heading'] = $this->config->get('cosyone_footer_heading');
		}
		
		if (isset($this->request->post['cosyone_footer_links'])) {
			$data['cosyone_footer_links'] = $this->request->post['cosyone_footer_links'];
		} else {
			$data['cosyone_footer_links'] = $this->config->get('cosyone_footer_links');
		}
		
		if (isset($this->request->post['cosyone_footer_links_hover'])) {
			$data['cosyone_footer_links_hover'] = $this->request->post['cosyone_footer_links_hover'];
		} else {
			$data['cosyone_footer_links_hover'] = $this->config->get('cosyone_footer_links_hover');
		}
		
		$data['cosyone_company_info_icons_style_list'] = $this->language->get('cosyone_company_info_icons_style_list');
		if (isset($this->request->post['cosyone_company_info_icons_style'])) {
			$data['cosyone_company_info_icons_style'] = $this->request->post['cosyone_company_info_icons_style'];
		} else {
			$data['cosyone_company_info_icons_style'] = $this->config->get('cosyone_company_info_icons_style');
		}
		
		// Design options ends
		
		// Custom CSS starts
		$data['cosyone_use_custom_css_list'] = $this->language->get('cosyone_use_custom_css_list');
		
		if (isset($this->request->post['cosyone_use_custom_css'])) {
			$data['cosyone_use_custom_css'] = $this->request->post['cosyone_use_custom_css'];
		} else {
			$data['cosyone_use_custom_css'] = $this->config->get('cosyone_use_custom_css');
		}
		
		if (isset($this->request->post['cosyone_custom_css_content'])) {
			$data['cosyone_custom_css_content'] = $this->request->post['cosyone_custom_css_content'];
		} else {
			$data['cosyone_custom_css_content'] = $this->config->get('cosyone_custom_css_content');
		}
		// Custom CSS ends
		
		// Custom Javascript starts
		$data['cosyone_use_custom_javascript_list'] = $this->language->get('cosyone_use_custom_javascript_list');
		
		if (isset($this->request->post['cosyone_use_custom_javascript'])) {
			$data['cosyone_use_custom_javascript'] = $this->request->post['cosyone_use_custom_javascript'];
		} else {
			$data['cosyone_use_custom_javascript'] = $this->config->get('cosyone_use_custom_javascript');
		}
		
		if (isset($this->request->post['cosyone_custom_javascript_content'])) {
			$data['cosyone_custom_javascript_content'] = $this->request->post['cosyone_custom_javascript_content'];
		} else {
			$data['cosyone_custom_javascript_content'] = $this->config->get('cosyone_custom_javascript_content');
		}
		// Custom Javascript ends

		// Content ends
		
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/cosyone', 'token=' . $this->session->data['token'], true),
      		'separator' => ' :: '
   		);

		
		$data['action'] = $this->url->link('module/cosyone', 'token=' . $this->session->data['token'], true);
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/cosyone.tpl', $data));
	}
	
	
	public function install(){
		$this->load->model('setting/setting');
		$data = array(
			'shopme_header_style'			=> 'header1',
			'shopme_footer_columns'			=> 'col-xs-12',
			'shopme_menu_type'				=> 'default',
			'shopme_header_login'			=> 'enabled',
			'shopme_header_wishlist'		=> 'enabled',
			'shopme_header_compare'			=> 'enabled',
			'shopme_header_cart'			=> 'enabled',
			'shopme_header_search'			=> 'enabled',
			'shopme_refine_image_w'			=> '190',
			'shopme_refine_image_h'			=> '190',
			'shopme_category_thumb'			=> '0',
			'shopme_category_refine'		=> '0',
			'shopme_brands_per_row'			=> 'grid3',
			'shopme_brands_image_w'			=> '240',
			'shopme_brands_image_h'			=> '115',
			'shopme_default_view'			=> 'grid',
			'shopme_grid_category'			=> 'grid3',
			'shopme_grid_related'			=> 'grid3'
		);

		$this->model_setting_setting->editSetting('shopme', $data);

		$sql = " SHOW TABLES LIKE '" . DB_PREFIX . "blog' ";
		$query = $this->db->query( $sql );
		if( count($query->rows) <=0 ){ 
			
		$blog_data = array(
			'blogsetting_post_thumbs_h'			=>'471',	
			'blogsetting_post_thumbs_w'			=>'848',	
			'blogsetting_share'			=>'1',	
			'blogsetting_post_thumb'			=>'1',	
			'blogsetting_post_page_view'			=>'1',	
			'blogsetting_post_author'			=>'1',	
			'blogsetting_post_comments_count'			=>'1',	
			'blogsetting_post_date_added'			=>'1',	
			'blogsetting_author'			=>'1',	
			'blogsetting_page_view'			=>'1',	
			'blogsetting_comments_count'			=>'1',	
			'blogsetting_date_added'			=>'1',	
			'blogsetting_thumbs_h'			=>'471',	
			'blogsetting_thumbs_w'			=>'848',	
			'blogsetting_layout'			=>'1',	
			'blogsetting_blogs_per_page'			=>'5',	
			'blogsetting_rel_blog_per_row'			=>'2',	
			'blogsetting_rel_thumb'			=>'1',	
			'blogsetting_rel_thumbs_w'			=>'409',	
			'blogsetting_rel_thumbs_h'			=>'227',	
			'blogsetting_rel_characters'			=>'100',	
			'blogsetting_comment_per_page'			=>'5',	
			'blogsetting_comment_approve'			=>'1',	
			'blogsetting_comment_notification'			=>'1',	
			'blogsetting_author_change'			=>'1'
		);

		$this->model_setting_setting->editSetting('blogsetting', $blog_data);
			
		}
		
		//Add extra DB tables if needed
		$sql =	"CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "tab (
		`tab_id` int(11) NOT NULL AUTO_INCREMENT,
		`sort_order` int(3) NOT NULL,
		`status` tinyint(1) NOT NULL DEFAULT 1,
		`position` tinyint(1) NOT NULL DEFAULT 1,
		`show_empty` tinyint(1) NOT NULL DEFAULT 0,
		PRIMARY KEY (`tab_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin";
		$this->db->query($sql);
		
		$sql = 	"CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "tab_description (
		`tab_id` int(11) NOT NULL,
		`language_id` int(11) NOT NULL,
		`name` varchar(64) COLLATE utf8_bin NOT NULL,
		PRIMARY KEY (`tab_id`,`language_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin";
		$this->db->query($sql);
		
		$sql = 	"CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_tab (
		`product_id` int(11) NOT NULL,
		`tab_id` int(11) NOT NULL,
		`language_id` int(11) NOT NULL,
		`text` text NOT NULL,
		`position` tinyint(1),
		`show_empty` tinyint(1),
		PRIMARY KEY (`product_id`,`tab_id`,`language_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "question` ( ";
		$sql .= "`question_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql .= "`product_id` int(1) NOT NULL, ";
		$sql .= "`customer_id` int(11) NOT NULL, ";
		$sql .= "`author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`text` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`answer` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`status` tinyint(1) NOT NULL, ";
		$sql .= "`private` tinyint(1) NOT NULL DEFAULT '0', ";
		$sql .= "`notify` tinyint(1) NOT NULL DEFAULT '1', ";
		$sql .= "`date_added` datetime DEFAULT '0000-00-00 00:00:00', ";
		$sql .= "`date_modified` datetime DEFAULT '0000-00-00 00:00:00', ";
		$sql .= "PRIMARY KEY (`question_id`) ";
		$sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog` ( ";
		$sql .= "`blog_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql .= "`allow_comment` int(1) NOT NULL DEFAULT '1', ";
		$sql .= "`count_read` int(11) NOT NULL DEFAULT '0', ";
		$sql .= "`sort_order` int(3) NOT NULL, ";
		$sql .= "`status` int(1) NOT NULL DEFAULT '1', ";
		$sql .= "`author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "`date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00', ";
		$sql .= "`image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL, ";
		$sql .= "PRIMARY KEY (`blog_id`) ";
		$sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_category` ( ";
		$sql .= "`blog_category_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql .= "`parent_id` int(11) NOT NULL DEFAULT '0', ";
		$sql .= "`sort_order` int(3) NOT NULL DEFAULT '0', ";
		$sql .= "`date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00', ";
		$sql .= "`status` int(1) NOT NULL DEFAULT '1', ";
		$sql .= "PRIMARY KEY (`blog_category_id`) ";
		$sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=49 ; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_category_description` ( ";
		$sql .= "`blog_category_id` int(11) NOT NULL, ";
		$sql .= "`language_id` int(11) NOT NULL, ";
		$sql .= "`name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '', ";
		$sql .= "`page_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '', ";
		$sql .= "`meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL, ";
		$sql .= "`meta_description` varchar(255) COLLATE utf8_bin NOT NULL, ";
		$sql .= "`description` text COLLATE utf8_bin NOT NULL, ";
		$sql .= "PRIMARY KEY (`blog_category_id`,`language_id`), ";
		$sql .= "KEY `name` (`name`) ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_category_to_layout` ( ";
		$sql .= "`blog_category_id` int(11) NOT NULL, ";
		$sql .= "`store_id` int(11) NOT NULL, ";
		$sql .= "`layout_id` int(11) NOT NULL, ";
		$sql .= "PRIMARY KEY (`blog_category_id`,`store_id`) ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_category_to_store` ( ";
		$sql .= "`blog_category_id` int(11) NOT NULL, ";
		$sql .= "`store_id` int(11) NOT NULL, ";
		$sql .= "PRIMARY KEY (`blog_category_id`,`store_id`) ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_comment` ( ";
		$sql .= "`blog_comment_id` int(11) NOT NULL AUTO_INCREMENT, ";
		$sql .= "`blog_id` int(11) NOT NULL DEFAULT '0', ";
		$sql .= "`name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`date_added` datetime DEFAULT '0000-00-00 00:00:00', ";
		$sql .= "`status` int(1) NOT NULL DEFAULT '1', ";
		$sql .= "PRIMARY KEY (`blog_comment_id`) ";
		$sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_description` ( ";
		$sql .= "`blog_id` int(11) NOT NULL, ";
		$sql .= "`language_id` int(11) NOT NULL, ";
		$sql .= "`title` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`page_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`meta_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`short_description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, ";
		$sql .= "`tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_related` ( ";
		$sql .= "`parent_blog_id` int(11) NOT NULL DEFAULT '0', ";
		$sql .= "`child_blog_id` int(11) NOT NULL DEFAULT '0' ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=latin1; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_to_category` ( ";
		$sql .= "`blog_id` int(11) NOT NULL, ";
		$sql .= "`blog_category_id` int(11) NOT NULL, ";
		$sql .= "PRIMARY KEY (`blog_id`,`blog_category_id`) ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_to_layout` ( ";
		$sql .= "`blog_id` int(11) NOT NULL, ";
		$sql .= "`store_id` int(11) NOT NULL, ";
		$sql .= "`layout_id` int(11) NOT NULL, ";
		$sql .= "PRIMARY KEY (`blog_id`,`store_id`) ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin; ";
		$this->db->query($sql);
		
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_to_store` ( ";
		$sql .= "`blog_id` int(11) NOT NULL, ";
		$sql .= "`store_id` int(11) NOT NULL ";
		$sql .= ") ENGINE=MyISAM DEFAULT CHARSET=latin1; ";
		$this->db->query($sql);
		
		
		$sql = "SELECT * FROM " . DB_PREFIX . "layout WHERE name = 'Blog'";
		$query = $this->db->query( $sql );
		if( count($query->rows) <=0 ){ 
			$sql  = "INSERT INTO  `" . DB_PREFIX . "layout` ( `layout_id` , `name` ) VALUES ( NULL , 'Blog' ); ";
			$query = $this->db->query( $sql );
			$id = $this->db->getLastId();
			$sql = "INSERT INTO `".DB_PREFIX."layout_route` (
						`layout_route_id` ,
						`layout_id` ,
						`store_id` ,
						`route`
						)
						VALUES (
						NULL , '".$id."', '0', 'blog/%');
				";
				$query = $this->db->query( $sql );
		}
		
		$sql = "SELECT * FROM " . DB_PREFIX . "layout WHERE name = 'Footer'";
		$query = $this->db->query( $sql );
		if( count($query->rows) <=0 ){ 
			$sql  = "INSERT INTO  `" . DB_PREFIX . "layout` ( `layout_id` , `name` ) VALUES ( NULL , 'Footer' ); ";
			$query = $this->db->query( $sql );
		}
		
	} // Install ends
	
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/cosyone')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>