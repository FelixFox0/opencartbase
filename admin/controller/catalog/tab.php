<?php
/*
	This is an update of the previous extension for Opencart 2.0.1. Use it how you want, both personally and commercial.
	
	License: GNU General Public License

	----------------------------ORIGINAL INFORMATION------------------------------
  Name:		Extra Product Tabs Opencart Extension
  
  Version: 1.0.4

  OpenCart:	Version 1.5.4.1, 1.5.4.1

  Author: 	rebdog (Godfrey Livinsgtone godfrey@satelliteshop.co.nz)

  Copyright 2012, 2013

*/

class ControllerCatalogTab extends Controller {
	private $error = array();

	public function index() {

		//Add extra DB tables if needed
		$sql =	"CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "tab (
							`tab_id` int(11) NOT NULL AUTO_INCREMENT,
							`sort_order` int(3) NOT NULL,
							`status` tinyint(1) NOT NULL DEFAULT 1,
							`position` tinyint(1) NOT NULL DEFAULT 1,
							`show_empty` tinyint(1) NOT NULL DEFAULT 0,
							PRIMARY KEY (`tab_id`)
						) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin";

		$this->db->query($sql);

		$sql = 	"CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "tab_description (
							`tab_id` int(11) NOT NULL,
							`language_id` int(11) NOT NULL,
							`name` varchar(64) COLLATE utf8_bin NOT NULL,
							PRIMARY KEY (`tab_id`,`language_id`)
						) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin";

		$this->db->query($sql);

		$sql = 	"CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_tab (
							`product_id` int(11) NOT NULL,
							`tab_id` int(11) NOT NULL,
							`language_id` int(11) NOT NULL,
							`text` text NOT NULL,
							`position` tinyint(1),
							`show_empty` tinyint(1),
							PRIMARY KEY (`product_id`,`tab_id`,`language_id`)
						) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin";

		$this->db->query($sql);

		$this->load->language('catalog/tab');

		$this->document->setTitle($this->language->get('text_product_tab'));

		$this->load->model('catalog/tab');

