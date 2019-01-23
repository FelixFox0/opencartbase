<?php
class ControllerModuleCosyoneCarousel extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		if(empty($setting['title'][$this->config->get('config_language_id')])) {
			$data['title'] = false;
		} else if (isset($setting['title'][$this->config->get('config_language_id')])) {
			$data['title'] = html_entity_decode($setting['title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		}
		
		$data['columns'] = $setting['grid'];
		
		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$data['module'] = $module++;

		return $this->load->view('module/cosyone_carousel', $data);
		
	}
}