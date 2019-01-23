<?php
class ControllerModuleCosyoneTwitterfeed extends Controller {
	public function index() {
		
		$this->document->addScript('catalog/view/theme/cosyone/js/tweetfeed.min.js');
		
		$title = $this->config->get('cosyone_twitterfeed_title');
		if(empty($title[$this->config->get('config_language_id')])) {
			$data['module_title'] = false;
		} else if (isset($title[$this->config->get('config_language_id')])) {
			$data['module_title'] = html_entity_decode($title[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		}
		
		$data['widget_id'] = $this->config->get('cosyone_twitterfeed_widget_id');
		
		$data['limit'] = $this->config->get('cosyone_twitterfeed_limit');
			
       return $this->load->view('module/cosyone_twitterfeed', $data);
			
	}
}