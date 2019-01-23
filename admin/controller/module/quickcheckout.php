<?php
class ControllerModuleQuickCheckout extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('module/quickcheckout');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('quickcheckout', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
		
			if (!isset($this->request->get['continue'])) {
				$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
			} else {
				$this->response->redirect($this->url->link('module/quickcheckout', 'token=' . $this->session->data['token'], true));
			}
		}
	
		// All fields
		$fields = array(
			'firstname',
			'lastname',
			'email',
			'telephone',
			'fax',
			'company',
			'customer_group',
			'address_1',
			'address_2',
			'city',
			'postcode',
			'country',
			'zone',
			'newsletter',
			'register'
		);
		
		$data['fields'] = $fields;

		// Heading
		$data['heading_title'] = $this->language->get('heading_title');
		
		// Tab
		$data['tab_home'] = $this->language->get('tab_home');
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_technical'] = $this->language->get('tab_technical');
		$data['tab_field'] = $this->language->get('tab_field');
		$data['tab_module'] = $this->language->get('tab_module');
		$data['tab_survey'] = $this->language->get('tab_survey');
		$data['tab_delivery'] = $this->language->get('tab_delivery');
		$data['tab_countdown'] = $this->language->get('tab_countdown');
		$data['tab_support'] = $this->language->get('tab_support');
		
		// Help
		$data['help_status'] = $this->language->get('help_status');
		$data['help_load_screen'] = $this->language->get('help_load_screen');
		$data['help_payment_logo'] = $this->language->get('help_payment_logo');
		$data['help_payment'] = $this->language->get('help_payment');
		$data['help_shipping'] = $this->language->get('help_shipping');
		$data['help_edit_cart'] = $this->language->get('help_edit_cart');
		$data['help_highlight_error'] = $this->language->get('help_highlight_error');
		$data['help_text_error'] = $this->language->get('help_text_error');
		$data['help_layout'] = $this->language->get('help_layout');
		$data['help_slide_effect'] = $this->language->get('help_slide_effect');
		$data['help_debug'] = $this->language->get('help_debug');
		$data['help_auto_submit'] = $this->language->get('help_auto_submit');
		$data['help_responsive'] = $this->language->get('help_responsive');
		$data['help_country_reload'] = $this->language->get('help_country_reload');
		$data['help_payment_reload'] = $this->language->get('help_payment_reload');
		$data['help_shipping_reload'] = $this->language->get('help_shipping_reload');
		$data['help_voucher'] = $this->language->get('help_voucher');
		$data['help_coupon'] = $this->language->get('help_coupon');
		$data['help_reward'] = $this->language->get('help_reward');
		$data['help_cart'] = $this->language->get('help_cart');
		$data['help_shipping_module'] = $this->language->get('help_shipping_module');
		$data['help_payment_module'] = $this->language->get('help_payment_module');
		$data['help_login_module'] = $this->language->get('help_login_module');
		$data['help_html_header'] = $this->language->get('help_html_header');
		$data['help_html_footer'] = $this->language->get('help_html_footer');
		$data['help_survey_required'] = $this->language->get('help_survey_required');
		$data['help_survey_text'] = $this->language->get('help_survey_text');
		$data['help_survey_type'] = $this->language->get('help_survey_type');
		$data['help_survey_answer'] = $this->language->get('help_survey_answer');
		$data['help_delivery'] = $this->language->get('help_delivery');
		$data['help_delivery_time'] = $this->language->get('help_delivery_time');
		$data['help_delivery_required'] = $this->language->get('help_delivery_required');
		$data['help_delivery_unavailable'] = $this->language->get('help_delivery_unavailable');
		$data['help_delivery_min'] = $this->language->get('help_delivery_min');
		$data['help_delivery_max'] = $this->language->get('help_delivery_max');
		$data['help_delivery_days_of_week'] = $this->language->get('help_delivery_days_of_week');
		$data['help_delivery_times'] = $this->language->get('help_delivery_times');
		$data['help_countdown'] = $this->language->get('help_countdown');
		$data['help_countdown_start'] = $this->language->get('help_countdown_start');
		$data['help_countdown_date_start'] = $this->language->get('help_countdown_date_start');
		$data['help_countdown_date_end'] = $this->language->get('help_countdown_date_end');
		$data['help_countdown_time'] = $this->language->get('help_countdown_time');
		$data['help_countdown_text'] = $this->language->get('help_countdown_text');
		
		// Home
		$data['text_general'] = $this->language->get('text_general');
		$data['text_technical'] = $this->language->get('text_technical');
		$data['text_field'] = $this->language->get('text_field');
		$data['text_module_home'] = $this->language->get('text_module_home');
		$data['text_survey'] = $this->language->get('text_survey');
		$data['text_delivery'] = $this->language->get('text_delivery');
		$data['text_countdown'] = $this->language->get('text_countdown');
		$data['text_support_home'] = $this->language->get('text_support_home');
		
		// System
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_radio_type'] = $this->language->get('text_radio_type');
		$data['text_select_type'] = $this->language->get('text_select_type');
		$data['text_text_type'] = $this->language->get('text_text_type');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_one_column'] = $this->language->get('text_one_column');
		$data['text_two_column'] = $this->language->get('text_two_column');
		$data['text_three_column'] = $this->language->get('text_three_column');
		$data['text_estimate'] = $this->language->get('text_estimate');
		$data['text_choose'] = $this->language->get('text_choose');
		$data['text_day'] = $this->language->get('text_day');
		$data['text_specific'] = $this->language->get('text_specific');
		$data['text_display'] = $this->language->get('text_display');
		$data['text_required'] = $this->language->get('text_required');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_sort_order'] = $this->language->get('text_sort_order');
		$data['text_edit'] = $this->language->get('text_edit');

		// General
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_load_screen'] = $this->language->get('entry_load_screen');
		$data['entry_payment_logo'] = $this->language->get('entry_payment_logo');
		$data['entry_payment'] = $this->language->get('entry_payment');
		$data['entry_shipping'] = $this->language->get('entry_shipping');
		$data['entry_edit_cart'] = $this->language->get('entry_edit_cart');
		$data['entry_highlight_error'] = $this->language->get('entry_highlight_error');
		$data['entry_text_error'] = $this->language->get('entry_text_error');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_slide_effect'] = $this->language->get('entry_slide_effect');
		
		// Technical
		$data['entry_debug'] = $this->language->get('entry_debug');
		$data['entry_auto_submit'] = $this->language->get('entry_auto_submit');
		$data['entry_responsive'] = $this->language->get('entry_responsive');
		$data['entry_country_reload'] = $this->language->get('entry_country_reload');
		$data['entry_payment_reload'] = $this->language->get('entry_payment_reload');
		$data['entry_shipping_reload'] = $this->language->get('entry_shipping_reload');
		
		// Fields
		foreach ($fields as $field) {
			$data['entry_field_' . $field] = $this->language->get('entry_field_' . $field);
		}
		
		// Modules
		$data['entry_voucher'] = $this->language->get('entry_voucher');
		$data['entry_coupon'] = $this->language->get('entry_coupon');
		$data['entry_reward'] = $this->language->get('entry_reward');
		$data['entry_cart'] = $this->language->get('entry_cart');
		$data['entry_shipping_module'] = $this->language->get('entry_shipping_module');
		$data['entry_payment_module'] = $this->language->get('entry_payment_module');
		$data['entry_login_module'] = $this->language->get('entry_login_module');
		$data['entry_html_header'] = $this->language->get('entry_html_header');
		$data['entry_html_footer'] = $this->language->get('entry_html_footer');
		
		// Survey
		$data['entry_survey'] = $this->language->get('entry_survey');
		$data['entry_survey_required'] = $this->language->get('entry_survey_required');
		$data['entry_survey_text'] = $this->language->get('entry_survey_text');
		$data['entry_survey_type'] = $this->language->get('entry_survey_type');
		$data['entry_survey_answer'] = $this->language->get('entry_survey_answer');
		
		// Delivery
		$data['entry_delivery'] = $this->language->get('entry_delivery');
		$data['entry_delivery_time'] = $this->language->get('entry_delivery_time');
		$data['entry_delivery_required'] = $this->language->get('entry_delivery_required');
		$data['entry_delivery_unavailable'] = $this->language->get('entry_delivery_unavailable');
		$data['entry_delivery_min'] = $this->language->get('entry_delivery_min');
		$data['entry_delivery_max'] = $this->language->get('entry_delivery_max');
		$data['entry_delivery_days_of_week'] = $this->language->get('entry_delivery_days_of_week');
		$data['entry_delivery_times'] = $this->language->get('entry_delivery_times');
		
		// Countdown
		$data['entry_countdown'] = $this->language->get('entry_countdown');
		$data['entry_countdown_start'] = $this->language->get('entry_countdown_start');
		$data['entry_countdown_date_start'] = $this->language->get('entry_countdown_date_start');
		$data['entry_countdown_date_end'] = $this->language->get('entry_countdown_date_end');
		$data['entry_countdown_time'] = $this->language->get('entry_countdown_time');
		$data['entry_countdown_text'] = $this->language->get('entry_countdown_text');
		
		$data['text_support'] = $this->language->get('text_support');
		$data['text_need_support'] = $this->language->get('text_need_support');
		$data['text_follow'] = $this->language->get('text_follow');
		$data['entry_mail_name'] = $this->language->get('entry_mail_name');
		$data['entry_mail_order_id'] = $this->language->get('entry_mail_order_id');
		$data['entry_mail_message'] = $this->language->get('entry_mail_message');
		$data['entry_mail_email'] = $this->language->get('entry_mail_email');
		$data['button_mail'] = $this->language->get('button_mail');
		$data['button_review'] = $this->language->get('button_review');
		$data['button_purchase'] = $this->language->get('button_purchase');
		
		// Button
		$data['button_save'] = $this->language->get('button_save');
		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_remove'] = $this->language->get('button_remove');
		
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
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true)
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/quickcheckout', 'token=' . $this->session->data['token'], true)
   		);
		
		$data['action'] = $this->url->link('module/quickcheckout', 'token=' . $this->session->data['token'], true);
		$data['continue'] = $this->url->link('module/quickcheckout', 'token=' . $this->session->data['token'] . '&continue=1', true);
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);
		$data['token'] = $this->session->data['token'];
		
		// General
		if (isset($this->request->post['quickcheckout_status'])) {
			$data['quickcheckout_status'] = $this->request->post['quickcheckout_status'];
		} else {
			$data['quickcheckout_status'] = $this->config->get('quickcheckout_status');
		}
		
		if (isset($this->request->post['quickcheckout_load_screen'])) {
			$data['quickcheckout_load_screen'] = $this->request->post['quickcheckout_load_screen'];
		} else {
			$data['quickcheckout_load_screen'] = $this->config->get('quickcheckout_load_screen');
		}
		
		if (isset($this->request->post['quickcheckout_payment_logo'])) {
			$data['quickcheckout_payment_logo'] = $this->request->post['quickcheckout_payment_logo'];
		} else {
			$data['quickcheckout_payment_logo'] = $this->config->get('quickcheckout_payment_logo');
		}		
		
		if (isset($this->request->post['quickcheckout_payment'])) {
			$data['quickcheckout_payment'] = $this->request->post['quickcheckout_payment'];
		} else {
			$data['quickcheckout_payment'] = $this->config->get('quickcheckout_payment');
		}
		
		if (isset($this->request->post['quickcheckout_shipping'])) {
			$data['quickcheckout_shipping'] = $this->request->post['quickcheckout_shipping'];
		} else {
			$data['quickcheckout_shipping'] = $this->config->get('quickcheckout_shipping');
		}
		
		if (isset($this->request->post['quickcheckout_edit_cart'])) {
			$data['quickcheckout_edit_cart'] = $this->request->post['quickcheckout_edit_cart'];
		} else {
			$data['quickcheckout_edit_cart'] = $this->config->get('quickcheckout_edit_cart');
		}
		
		if (isset($this->request->post['quickcheckout_highlight_error'])) {
			$data['quickcheckout_highlight_error'] = $this->request->post['quickcheckout_highlight_error'];
		} else {
			$data['quickcheckout_highlight_error'] = $this->config->get('quickcheckout_highlight_error');
		}
		
		if (isset($this->request->post['quickcheckout_text_error'])) {
			$data['quickcheckout_text_error'] = $this->request->post['quickcheckout_text_error'];
		} else {
			$data['quickcheckout_text_error'] = $this->config->get('quickcheckout_text_error');
		}
		
		if (isset($this->request->post['quickcheckout_layout'])) {
			$data['quickcheckout_layout'] = $this->request->post['quickcheckout_layout'];
		} elseif ($this->config->get('quickcheckout_layout')) {
			$data['quickcheckout_layout'] = $this->config->get('quickcheckout_layout');
		} else {
			$data['quickcheckout_layout'] = '2';
		}
		
		if (isset($this->request->post['quickcheckout_slide_effect'])) {
			$data['quickcheckout_slide_effect'] = $this->request->post['quickcheckout_slide_effect'];
		} else {
			$data['quickcheckout_slide_effect'] = $this->config->get('quickcheckout_slide_effect');
		}
		
		// Technical
		if (isset($this->request->post['quickcheckout_debug'])) {
			$data['quickcheckout_debug'] = $this->request->post['quickcheckout_debug'];
		} else {
			$data['quickcheckout_debug'] = $this->config->get('quickcheckout_debug');
		}
		
		if (isset($this->request->post['quickcheckout_auto_submit'])) {
			$data['quickcheckout_auto_submit'] = $this->request->post['quickcheckout_auto_submit'];
		} else {
			$data['quickcheckout_auto_submit'] = $this->config->get('quickcheckout_auto_submit');
		}
		
		if (isset($this->request->post['quickcheckout_responsive'])) {
			$data['quickcheckout_responsive'] = $this->request->post['quickcheckout_responsive'];
		} else {
			$data['quickcheckout_responsive'] = $this->config->get('quickcheckout_responsive');
		}
		
		if (isset($this->request->post['quickcheckout_country_reload'])) {
			$data['quickcheckout_country_reload'] = $this->request->post['quickcheckout_country_reload'];
		} else {
			$data['quickcheckout_country_reload'] = $this->config->get('quickcheckout_country_reload');
		}
		
		if (isset($this->request->post['quickcheckout_payment_reload'])) {
			$data['quickcheckout_payment_reload'] = $this->request->post['quickcheckout_payment_reload'];
		} else {
			$data['quickcheckout_payment_reload'] = $this->config->get('quickcheckout_payment_reload');
		}
		
		if (isset($this->request->post['quickcheckout_shipping_reload'])) {
			$data['quickcheckout_shipping_reload'] = $this->request->post['quickcheckout_shipping_reload'];
		} else {
			$data['quickcheckout_shipping_reload'] = $this->config->get('quickcheckout_shipping_reload');
		}
		
		// Fields
		foreach ($fields as $field) {
			if (isset($this->request->post['quickcheckout_field_' . $field])) {
				$data['quickcheckout_field_' . $field] = $this->request->post['quickcheckout_field_' . $field];
			} elseif (is_array($this->config->get('quickcheckout_field_' . $field))) {
				$data['quickcheckout_field_' . $field] = $this->config->get('quickcheckout_field_' . $field);
			} else {
				$data['quickcheckout_field_' . $field] = array();
			}
		}
		
		// Modules
		if (isset($this->request->post['quickcheckout_coupon'])) {
			$data['quickcheckout_coupon'] = $this->request->post['quickcheckout_coupon'];
		} else {
			$data['quickcheckout_coupon'] = $this->config->get('quickcheckout_coupon');
		}
		
		if (isset($this->request->post['quickcheckout_voucher'])) {
			$data['quickcheckout_voucher'] = $this->request->post['quickcheckout_voucher'];
		} else {
			$data['quickcheckout_voucher'] = $this->config->get('quickcheckout_voucher');
		}
		
		if (isset($this->request->post['quickcheckout_reward'])) {
			$data['quickcheckout_reward'] = $this->request->post['quickcheckout_reward'];
		} else {
			$data['quickcheckout_reward'] = $this->config->get('quickcheckout_reward');
		}
		
		if (isset($this->request->post['quickcheckout_cart'])) {
			$data['quickcheckout_cart'] = $this->request->post['quickcheckout_cart'];
		} else {
			$data['quickcheckout_cart'] = $this->config->get('quickcheckout_cart');
		}
		
		if (isset($this->request->post['quickcheckout_shipping_module'])) {
			$data['quickcheckout_shipping_module'] = $this->request->post['quickcheckout_shipping_module'];
		} else {
			$data['quickcheckout_shipping_module'] = $this->config->get('quickcheckout_shipping_module');
		}
		
		if (isset($this->request->post['quickcheckout_payment_module'])) {
			$data['quickcheckout_payment_module'] = $this->request->post['quickcheckout_payment_module'];
		} else {
			$data['quickcheckout_payment_module'] = $this->config->get('quickcheckout_payment_module');
		}
		
		if (isset($this->request->post['quickcheckout_login_module'])) {
			$data['quickcheckout_login_module'] = $this->request->post['quickcheckout_login_module'];
		} else {
			$data['quickcheckout_login_module'] = $this->config->get('quickcheckout_login_module');
		}
		
		if (isset($this->request->post['quickcheckout_html_header'])) {
			$data['quickcheckout_html_header'] = $this->request->post['quickcheckout_html_header'];
		} elseif ($this->config->get('quickcheckout_html_header')) {
			$data['quickcheckout_html_header'] = $this->config->get('quickcheckout_html_header');
		} else {
			$data['quickcheckout_html_header'] = array();
		}
		
		if (isset($this->request->post['quickcheckout_html_footer'])) {
			$data['quickcheckout_html_footer'] = $this->request->post['quickcheckout_html_footer'];
		} elseif ($this->config->get('quickcheckout_html_footer')) {
			$data['quickcheckout_html_footer'] = $this->config->get('quickcheckout_html_footer');
		} else {
			$data['quickcheckout_html_footer'] = array();
		}
		
		// Survey
		if (isset($this->request->post['quickcheckout_survey'])) {
			$data['quickcheckout_survey'] = $this->request->post['quickcheckout_survey'];
		} else {
			$data['quickcheckout_survey'] = $this->config->get('quickcheckout_survey');
		}
		
		if (isset($this->request->post['quickcheckout_survey_required'])) {
			$data['quickcheckout_survey_required'] = $this->request->post['quickcheckout_survey_required'];
		} else {
			$data['quickcheckout_survey_required'] = $this->config->get('quickcheckout_survey_required');
		}
		
		if (isset($this->request->post['quickcheckout_survey_text'])) {
			$data['quickcheckout_survey_text'] = $this->request->post['quickcheckout_survey_text'];
		} elseif ($this->config->get('quickcheckout_survey_text')) {
			$data['quickcheckout_survey_text'] = $this->config->get('quickcheckout_survey_text');
		} else {
			$data['quickcheckout_survey_text'] = array();
		}
		
		if (isset($this->request->post['quickcheckout_survey_type'])) {
			$data['quickcheckout_survey_type'] = $this->request->post['quickcheckout_survey_type'];
		} else {
			$data['quickcheckout_survey_type'] = $this->config->get('quickcheckout_survey_type');
		}
		
		if (isset($this->request->post['quickcheckout_survey_answers'])) {
			$data['quickcheckout_survey_answers'] = $this->request->post['quickcheckout_survey_answers'];
		} elseif ($this->config->get('quickcheckout_survey_answers')) {
			$data['quickcheckout_survey_answers'] = $this->config->get('quickcheckout_survey_answers');
		} else {
			$data['quickcheckout_survey_answers'] = array();
		}
		
		// Delivery
		if (isset($this->request->post['quickcheckout_delivery'])) {
			$data['quickcheckout_delivery'] = $this->request->post['quickcheckout_delivery'];
		} else {
			$data['quickcheckout_delivery'] = $this->config->get('quickcheckout_delivery');
		}
		
		if (isset($this->request->post['quickcheckout_delivery_time'])) {
			$data['quickcheckout_delivery_time'] = $this->request->post['quickcheckout_delivery_time'];
		} else {
			$data['quickcheckout_delivery_time'] = $this->config->get('quickcheckout_delivery_time');
		}
		
		if (isset($this->request->post['quickcheckout_delivery_required'])) {
			$data['quickcheckout_delivery_required'] = $this->request->post['quickcheckout_delivery_required'];
		} else {
			$data['quickcheckout_delivery_required'] = $this->config->get('quickcheckout_delivery_required');
		}
		
		if (isset($this->request->post['quickcheckout_delivery_unavailable'])) {
			$data['quickcheckout_delivery_unavailable'] = $this->request->post['quickcheckout_delivery_unavailable'];
		} elseif ($this->config->get('quickcheckout_delivery_unavailable')) {
			$data['quickcheckout_delivery_unavailable'] = $this->config->get('quickcheckout_delivery_unavailable');
		} else {
			$data['quickcheckout_delivery_unavailable'] = '"6-3-2013", "7-3-2013", "8-3-2013"';
		}
		
		if (isset($this->request->post['quickcheckout_delivery_min'])) {
			$data['quickcheckout_delivery_min'] = $this->request->post['quickcheckout_delivery_min'];
		} elseif ($this->config->get('quickcheckout_delivery_min')) {
			$data['quickcheckout_delivery_min'] = (int)$this->config->get('quickcheckout_delivery_min');
		} else {
			$data['quickcheckout_delivery_min'] = 1;
		}
		
		if (isset($this->request->post['quickcheckout_delivery_max'])) {
			$data['quickcheckout_delivery_max'] = $this->request->post['quickcheckout_delivery_max'];
		} elseif ($this->config->get('quickcheckout_delivery_max')) {
			$data['quickcheckout_delivery_max'] = (int)$this->config->get('quickcheckout_delivery_max');
		} else {
			$data['quickcheckout_delivery_max'] = 30;
		}
		
		if (isset($this->request->post['quickcheckout_delivery_days_of_week'])) {
			$data['quickcheckout_delivery_days_of_week'] = $this->request->post['quickcheckout_delivery_days_of_week'];
		} elseif ($this->config->get('quickcheckout_delivery_days_of_week')) {
			$data['quickcheckout_delivery_days_of_week'] = $this->config->get('quickcheckout_delivery_days_of_week');
		} else {
			$data['quickcheckout_delivery_days_of_week'] = '';
		}
		
		if (isset($this->request->post['quickcheckout_delivery_times'])) {
			$data['quickcheckout_delivery_times'] = $this->request->post['quickcheckout_delivery_times'];
		} elseif ($this->config->get('quickcheckout_delivery_times')) {
			$data['quickcheckout_delivery_times'] = $this->config->get('quickcheckout_delivery_times');
		} else {
			$data['quickcheckout_delivery_times'] = array();
		}
		
		// Countdown
		if (isset($this->request->post['quickcheckout_countdown'])) {
			$data['quickcheckout_countdown'] = $this->request->post['quickcheckout_countdown'];
		} else {
			$data['quickcheckout_countdown'] = $this->config->get('quickcheckout_countdown');
		}
		
		if (isset($this->request->post['quickcheckout_countdown_start'])) {
			$data['quickcheckout_countdown_start'] = $this->request->post['quickcheckout_countdown_start'];
		} else {
			$data['quickcheckout_countdown_start'] = $this->config->get('quickcheckout_countdown_start');
		}
		
		if (isset($this->request->post['quickcheckout_countdown_date_start'])) {
			$data['quickcheckout_countdown_date_start'] = $this->request->post['quickcheckout_countdown_date_start'];
		} else {
			$data['quickcheckout_countdown_date_start'] = $this->config->get('quickcheckout_countdown_date_start');
		}
		
		if (isset($this->request->post['quickcheckout_countdown_date_end'])) {
			$data['quickcheckout_countdown_date_end'] = $this->request->post['quickcheckout_countdown_date_end'];
		} else {
			$data['quickcheckout_countdown_date_end'] = $this->config->get('quickcheckout_countdown_date_end');
		}
		
		if (isset($this->request->post['quickcheckout_countdown_time'])) {
			$data['quickcheckout_countdown_time'] = $this->request->post['quickcheckout_countdown_time'];
		} else {
			$data['quickcheckout_countdown_time'] = $this->config->get('quickcheckout_countdown_time');
		}
		
		if (isset($this->request->post['quickcheckout_countdown_text'])) {
			$data['quickcheckout_countdown_text'] = $this->request->post['quickcheckout_countdown_text'];
		} else {
			$data['quickcheckout_countdown_text'] = $this->config->get('quickcheckout_countdown_text');
		}
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->load->model('localisation/country');
		
		$data['countries'] = $this->model_localisation_country->getCountries();
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/quickcheckout.tpl', $data));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/quickcheckout')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']		
			);
		}

		$this->response->setOutput(json_encode($json));
	}
	
	public function install(){
		$this->language->load('module/quickcheckout');
		
		$this->load->model('setting/setting');
		
		$data = array(
			'quickcheckout_status'				=> '1',
			'quickcheckout_load_screen'			=> '1',
			'quickcheckout_payment_logo'		=> '1',
			'quickcheckout_payment'				=> '1',
			'quickcheckout_shipping'			=> '1',
			'quickcheckout_edit_cart'			=> '1',
			'quickcheckout_highlight_error'		=> '1',
			'quickcheckout_text_error'			=> '1',
			'quickcheckout_layout'				=> '2',
			'quickcheckout_slide_effect'		=> '0',
			'quickcheckout_debug'				=> '0',
			'quickcheckout_auto_submit'			=> '0',
			'quickcheckout_responsive'			=> '0',
			'quickcheckout_country_reload'		=> '0',
			'quickcheckout_payment_reload'		=> '0',
			'quickcheckout_shipping_reload'		=> '0',
			'quickcheckout_field_firstname'		=> array(
					'display'		=> '1',
					'required'		=> '1',
					'default'		=> '',
					'sort_order'	=> '1'
				),
			'quickcheckout_field_lastname'		=> array(
					'display'		=> '1',
					'required'		=> '1',
					'default'		=> '',
					'sort_order'	=> '2'
				),
			'quickcheckout_field_email'			=> array(
					'display'		=> '1',
					'required'		=> '1',
					'default'		=> '',
					'sort_order'	=> '3'
				),
			'quickcheckout_field_telephone'		=> array(
					'display'		=> '1',
					'required'		=> '1',
					'default'		=> '',
					'sort_order'	=> '4'
				),
			'quickcheckout_field_fax'			=> array(
					'display'		=> '0',
					'required'		=> '0',
					'default'		=> '',
					'sort_order'	=> '5'
				),
			'quickcheckout_field_company'		=> array(
					'display'		=> '1',
					'required'		=> '0',
					'default'		=> '',
					'sort_order'	=> '6'
				),
			'quickcheckout_field_customer_group' => array(
					'display'		=> '1',
					'required'		=> '',
					'default'		=> '',
					'sort_order'	=> '7'
				),
			'quickcheckout_field_address_1'		=> array(
					'display'		=> '1',
					'required'		=> '1',
					'default'		=> '',
					'sort_order'	=> '9'
				),
			'quickcheckout_field_address_2'		=> array(
					'display'		=> '0',
					'required'		=> '0',
					'default'		=> '',
					'sort_order'	=> '10'
				),
			'quickcheckout_field_city'			=> array(
					'display'		=> '1',
					'required'		=> '1',
					'default'		=> '',
					'sort_order'	=> '11'
				),
			'quickcheckout_field_postcode'		=> array(
					'display'		=> '1',
					'required'		=> '0',
					'default'		=> '',
					'sort_order'	=> '12'
				),
			'quickcheckout_field_country'		=> array(
					'display'		=> '1',
					'required'		=> '1',
					'default'		=> '1',
					'sort_order'	=> '13'
				),
			'quickcheckout_field_zone'			=> array(
					'display'		=> '1',
					'required'		=> '0',
					'default'		=> '1',
					'sort_order'	=> '14'
				),
			'quickcheckout_field_newsletter'	=> array(
					'display'		=> '1',
					'required'		=> '0',
					'default'		=> '1',
					'sort_order'	=> ''
				),
			'quickcheckout_field_register'		=> array(
					'display'		=> '1',
					'required'		=> '0',
					'default'		=> '',
					'sort_order'	=> ''
				),
			'quickcheckout_coupon'				=> '1',
			'quickcheckout_voucher'				=> '1',
			'quickcheckout_reward'				=> '1',
			'quickcheckout_cart'				=> '1',
			'quickcheckout_shipping_module'		=> '1',
			'quickcheckout_payment_module'		=> '1',
			'quickcheckout_login_module'		=> '1',
			'quickcheckout_html_header'			=> array(),
			'quickcheckout_html_footer'			=> array(),
			'quickcheckout_survey'				=> '0',
			'quickcheckout_survey_required'		=> '0',
			'quickcheckout_survey_text'			=> array(),
			'quickcheckout_delivery'			=> '0',
			'quickcheckout_delivery_time'		=> '0',
			'quickcheckout_delivery_required'	=> '0',
			'quickcheckout_delivery_unavailable'=> '"31-10-2013", "08-11-2013", "25-12-2013"',
			'quickcheckout_delivery_min'		=> '1',
			'quickcheckout_delivery_max'		=> '30',
			'quickcheckout_delivery_days_of_week'	=> ''
		);
		
		$this->model_setting_setting->editSetting('quickcheckout', $data);
	}
	
	public function mail() {
		$this->language->load('module/quickcheckout');
		
		$json = array();
		
		if ($this->validate()) {
			if (strlen($this->request->post['mail_name']) < 3 || strlen($this->request->post['mail_name']) > 16) {
				$json['error']['name'] = $this->language->get('mail_error_name');
			}
			
			if ((strlen($this->request->post['mail_email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['mail_email'])) {
				$json['error']['email'] = $this->language->get('mail_error_email');
			}
			
			if (strlen($this->request->post['mail_order_id']) < 3 || (int)$this->request->post['mail_order_id'] == 0) {
				$json['error']['order_id'] = $this->language->get('mail_error_order_id');
			}
			
			if (strlen($this->request->post['mail_message']) < 20 || strlen($this->request->post['mail_message']) > 2400) {
				$json['error']['message'] = $this->language->get('mail_error_message');
			}
		
			if (!$json) {
				$subject = '[Quick Checkout] Support ' . $this->request->post['mail_name'];
				
				$message = 'Order ID: ' . $this->request->post['mail_order_id'] . "\n\n";
				$message .= $this->request->post['mail_message'];
				
				$mail = new Mail($this->config->get('config_mail'));
				$mail->setTo('support@marketinsg.com');
				$mail->setFrom($this->request->post['mail_email']);
				$mail->setSender($this->request->post['mail_name']);
				$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
				$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
				$mail->send();
				
				$json['success'] = $this->language->get('mail_success');
			}
		} else {
			$json['error']['warning'] = $this->error['warning'];
		}
		
		$this->response->setOutput(json_encode($json));	
	}
}