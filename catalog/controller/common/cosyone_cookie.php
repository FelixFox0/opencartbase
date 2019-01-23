<?php 
class ControllerCommonCosyoneCookie extends Controller {
	public function index() {
		
		// Cookie Control
		$data['cosyone_use_cookie'] = $this->config->get('cosyone_use_cookie');
		
		$cosyone_cookie_text = $this->config->get('cosyone_cookie_text');
		if(empty($cosyone_cookie_text[$this->language->get('code')])) {
			$data['cosyone_cookie_message'] = false;
		} else if (isset($cosyone_cookie_text[$this->language->get('code')])) {
			$data['cosyone_cookie_message'] = html_entity_decode($cosyone_cookie_text[$this->language->get('code')], ENT_QUOTES, 'UTF-8');
		}
		
		$cosyone_cookie_button_readmore = $this->config->get('cosyone_cookie_button_readmore');
		if(empty($cosyone_cookie_button_readmore[$this->language->get('code')])) {
			$data['cosyone_readmore_text'] = false;
		} else if (isset($cosyone_cookie_button_readmore[$this->language->get('code')])) {
			$data['cosyone_readmore_text'] = html_entity_decode($cosyone_cookie_button_readmore[$this->language->get('code')], ENT_QUOTES, 'UTF-8');
		}
		
		$cosyone_cookie_button_accept = $this->config->get('cosyone_cookie_button_accept');
		if(empty($cosyone_cookie_button_accept[$this->language->get('code')])) {
			$data['cosyone_button_accept_text'] = false;
		} else if (isset($cosyone_cookie_button_accept[$this->language->get('code')])) {
			$data['cosyone_button_accept_text'] = html_entity_decode($cosyone_cookie_button_accept[$this->language->get('code')], ENT_QUOTES, 'UTF-8');
		}
		
		$data['cosyone_readmore_url'] = $this->config->get('cosyone_readmore_url');
		
		// Old IE check
		$data['cosyone_use_ie'] = $this->config->get('cosyone_use_ie');
		
		$cosyone_ie_update_text = $this->config->get('cosyone_ie_update_text');
		if(empty($cosyone_ie_update_text[$this->language->get('code')])) {
			$data['cosyone_ie_update_message'] = false;
		} else if (isset($cosyone_ie_update_text[$this->language->get('code')])) {
			$data['cosyone_ie_update_message'] = html_entity_decode($cosyone_ie_update_text[$this->language->get('code')], ENT_QUOTES, 'UTF-8');
		}

		$cosyone_ie_text = $this->config->get('cosyone_ie_text');
		if(empty($cosyone_ie_text[$this->language->get('code')])) {
			$data['cosyone_ie_message'] = false;
		} else if (isset($cosyone_ie_text[$this->language->get('code')])) {
			$data['cosyone_ie_message'] = html_entity_decode($cosyone_ie_text[$this->language->get('code')], ENT_QUOTES, 'UTF-8');
		}
		
		$data['cosyone_ie_url'] = $this->config->get('cosyone_ie_url');
		
		return $this->load->view('common/cosyone_cookie', $data);
	}
	public function info() {
		$this->response->setOutput($this->index());
	}
}