<?php 
class ControllerModuleCosyoneFeatures extends Controller {
	public function index() {
		
		
		// Custom CSS
		$data['custom_css'] = $this->config->get('cosyone_use_custom_css');
		$data['custom_css_content'] = html_entity_decode(($this->config->get('cosyone_custom_css_content')), ENT_QUOTES, 'UTF-8');
		
		// Custom Javascript
		$data['custom_javascript'] = $this->config->get('cosyone_use_custom_javascript');
		$data['custom_javascript_content'] = html_entity_decode(($this->config->get('cosyone_custom_javascript_content')), ENT_QUOTES, 'UTF-8');
		
		// Custom style
		$data['custom_style'] = $this->config->get('cosyone_use_custom');
		
		$data['cosyone_custom_bg_icon'] = $this->config->get('cosyone_custom_bg_icon');
		$data['cosyone_body_image'] = $this->config->get('cosyone_body_image');
		$data['cosyone_body_background'] = $this->config->get('cosyone_body_background');
		$data['cosyone_top_border_background'] = $this->config->get('cosyone_top_border_background');
		$data['cosyone_top_border_border'] = $this->config->get('cosyone_top_border_border');
		$data['cosyone_top_border_text'] = $this->config->get('cosyone_top_border_text');
		$data['cosyone_top_border_link'] = $this->config->get('cosyone_top_border_link');
		$data['cosyone_top_border_link_hover'] = $this->config->get('cosyone_top_border_link_hover');
		$data['cosyone_shortcut_separator'] = $this->config->get('cosyone_shortcut_separator');
		$data['cosyone_menu_background'] = $this->config->get('cosyone_menu_background');
		$data['cosyone_menu_link_color'] = $this->config->get('cosyone_menu_link_color');
		$data['cosyone_menu_link_color_hover'] = $this->config->get('cosyone_menu_link_color_hover');
		$data['cosyone_menu_link_background_hover'] = $this->config->get('cosyone_menu_link_background_hover');
		$data['cosyone_primary_color'] = $this->config->get('cosyone_primary_color');
		$data['cosyone_secondary_color'] = $this->config->get('cosyone_secondary_color');
		$data['cosyone_offer_color'] = $this->config->get('cosyone_offer_color');
		$data['cosyone_link_hover_color'] = $this->config->get('cosyone_link_hover_color');
		$data['cosyone_salebadge_background'] = $this->config->get('cosyone_salebadge_background');
		$data['cosyone_price_color'] = $this->config->get('cosyone_price_color');
		$data['cosyone_icons_background_hover'] = $this->config->get('cosyone_icons_background_hover');
		$data['cosyone_button_background'] = $this->config->get('cosyone_button_background');
		$data['cosyone_button_color'] = $this->config->get('cosyone_button_color');
		$data['cosyone_button_border'] = $this->config->get('cosyone_button_border');
		$data['cosyone_button_hover_background'] = $this->config->get('cosyone_button_hover_background');
		$data['cosyone_button_hover_color'] = $this->config->get('cosyone_button_hover_color');
		$data['cosyone_button_hover_border'] = $this->config->get('cosyone_button_hover_border');
		$data['cosyone_button2_background'] = $this->config->get('cosyone_button2_background');
		$data['cosyone_button2_color'] = $this->config->get('cosyone_button2_color');
		$data['cosyone_button2_border'] = $this->config->get('cosyone_button2_border');
		$data['cosyone_button2_hover_background'] = $this->config->get('cosyone_button2_hover_background');
		$data['cosyone_button2_hover_color'] = $this->config->get('cosyone_button2_hover_color');
		$data['cosyone_button2_hover_border'] = $this->config->get('cosyone_button2_hover_border');
		
		
		// Custom fonts
		$data['custom_style_font'] = $this->config->get('cosyone_use_custom_font');
			
		if ($data['custom_style_font']) {
			// http://fonts.googleapis.com/css?family=Exo:300,400,700' rel='stylesheet' type='text/css
			$this->document->addStyle('//fonts.googleapis.com/css?' . $this->config->get('config_template'));
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/carousel.css');
		}
		
		    $this->children = array(
        'common/header'
    ); 
		
		return $this->load->view('common/cosyone_features', $data);
		
	}
	public function info() {
		$this->response->setOutput($this->index());
	}
}