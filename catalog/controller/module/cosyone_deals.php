<?php
class ControllerModuleCosyoneDeals extends Controller {
	public function index($setting) {
		$this->load->language('module/cosyone_deals');

		$data['heading_title'] = $this->language->get('heading_title');
				
		if (file_exists('catalog/view/theme/cosyone/js/countdown/jquery.countdown_' . $this->language->get('code') . '.js')) {
		$this->document->addScript('catalog/view/theme/cosyone/js/countdown/jquery.countdown_' . $this->language->get('code') . '.js');
		} else {
		$this->document->addScript('catalog/view/theme/cosyone/js/countdown/jquery.countdown_en.js');
		}
		
		$this->document->addStyle('catalog/view/theme/cosyone/stylesheet/owl.transitions.css');
		
		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		
		$data['cosyone_product_countdown'] = $this->config->get('cosyone_product_countdown');
		$data['cosyone_product_hurry'] = $this->config->get('cosyone_product_hurry');
		
		$data['autoplay'] = $setting['autoplay'];
		
		$data['images_width'] = $setting['width'];
		
		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		$products = array_slice($setting['product'], 0, (int)$setting['limit']);

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

							
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$special_info = $this->model_catalog_product->getSpecialPriceEnd($product_info['product_id']);
        			$special_date_end = strtotime($special_info['date_end']) - time();
					$yousave = $this->currency->format(($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))-($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'))), $this->session->data['currency']);
				} else {
					$special = false;
					$special_date_end = false;
					$yousave = false;
				}
				
				$data['text_special_price'] = $this->language->get('text_special_price');
				$data['text_old_price'] = $this->language->get('text_old_price');
				$data['text_you_save'] = $this->language->get('text_you_save');
				$data['text_expire'] = $this->language->get('text_expire');
				
			

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'product_id'  => $product_info['product_id'],
					'thumb'       => $image,
					'name'        => $product_info['name'],
					'special_date_end' => $special_date_end,
					'yousave'    	 => $yousave,
					'stock_quantity' => sprintf($this->language->get('text_stock_quantity'), (int)$product_info['quantity']),
					'items_sold' => sprintf($this->language->get('text_items_sold'), (int)$this->model_catalog_product->getItemsSold($product_id)),
					'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('theme_default_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			}
		}

		if ($data['products']) {
			
				return $this->load->view('module/cosyone_deals', $data);
			
		}
	}
}