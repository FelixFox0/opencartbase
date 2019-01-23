<?php
class ControllerModuleCosyoneTwitterfeed extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('module/cosyone_twitterfeed');

		$this->load->model('setting/setting');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('cosyone_twitterfeed', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/cosyone_twitterfeed', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('module/cosyone_twitterfeed', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->post['cosyone_twitterfeed_title'])) {
			$data['cosyone_twitterfeed_title'] = $this->request->post['cosyone_twitterfeed_title'];
		} else {
			$data['cosyone_twitterfeed_title'] = $this->config->get('cosyone_twitterfeed_title');
		}

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['cosyone_twitterfeed_widget_id'])) {
			$data['cosyone_twitterfeed_widget_id'] = $this->request->post['cosyone_twitterfeed_widget_id'];
		} else {
			$data['cosyone_twitterfeed_widget_id'] = $this->config->get('cosyone_twitterfeed_widget_id');
		}
		
		if (isset($this->request->post['cosyone_twitterfeed_limit'])) {
			$data['cosyone_twitterfeed_limit'] = $this->request->post['cosyone_twitterfeed_limit'];
		} else {
			$data['cosyone_twitterfeed_limit'] = $this->config->get('cosyone_twitterfeed_limit');
		}



		if (isset($this->request->post['cosyone_twitterfeed_status'])) {
			$data['cosyone_twitterfeed_status'] = $this->request->post['cosyone_twitterfeed_status'];
		} else {
			$data['cosyone_twitterfeed_status'] = $this->config->get('cosyone_twitterfeed_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/cosyone_twitterfeed.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/cosyone_twitterfeed')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}