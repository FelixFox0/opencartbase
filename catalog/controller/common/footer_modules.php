<?php
class ControllerCommonFooterModules extends Controller {
	public function index() {
		$this->load->model('design/layout');
		$data['cosyone_footer_columns'] = $this->config->get('cosyone_footer_columns');

		$layout_id = $this->model_design_layout->getLayoutForAllPages();
		$this->load->model('extension/module');
		
		$data['modules'] = array();		

		$modules = $this->model_design_layout->getLayoutModules($layout_id, 'footer');
		
		foreach ($modules as $module) {

			$part = explode('.', $module['code']);
			
			if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
				$data['modules'][] = $this->load->controller('module/' . $part[0]);
			}
			
			if (isset($part[1])) {
				$setting_info = $this->model_extension_module->getModule($part[1]);
				
				if ($setting_info && $setting_info['status']) {
					$data['modules'][] = $this->load->controller('module/' . $part[0], $setting_info);
				}
			}
		}

		return $this->load->view('common/footer_modules', $data);
	}
}