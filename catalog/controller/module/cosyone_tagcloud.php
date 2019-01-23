<?php
class ControllerModuleCosyoneTagcloud extends Controller {
	public function index() {
		
		$this->load->model('localisation/language');
		$this->load->model('module/cosyone_tagcloud');
		
		$title = $this->config->get('cosyone_tagcloud_title');
		if(empty($title[$this->config->get('config_language_id')])) {
			$data['module_title'] = false;
		} else if (isset($title[$this->config->get('config_language_id')])) {
			$data['module_title'] = html_entity_decode($title[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		}
	
		$data['limit'] = $this->config->get('cosyone_tagcloud_limit');	
		
		$data['tagcloud'] = $this->model_module_cosyone_tagcloud->getRandomTags(array(
			'limit'   => (int)$data['limit']
		));
			
       return $this->load->view('module/cosyone_tagcloud', $data);
		
	}
}