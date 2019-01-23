<?php
class ControllerModuleDAjaxSearch extends Controller {
	private $error = array(); 
	
	public function index() {
		$this->load->language('module/d_ajax_search');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		$this->load->model('design/layout');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('d_ajax_search', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}

        $data['token'] =  $this->session->data['token'];
		$data['module_link'] = $this->url->link($this->route, 'token=' . $this->session->data['token'], true);
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_module'] = $this->language->get('text_module');
		
		$data['entry_search_on_off'] = $this->language->get('entry_search_on_off');
		$data['entry_search_width'] = $this->language->get('entry_search_width');
		$data['entry_search_max_symbols'] = $this->language->get('entry_search_max_symbols');
		$data['entry_search_max_results'] = $this->language->get('entry_search_max_results');
		$data['entry_search_first_sybmols'] = $this->language->get('entry_search_first_sybmols');
		$data['entry_search_priority'] = $this->language->get('entry_search_priority');
		$data['entry_search_price'] = $this->language->get('entry_search_price');
		$data['entry_search_special'] = $this->language->get('entry_search_special');
		$data['entry_search_tax'] = $this->language->get('entry_search_tax');
		
		$data['text_on'] = $this->language->get('text_on');
		$data['text_product'] = $this->language->get('text_product');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_information'] = $this->language->get('text_information');
		$data['text_type'] = $this->language->get('text_type');
		$data['text_sort_order'] = $this->language->get('text_sort_order');
		
		$data['tooltip_search_width'] = $this->language->get('tooltip_search_width');
		$data['tooltip_search_max_symbols'] = $this->language->get('tooltip_search_max_symbols');
		$data['tooltip_search_max_results'] = $this->language->get('tooltip_search_max_results');
		$data['tooltip_search_on_off'] = $this->language->get('tooltip_search_on_off');
		$data['tooltip_general_version'] = $this->language->get('tooltip_general_version');
		$data['tooltip_search_class'] = $this->language->get('tooltip_search_class');
		$data['tooltip_search_first_symbols'] = $this->language->get('tooltip_search_first_symbols');
		$data['tooltip_search_priority'] = $this->language->get('tooltip_search_priority');
		
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/d_ajax_search', 'token=' . $this->session->data['token'], true),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('module/d_ajax_search', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);
		
		
		if (isset($this->request->post['d_ajax_search'])) {
			$data['d_ajax_search'] = $this->request->post['d_ajax_search'];
		} elseif($this->model_setting_setting->getSetting('d_ajax_search')){
			$data['d_ajax_search'] = $this->model_setting_setting->getSetting('d_ajax_search');
			$data['d_ajax_search'] = $data['d_ajax_search']['d_ajax_search'];
		}else{
			$data['d_ajax_search'] = '';
		}
		
		if (isset($this->request->post['d_ajax_search_status'])) {
			$data['d_ajax_search_status'] = $this->request->post['d_ajax_search_status'];
		} else {
			$data['d_ajax_search_status'] = $this->config->get('d_ajax_search_status');
		}

		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/d_ajax_search.tpl', $data));
		
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/d_ajax_search')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
}