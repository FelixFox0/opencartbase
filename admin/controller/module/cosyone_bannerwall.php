<?php
class ControllerModuleCosyoneBannerwall extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/cosyone_bannerwall');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');
		
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('cosyone_bannerwall', $this->request->post);
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
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['text_image1'] = $this->language->get('text_image1');
		$data['text_image2'] = $this->language->get('text_image2');
		$data['text_image3'] = $this->language->get('text_image3');
		$data['text_image4'] = $this->language->get('text_image4');
		$data['text_image5'] = $this->language->get('text_image5');
		$data['text_html'] = $this->language->get('text_html');
		$data['text_html_link'] = $this->language->get('text_html_link');
		$data['text_html_h'] = $this->language->get('text_html_h');

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
				'href' => $this->url->link('module/cosyone_bannerwall', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/cosyone_bannerwall', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);			
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/cosyone_bannerwall', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('module/cosyone_bannerwall', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
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
		
		$this->load->model('tool/image');
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$languages = $data['languages'];
		
		foreach($languages as $language) {
        $language_id = $language['language_id'];
		
		// Image
		if (isset($this->request->post['image1'])) {
		$data['image1'][$language_id] = $this->request->post['image1'][$language_id];
		} elseif (!empty($module_info)) {
		$data['image1'][$language_id] = $module_info['image1'][$language_id];
		} else {
		$data['image1'][$language_id] = '';
		}
		// Icon		
		if (isset($this->request->post['image1']) && is_file(DIR_IMAGE . $this->request->post['image1'])) {
		$data['icon1'][$language_id] = $this->model_tool_image->resize($this->request->post['image1'][$language_id], 100, 100);
		} elseif (isset($module_info['image1']) && is_file(DIR_IMAGE . $module_info['image1'][$language_id])) {
		$data['icon1'][$language_id] = $this->model_tool_image->resize($module_info['image1'][$language_id], 100, 100);
		} else {
		$data['icon1'][$language_id] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		// html
		if (isset($this->request->post['html1'])) {
		$data['html1'][$language_id] = $this->request->post['html1'][$language_id];
		} elseif (!empty($module_info)) {
		$data['html1'][$language_id] = $module_info['html1'][$language_id];
		} else {
		$data['html1'][$language_id] = '';
		}
		
		// Image
		if (isset($this->request->post['image2'])) {
		$data['image2'][$language_id] = $this->request->post['image2'][$language_id];
		} elseif (!empty($module_info)) {
		$data['image2'][$language_id] = $module_info['image2'][$language_id];
		} else {
		$data['image2'][$language_id] = '';
		}
		// Icon		
		if (isset($this->request->post['image2']) && is_file(DIR_IMAGE . $this->request->post['image2'])) {
		$data['icon2'][$language_id] = $this->model_tool_image->resize($this->request->post['image2'][$language_id], 100, 100);
		} elseif (isset($module_info['image2']) && is_file(DIR_IMAGE . $module_info['image2'][$language_id])) {
		$data['icon2'][$language_id] = $this->model_tool_image->resize($module_info['image2'][$language_id], 100, 100);
		} else {
		$data['icon2'][$language_id] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		// html
		if (isset($this->request->post['html2'])) {
		$data['html2'][$language_id] = $this->request->post['html2'][$language_id];
		} elseif (!empty($module_info)) {
		$data['html2'][$language_id] = $module_info['html2'][$language_id];
		} else {
		$data['html2'][$language_id] = '';
		}
		
		// Image
		if (isset($this->request->post['image3'])) {
		$data['image3'][$language_id] = $this->request->post['image3'][$language_id];
		} elseif (!empty($module_info)) {
		$data['image3'][$language_id] = $module_info['image3'][$language_id];
		} else {
		$data['image3'][$language_id] = '';
		}
		// Icon		
		if (isset($this->request->post['image3']) && is_file(DIR_IMAGE . $this->request->post['image3'])) {
		$data['icon3'][$language_id] = $this->model_tool_image->resize($this->request->post['image3'][$language_id], 100, 100);
		} elseif (isset($module_info['image3']) && is_file(DIR_IMAGE . $module_info['image3'][$language_id])) {
		$data['icon3'][$language_id] = $this->model_tool_image->resize($module_info['image3'][$language_id], 100, 100);
		} else {
		$data['icon3'][$language_id] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		// html
		if (isset($this->request->post['html3'])) {
		$data['html3'][$language_id] = $this->request->post['html3'][$language_id];
		} elseif (!empty($module_info)) {
		$data['html3'][$language_id] = $module_info['html3'][$language_id];
		} else {
		$data['html3'][$language_id] = '';
		}
		
		// Image
		if (isset($this->request->post['image4'])) {
		$data['image4'][$language_id] = $this->request->post['image4'][$language_id];
		} elseif (!empty($module_info)) {
		$data['image4'][$language_id] = $module_info['image4'][$language_id];
		} else {
		$data['image4'][$language_id] = '';
		}
		// Icon		
		if (isset($this->request->post['image4']) && is_file(DIR_IMAGE . $this->request->post['image4'])) {
		$data['icon4'][$language_id] = $this->model_tool_image->resize($this->request->post['image4'][$language_id], 100, 100);
		} elseif (isset($module_info['image4']) && is_file(DIR_IMAGE . $module_info['image4'][$language_id])) {
		$data['icon4'][$language_id] = $this->model_tool_image->resize($module_info['image4'][$language_id], 100, 100);
		} else {
		$data['icon4'][$language_id] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		// html
		if (isset($this->request->post['html4'])) {
		$data['html4'][$language_id] = $this->request->post['html4'][$language_id];
		} elseif (!empty($module_info)) {
		$data['html4'][$language_id] = $module_info['html4'][$language_id];
		} else {
		$data['html4'][$language_id] = '';
		}
		
		// Image
		if (isset($this->request->post['image5'])) {
		$data['image5'][$language_id] = $this->request->post['image5'][$language_id];
		} elseif (!empty($module_info)) {
		$data['image5'][$language_id] = $module_info['image5'][$language_id];
		} else {
		$data['image5'][$language_id] = '';
		}
		// Icon		
		if (isset($this->request->post['image5']) && is_file(DIR_IMAGE . $this->request->post['image5'])) {
		$data['icon5'][$language_id] = $this->model_tool_image->resize($this->request->post['image5'][$language_id], 100, 100);
		} elseif (isset($module_info['image5']) && is_file(DIR_IMAGE . $module_info['image5'][$language_id])) {
		$data['icon5'][$language_id] = $this->model_tool_image->resize($module_info['image5'][$language_id], 100, 100);
		} else {
		$data['icon5'][$language_id] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		// html
		if (isset($this->request->post['html5'])) {
		$data['html5'][$language_id] = $this->request->post['html5'][$language_id];
		} elseif (!empty($module_info)) {
		$data['html5'][$language_id] = $module_info['html5'][$language_id];
		} else {
		$data['html5'][$language_id] = '';
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

		$this->response->setOutput($this->load->view('module/cosyone_bannerwall.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/cosyone_bannerwall')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
				
		return !$this->error;
	}
}