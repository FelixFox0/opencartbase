<?php
class ControllerModuleCosyoneContent extends Controller {
	public function index($setting) {
		
		if(empty($setting['module_title'][$this->config->get('config_language_id')])) {
			$data['module_title'] = false;
		} else if (isset($setting['module_title'][$this->config->get('config_language_id')])) {
			$data['module_title'] = html_entity_decode($setting['module_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		}
		
		
		$data['template'] = $setting['template'];
		$data['columns'] = $setting['columns'];
		
		if (isset($setting['sections'])) {        
            $data['sections'] = array();

            $section_row = 0;
            
            foreach($setting['sections'] as $section) {

                if (isset($section['title'][$this->config->get('config_language_id')])){
                    $title = html_entity_decode($section['title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
                } else {
                    $title = false;
                }
				
				if (isset($section['block'][$this->config->get('config_language_id')])){
                    $block = html_entity_decode($section['block'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
                } else {
                    $block = false;
                }

                $section_row++;

                $data['sections'][] = array(
                    'index'   => $section_row,
                    'title'   => $title,
					'description'   => $block

                );
            }
			return $this->load->view('module/cosyone_content', $data);
		}
	}
}