<?php
class ControllerModuleCosyoneBanner extends Controller {
	public function index($setting) {
		
		
		if(empty($setting['module_title'][$this->config->get('config_language_id')])) {
			$data['module_title'] = false;
		} else if (isset($setting['module_title'][$this->config->get('config_language_id')])) {
			$data['module_title'] = html_entity_decode($setting['module_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		}
		
		$data['columns'] = $setting['columns'];
		
		if (isset($setting['sections'])) {        
            $data['sections'] = array();

            $section_row = 0;
            
            foreach($setting['sections'] as $section) {
                $this->load->model('tool/image');

                if (isset($section['block'][$this->config->get('config_language_id')])){
                    $block = html_entity_decode($section['block'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
                } else {
                    $block = false;
                }
				
				if (isset($section['thumb_image'])){
				$image = 'image/' . $section['thumb_image'];
				} else {
				$image = false;
				}


                $section_row++;

                $data['sections'][] = array(
                    'index'   => $section_row,
                    'description'   => $block,
					'image' => $image
                );
            }
		
			return $this->load->view('module/cosyone_banner', $data);
		}
	}
}