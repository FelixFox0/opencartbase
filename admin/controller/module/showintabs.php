<?php 
class ControllerModuleShowintabs extends Controller {
	private $error = array(); 

	public function index() {
		$this->load->language('module/showintabs');
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/module');
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('showintabs', $this->request->post);	
			
			if (isset($this->request->post['save']) && $this->request->post['save'] == 'stay') {
				$this->session->data['success'] = $this->language->get('text_success');
				$this->response->redirect($this->url->link('module/showintabs', 'token=' . $this->session->data['token'], true)); 
			}
				
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}
		

		//Textos		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_success'] = $this->language->get('text_success');
		$data['text_enable'] = $this->language->get('text_enable');
		$data['text_disable'] = $this->language->get('text_disable');
		$data['text_module'] = $this->language->get('text_module');
		$data['text_tab'] = $this->language->get('text_tab');
		
		$data['text_notitle'] = $this->language->get('text_notitle');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$data['text_best_seller'] = $this->language->get('text_best_seller');
		$data['text_latest_products'] = $this->language->get('text_latest_products');
		$data['text_special_products'] = $this->language->get('text_special_products');
		$data['text_popular_products'] = $this->language->get('text_popular_products');
		
		$data['text_all_categories'] = $this->language->get('text_all_categories');
		$data['text_all_manufacturer'] = $this->language->get('text_all_manufacturer');
		$data['text_sort_name'] = $this->language->get('text_sort_name');
		$data['text_sort_rating'] = $this->language->get('text_sort_rating');
		$data['text_sort_sort_order'] = $this->language->get('text_sort_sort_order');
		$data['text_sort_added'] = $this->language->get('text_sort_added');
		$data['text_sort_price'] = $this->language->get('text_sort_price');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_products'] = $this->language->get('entry_products');
		$data['entry_show_tabs'] = $this->language->get('entry_show_tabs');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_filter'] = $this->language->get('entry_filter');
		$data['entry_sort_query'] = $this->language->get('entry_sort_query');
		$data['entry_group'] = $this->language->get('entry_group');
		
		$data['entry_source'] = $this->language->get('entry_source');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['button_save_exit'] = $this->language->get('button_save_exit');
		$data['button_save_stay'] = $this->language->get('button_save_stay');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_tab'] = $this->language->get('button_add_tab');
		$data['button_add_module'] = $this->language->get('button_add_module');
		$data['button_remove'] = $this->language->get('button_remove');
		
		$data['header_tabs'] = $this->language->get('header_tabs');
		$data['header_configuration'] = $this->language->get('header_configuration');
		$data['header_products_select'] = $this->language->get('header_products_select');
		
		$data['header_predefined_groups'] = $this->language->get('header_predefined_groups');
		$data['header_custom_query'] = $this->language->get('header_custom_query');
		$data['error_permission'] = $this->language->get('error_permission');

		

		 
		//Comprobacion de errores
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
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
				'href' => $this->url->link('module/showintabs', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/showintabs', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);			
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/showintabs', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('module/showintabs', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}
				
		//Links y actions
		//$data['action'] = $this->url->link('module/showintabs', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);
		$data['token'] = $this->session->data['token'];
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		//Datos de configuracion
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
		
		
		
		//
		
		
		
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
		//Layouts
		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();

		//idiomas
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();

		//idioma del admin
		$data['language_admin_id']  = $this->config->get('config_language_id');

		//Categories
		$this->load->model('catalog/category');

		$data['categories'] = $this->model_catalog_category->getCategories(array());

		//Manufacturers
		$this->load->model('catalog/manufacturer');

		$data['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers(array());

		
		
		// General
		
		
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/showintabs.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/showintabs')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		return !$this->error;
	}

	//Para autocompletar custom
	public function autocomplete() {
		$json = array();
		
		if ( isset($this->request->get['filter_name']) ) {
			$this->load->model('catalog/product');

			$data = array(
				'filter_name'  => $this->request->get['filter_name'],
				'start'        => 0,
				'limit'        => 20
			);
			
			$results = $this->model_catalog_product->getProducts($data);

			foreach ($results as $result) {
				$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),	
					'model'      => $result['model']
				);	
			}
		}
		$this->response->setOutput(json_encode($json));
	}
}