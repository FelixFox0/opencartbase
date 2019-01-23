<?php
class ControllerProductQuestion extends Controller {
	public function index() {
		
		$this->load->language('product/question');
		
		$data['heading_ask'] = $this->language->get('heading_ask');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		
		$data['entry_private'] = $this->language->get('entry_private');
		$data['entry_question'] = $this->language->get('entry_question');
		$data['entry_captcha'] = $this->language->get('entry_captcha');
		$data['text_note'] = $this->language->get('text_note');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['button_send'] = $this->language->get('button_send');
		
		$data['allow_private'] = $this->config->get('product_question_allow_private');
		
		$this->load->model('catalog/question');
		
		if (isset($this->request->get['product_id'])) {
			$data['product_id'] = (int)$this->request->get['product_id'];
		} else {
			$data['product_id'] = 0;
		}

		return $this->load->view('product/question', $data);
		
	}
	
	
	
	public function question_list () {
		$this->load->language('product/question');

		$this->load->model('catalog/question');
		
		$data['text_question_from'] = $this->language->get('text_question_from');
		$data['text_no_questions'] = $this->language->get('text_no_questions');
		$data['text_no_answer'] = $this->language->get('text_no_answer');
		$data['text_our_answer'] = $this->language->get('text_our_answer');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['questions'] = array();

		$questions_total = $this->model_catalog_question->getTotalQuestionsByProductId($this->request->get['product_id']);
		
		$limit = $this->config->get('product_question_per_page');
		
		$results = $this->model_catalog_question->getQuestionsByProductId($this->request->get['product_id'], ($page - 1) * $limit, $limit);
		
		foreach ($results as $result) {
			$data['questions'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'answer'       => nl2br($result['answer']),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $questions_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('product_question_per_page');
		$pagination->url = $this->url->link('product/question/question_list', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($questions_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($questions_total - $limit)) ? $questions_total : ((($page - 1) * $limit) + $limit), $questions_total, ceil($questions_total / $limit));
		
		$this->response->setOutput($this->load->view('product/question_list', $data));
	}
	
	
	public function ask_question() {
		$this->load->language('product/question');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 2) || (utf8_strlen($this->request->post['name']) > 30)) {
				$json['error'] = $this->language->get('error_name');
			}
			
			if ((utf8_strlen($this->request->post['email']) < 2) || (utf8_strlen($this->request->post['email']) > 60)) {
				$json['error'] = $this->language->get('error_email');
			}

			if ((utf8_strlen($this->request->post['text']) < 10) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->session->data['captcha_product_questions']) || ($this->session->data['captcha_product_questions'] != $this->request->post['captcha_product_questions'])) {
				$json['error'] = $this->language->get('error_captcha');
			}

			unset($this->session->data['captcha_product_questions']);

			if (!isset($json['error'])) {
				$this->load->model('catalog/question');

				$this->model_catalog_question->addQuestion($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	
}