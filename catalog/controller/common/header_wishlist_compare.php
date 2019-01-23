<?php 
class ControllerCommonHeaderWishlistCompare extends Controller {
	public function index() {
		
		$data['cosyone_header_wishlist'] = $this->config->get('cosyone_header_wishlist');
		$data['cosyone_header_compare'] = $this->config->get('cosyone_header_compare');
		
		$this->load->language('module/header_wishlist_compare');
		
		//$data['text_header_wishlist'] = sprintf($this->language->get('text_header_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$this->load->model('account/wishlist');
		
		if ($this->customer->isLogged()) {
		$data['text_header_wishlist'] = sprintf($this->language->get('text_header_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
		$data['text_header_wishlist'] = sprintf($this->language->get('text_header_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}
		
		
		$data['wishlist_link'] = $this->url->link('account/wishlist', '', true);
		
		
		$data['text_header_compare'] = sprintf($this->language->get('text_header_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$data['compare_link'] = $this->url->link('product/compare', '', true);

			return $this->load->view('common/header_wishlist_compare', $data);
			
	}
	public function info() {
		$this->response->setOutput($this->index());
	}
}