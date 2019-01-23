<?php
class ControllerModuleCosyoneCategory extends Controller {
	public function index() {
		$this->load->language('module/category');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		// Custom categories starts
		// Add current class for active categories
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$data['category_1_id'] = $parts[0];
		} else {
			$data['category_1_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$data['category_2_id'] = $parts[1];
		} else {
			$data['category_2_id'] = 0;
		}
		
		if (isset($parts[2])) {
			$data['category_3_id'] = $parts[2];
		} else {
			$data['category_3_id'] = 0;
		}
					
		$categories_1 = $this->model_catalog_category->getCategories(0);
		
		$this->load->model('tool/image');
		
		foreach ($categories_1 as $category_1) {
		
			$level_2_data = array();
			
			$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
			
			foreach ($categories_2 as $category_2) {
				$level_3_data = array();

				// Third level
				$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);

				foreach ($categories_3 as $category_3) {
					
					$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id'  => $category_3['category_id']));

					$level_3_data[] = array(
					'category_3_id' => $category_3['category_id'],
					'name' => $category_3['name'] .($this->config->get('config_product_count') ?  ' (' . $total . ')' : ''),
					'href' => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'] . '_' . $category_3['category_id'])
					);
				 } 
				
				// Second level
				$categories_2 = $this->model_catalog_category->getCategories(0);
				
				$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id'  => $category_2['category_id'], 'filter_sub_category' => true));
						
				$level_2_data[] = array(
					'category_2_id' => $category_2['category_id'],
					'name'    	=> $category_2['name']  .($this->config->get('config_product_count') ?  '<span>' . ' (' . $total . ')' . '</span>' : ''),
					'children'	=> $level_3_data,
					'href'    	=> $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'])
				);					
		}
			
				// First level
        	$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id'  => $category_1['category_id'], 'filter_sub_category' => true));

			$data['categories'][] = array(
				'category_1_id' => $category_1['category_id'],
				'name'     => $category_1['name'] .($this->config->get('config_product_count') ?  '<span>' . ' (' . $total . ')' . '</span>' : ''),				
				'children' => $level_2_data,
				'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'])
			);
		}
		return $this->load->view('module/cosyone_category', $data);
	}
}