		$this->getList();
	}

	public function insert() {

		$this->load->language('catalog/tab');

		$this->document->setTitle($this->language->get('text_product_tab'));

		$this->load->model('catalog/tab');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
					$this->model_catalog_tab->addTab($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->response->redirect($this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url, true));

		}

		$this->getForm();
	}

	public function update() {

		$this->load->language('catalog/tab');

		$this->document->setTitle($this->language->get('text_product_tab'));

		$this->load->model('catalog/tab');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_tab->editTab($this->request->get['tab_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url, true));

		}

		$this->getForm();
	}

	public function delete() {

		$this->load->language('catalog/tab');

		$this->document->setTitle($this->language->get('text_product_tab'));

		$this->load->model('catalog/tab');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {

			foreach ($this->request->post['selected'] as $tab_id) {
				$this->model_catalog_tab->deleteTab($tab_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	private function getList() {

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		

		$data['product_tabs'] = array();
		
		
		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$product_tab_total = $this->model_catalog_tab->getTotalTabs();

		$results = $this->model_catalog_tab->getTabs($data);
		
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_product_tab'),
			'href'      => $this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url, true)
		);
		

		$data['insert'] = $this->url->link('catalog/tab/insert', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('catalog/tab/delete', 'token=' . $this->session->data['token'] . $url, true);
		

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/tab/update', 'token=' . $this->session->data['token'] . '&tab_id=' . $result['tab_id'] . $url, true)
			);

			$data['product_tabs'][] = array(
				'tab_id' 			=> $result['tab_id'],
				'name'              => $result['name'],
				'sort_order'        => $result['sort_order'],
				'selected'          => isset($this->request->post['selected']) && in_array($result['tab_id'], $this->request->post['selected']),
				'action'            => $action
			);

		}

		$data['text_product_tab'] = $this->language->get('text_product_tab');

		$data['text_no_results'] = $this->language->get('text_no_results');
		
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add_tab'] = $this->language->get('button_add_tab');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['tab_button_edit'] = $this->language->get('tab_button_edit');
		
		
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

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . '&sort=agd.name' . $url, true);
		$data['sort_sort_order'] = $this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . '&sort=ag.sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $product_tab_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();
		
		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_tab_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_tab_total - $this->config->get('config_limit_admin'))) ? $product_tab_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_tab_total, ceil($product_tab_total / $this->config->get('config_limit_admin')));		

		$data['sort'] = $sort;
		$data['order'] = $order;
		
		
		$data['insert'] = $this->url->link('catalog/tab/insert', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('catalog/tab/delete', 'token=' . $this->session->data['token'] . $url, true);
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/tab_list.tpl', $data));
	}
	
	

	private function getForm() {
		$data['text_product_tab'] 		= $this->language->get('text_product_tab');

		$data['entry_tab_name'] 			= $this->language->get('entry_tab_name');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] 		= $this->language->get('entry_status');
		$data['entry_position'] 	= $this->language->get('entry_position');
		$data['entry_show_empty'] = $this->language->get('entry_show_empty');

		$data['text_disabled'] 		= $this->language->get('text_disabled');
		$data['text_enabled'] 		= $this->language->get('text_enabled');
		$data['text_yes'] 				= $this->language->get('text_yes');
		$data['text_no'] 					= $this->language->get('text_no');

		$data['button_save'] 			= $this->language->get('button_save');
		$data['button_cancel'] 		= $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true)
			);

			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_product_tab'),
				'href'      => $this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url, true)
			);

		if (!isset($this->request->get['tab_id'])) {
			$data['action'] = $this->url->link('catalog/tab/insert', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('catalog/tab/update', 'token=' . $this->session->data['token'] . '&tab_id=' . $this->request->get['tab_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['tab_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$product_tab_info = $this->model_catalog_tab->getTab($this->request->get['tab_id']);
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['product_tab_description'])) {
			$data['product_tab_description'] = $this->request->post['product_tab_description'];
		} elseif (isset($this->request->get['tab_id'])) {
			$data['product_tab_description'] = $this->model_catalog_tab->getTabDescriptions($this->request->get['tab_id']);
		} else {
			$data['product_tab_description'] = array();
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($product_tab_info)) {
			$data['sort_order'] = $product_tab_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}

		$data['insert_positions'] = array();

		$data['insert_positions'][] = array(
																					'position_number'	=> '1',
																					'description' 		=>	$this->language->get('text_position_1')
																				);

		$data['insert_positions'][]	=	array(
																					'position_number'	=> '2',
																					'description' 		=>	$this->language->get('text_position_2')
																				);

		$data['insert_positions'][]	= array(
																					'position_number'	=> '3',
																					'description' 		=>	$this->language->get('text_position_3')
																				);

		$data['insert_positions'][]	= array(
																					'position_number'	=> '4',
																					'description' 		=>	$this->language->get('text_position_4')
																				);

		$data['insert_positions'][] = array(
																					'position_number' => '5',
																					'description' 		=>	$this->language->get('text_position_5')
																				);

		if (isset($this->request->post['position'])) {
			$data['position'] = $this->request->post['position'];
		} elseif (!empty($product_tab_info)) {
			$data['position'] = $product_tab_info['position'];
		} else {
			$data['position'] = '5';  // Default After All System Tabs
		}

		if (isset($this->request->post['show_empty'])) {
			$data['show_empty'] = $this->request->post['show_empty'];
		} elseif (!empty($product_tab_info)) {
			$data['show_empty'] = $product_tab_info['show_empty'];
		} else {
			$data['show_empty'] = '0';  // Default to not show empty
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($product_tab_info)) {
			$data['status'] = $product_tab_info['status'];
		} else {
			$data['status'] = '1';  // Enabled
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/tab_form.tpl', $data));
		
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/tab')) {
				$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['product_tab_description'] as $language_id => $value) {
				if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 64)) {
					$this->error['name'][$language_id] = $this->language->get('error_name');
				}
		}

		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  }

  private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/tab')) {
					$this->error['warning'] = $this->language->get('error_permission');
			}


		return !$this->error;
	}
	
	
	
	
	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/tab');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_tab->getTabs($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'tab_id'    => $result['tab_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	
	
}