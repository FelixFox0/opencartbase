<?php
class ModelCatalogQuestion extends Model {
	
	public function addQuestion($product_id, $data) {
		$this->event->trigger('pre.question.add', $data);
		
		
		if ($this->config->get('product_question_default_status')){
		$question_status = '1';
		}else{
		$question_status = '0';
		}
		
		if ($data['private']){
		$question_status = '0';
		}
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "question SET 
		author = '" . $this->db->escape($data['name']) . "', 
		email = '" . $this->db->escape($data['email']) . "', 
		customer_id = '" . (int)$this->customer->getId() . "', 
		product_id = '" . (int)$product_id . "', 
		private = '" . $this->db->escape($data['private']) . "', 
		status = '" . $question_status . "',
		text = '" . $this->db->escape($data['text']) . "', 
		
		date_added = NOW()");

		$question_id = $this->db->getLastId();

		if ($this->config->get('product_question_notify')) {
			$this->load->language('product/question');
			$this->load->model('catalog/product');
			$product_info = $this->model_catalog_product->getProduct($product_id);

			$subject = sprintf($this->language->get('text_subject'), $this->config->get('config_name'));

			$message  = $this->language->get('text_waiting') . "\n";
			$message .= sprintf($this->language->get('text_product'), $this->db->escape(strip_tags($product_info['name']))) . "\n";
			$message .= sprintf($this->language->get('text_author'), $this->db->escape(strip_tags($data['name']))) . " (" . $this->db->escape(strip_tags($data['email'])) . ")" . "\n";
			$message .= $this->language->get('text_question') . "\n";
			$message .= $this->db->escape(strip_tags($data['text'])) . "\n\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_host');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			
			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($this->config->get('config_name'));
			$mail->setSubject($subject);
			$mail->setText($message);
			$mail->send();
			
		}


		$this->event->trigger('post.question.add', $question_id);
	}

	
	
	public function getQuestionsByProductId($product_id, $start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 20;
		}

		$query = $this->db->query("SELECT r.question_id, r.author, r.text, r.answer, p.product_id, pd.name, p.price, p.image, r.date_added FROM " . DB_PREFIX . "question r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalQuestionsByProductId($product_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "question r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row['total'];
	}
}