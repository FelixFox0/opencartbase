<?php
class Controllermoduleshowintabsoutput extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/showintabs_output');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('showintabs_output', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_limit_help'] = $this->language->get('entry_limit_help');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_tabs'] = $this->language->get('entry_tabs');
		$data['entry_tabs_help'] = $this->language->get('entry_tabs_help');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['text_grid5'] = $this->language->get('text_grid5');
		$data['text_grid4'] = $this->language->get('text_grid4');
		$data['text_grid3'] = $this->language->get('text_grid3');
		$data['text_grid2'] = $this->language->get('text_grid2');
		$data['text_grid1'] = $this->language->get('text_grid1');
		$data['entry_carousel'] = $this->language->get('entry_carousel');
		$data['entry_columns'] = $this->language->get('entry_columns');

		
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

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/showintabs_output', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/showintabs_output', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);			
		}
		
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/showintabs_output', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('module/showintabs_output', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = '8';
		}
		
		if (isset($this->request->post['image_width'])) {
			$data['image_width'] = $this->request->post['image_width'];
		} elseif (!empty($module_info)) {
			$data['image_width'] = $module_info['image_width'];
		} else {
			$data['image_width'] = '200';
		}
		
		if (isset($this->request->post['image_height'])) {
			$data['image_height'] = $this->request->post['image_height'];
		} elseif (!empty($module_info)) {
			$data['image_height'] = $module_info['image_height'];
		} else {
			$data['image_height'] = '200';
		}
		
		if (isset($this->request->post['selected_tabs'])) {
			$data['selected_tabs'] = $this->request->post['selected_tabs'];
		} elseif (!empty($module_info['selected_tabs'])) {
			$data['selected_tabs'] = $module_info['selected_tabs'];
		} else {
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		if (isset($this->request->post['columns'])) {
			$data['columns'] = $this->request->post['columns'];
		} elseif (!empty($module_info)) {
			$data['columns'] = $module_info['columns'];
		} else {
			$data['columns'] = 'grid4';
		}
		
		if (isset($this->request->post['carousel'])) {
			$data['carousel'] = $this->request->post['carousel'];
		} elseif (!empty($module_info)) {
			$data['carousel'] = $module_info['carousel'];
		} else {
			$data['carousel'] = '';
		}
		
		//Tabs
		$data['tabs'] = array();

		if (isset($this->request->post['showintabs_tab'])) {
			$data['tabs'] = $this->request->post['showintabs_tab'];
		} elseif ($this->config->get('showintabs_tab')) { 
			$data['tabs'] = $this->config->get('showintabs_tab');
		}	

		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		
		//Ordenamos las pestañas 
		ksort($data['tabs']);

		//Completamos info de pestañas de cada pestaña
		foreach( $data['tabs'] as $keyTab => $tab ){
			//Preparamos title de pestañas
			if(isset($data['tabs'][$keyTab]['title'][$this->config->get('config_language_id')]) && $data['tabs'][$keyTab]['title'][$this->config->get('config_language_id')] != ''){
				$data['tabs'][$keyTab]['tab_title'] = $data['tabs'][$keyTab]['title'][$this->config->get('config_language_id')];
			}else{
				$data['tabs'][$keyTab]['tab_title'] = $this->language->get('text_tab') . $keyTab . $this->language->get('text_notitle');
			}
			//Preparamos datos productos
			if(isset($tab['products'])){
				foreach ( $tab['products'] as $value ) {
					$product_info = $this->model_catalog_product->getProduct($value['product_id']);
					
					if ($product_info) {			
						$data['tabs'][$keyTab]['products'][$value['product_id']] = array(
							'product_id'    => $value['product_id'],
							'name'          => $product_info['name'],
							'model'         => $product_info['model'],
						);
					}
				}
			}
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

		$this->response->setOutput($this->load->view('module/showintabs_output.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/showintabs_output')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		return !$this->error;
	}
}