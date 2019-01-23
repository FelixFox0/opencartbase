<?php
class ControllerModuleCosyoneTestimonial extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/cosyone_testimonial');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('cosyone_testimonial', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_character_limit'] = $this->language->get('entry_character_limit');
		$data['entry_random'] = $this->language->get('entry_random');
		$data['help_random'] = $this->language->get('help_random');
		$data['entry_carousel'] = $this->language->get('entry_carousel');
		$data['entry_links'] = $this->language->get('entry_links');
		$data['help_links'] = $this->language->get('help_links');
		$data['entry_columns'] = $this->language->get('entry_columns');
		$data['entry_contrast'] = $this->language->get('entry_contrast');
		$data['help_contrast'] = $this->language->get('help_contrast');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['to_list'] = $this->language->get('to_list');
		
		$data['to_list_link'] = $this->url->link('catalog/testimonial', 'token=' . $this->session->data['token'], true);

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/cosyone_testimonial', 'token=' . $this->session->data['token'], true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/cosyone_testimonial', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('module/cosyone_testimonial', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['testimonial_title'])) {
			$data['testimonial_title'] = $this->request->post['testimonial_title'];
		} elseif (!empty($module_info)) {
			$data['testimonial_title'] = $module_info['testimonial_title'];
		} else {
			$data['testimonial_title'] = '';
		}
		
		
		
		if (isset($this->request->post['testimonial_random'])) {
		$data['testimonial_random'] = $this->request->post['testimonial_random'];
		} elseif (!empty($module_info['testimonial_random'])) {
		$data['testimonial_random'] = $module_info['testimonial_random'];
		} else {

		}
							
		
		if (isset($this->request->post['testimonial_carousel'])) {
			$data['testimonial_carousel'] = $this->request->post['testimonial_carousel'];
		} elseif (!empty($module_info['testimonial_carousel'])) {
			$data['testimonial_carousel'] = $module_info['testimonial_carousel'];
		} else {
			
		}

		if (isset($this->request->post['testimonial_links'])) {
			$data['testimonial_links'] = $this->request->post['testimonial_links'];
		} elseif (!empty($module_info['testimonial_links'])) {
			$data['testimonial_links'] = $module_info['testimonial_links'];
		} else {
			
		}
			
		if (isset($this->request->post['testimonial_columns'])) {
			$data['testimonial_columns'] = $this->request->post['testimonial_columns'];
		} elseif (!empty($module_info)) {
			$data['testimonial_columns'] = $module_info['testimonial_columns'];
		} else {
			$data['testimonial_columns'] = 'grid3';
		}
		
		
		if (isset($this->request->post['testimonial_contrast'])) {
			$data['testimonial_contrast'] = $this->request->post['testimonial_contrast'];
		} elseif (!empty($module_info['testimonial_contrast'])) {
			$data['testimonial_contrast'] = $module_info['testimonial_contrast'];
		} else {
			
		}
		
		
		if (isset($this->request->post['testimonial_character_limit'])) {
			$data['testimonial_character_limit'] = $this->request->post['testimonial_character_limit'];
		} elseif (!empty($module_info)) {
			$data['testimonial_character_limit'] = $module_info['testimonial_character_limit'];
		} else {
			$data['testimonial_character_limit'] = 190;
		}
		
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['testimonial_limit'])) {
			$data['testimonial_limit'] = $this->request->post['testimonial_limit'];
		} elseif (!empty($module_info)) {
			$data['testimonial_limit'] = $module_info['testimonial_limit'];
		} else {
			$data['testimonial_limit'] = 5;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		
				
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/cosyone_testimonial.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/cosyone_testimonial')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
	
	public function install() {
		$this->load->model('catalog/testimonial');
		$this->model_catalog_testimonial->createDatabaseTables();
		
		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'catalog/testimonial ');
		$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'catalog/testimonial ');
	}

	public function uninstall() {

		$this->load->model('catalog/testimonial');
		$this->model_catalog_testimonial->dropDatabaseTables();
	}
}
