<?php
class ControllerModuleCosyoneTestimonial extends Controller {
	public function index($setting) {
		
		static $module = 0;
		
		$this->load->language('module/cosyone_testimonial');
		
		$data['lang'] = $this->language->get('code');
		
		if(empty($setting['testimonial_title'][$this->config->get('config_language_id')])) {
			$data['testimonial_title'] = false;
		} else if (isset($setting['testimonial_title'][$this->config->get('config_language_id')])) {
			$data['testimonial_title'] = html_entity_decode($setting['testimonial_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		}
		
		if (isset($setting['testimonial_columns'])) {
		$data['testimonial_columns'] = $setting['testimonial_columns'];
		} elseif (!empty($setting['testimonial_columns'])) {
		$data['testimonial_columns'] = $setting['testimonial_columns'];
		} else {
		$data['testimonial_columns'] = 'grid3';
		}
		
		if (isset($setting['testimonial_contrast'])) {
		$data['testimonial_contrast'] = "1";
		} else {
		$data['testimonial_contrast'] = false;
		}
			
		if (isset($setting['testimonial_links'])) {
		$data['testimonial_links'] = "1";
		} else {
		$data['testimonial_links'] = false;
		}
			
		if (isset($setting['testimonial_carousel'])) {
		$data['testimonial_carousel'] = "1";
		} else {
		$data['testimonial_carousel'] = false;
		}
		
		
		$data['heading_title'] = $this->language->get('heading_title');
      	$data['text_more'] = $this->language->get('text_more');
      	$data['text_more2'] = $this->language->get('text_more2');
		$data['write_testimonial'] = $this->language->get('write_testimonial');
		$data['show_all'] = $this->language->get('show_all');
		$data['showall_url'] = $this->url->link('product/testimonial', '', true); 
		$data['more'] = $this->url->link('product/testimonial', 'testimonial_id=' , true); 
		$data['link'] = $this->url->link('product/testimonial', 'testimonial_id=' , true); 
		$data['href_write_testimonial'] = $this->url->link('product/testimonialform', '', true);

		$this->load->model('catalog/testimonial');
		
		
		$data['testimonials'] = array();
		
		$data['total'] = $this->model_catalog_testimonial->getTotalTestimonials();
		$results = $this->model_catalog_testimonial->getTestimonials(0, $setting['testimonial_limit'], (isset($setting['testimonial_random']))?true:false);


		foreach ($results as $result) {
			
			
			$result['description'] = trim($result['description']);
			$result['description'] = str_replace('«<p>', '', $result['description']);
			$result['description'] = str_replace('</p>»', '', $result['description']);

			
			if (!isset($setting['testimonial_character_limit']))
				$setting['testimonial_character_limit'] = 0;

			if ($setting['testimonial_character_limit']>0)
			{
				$lim = $setting['testimonial_character_limit'];

				if (mb_strlen($result['description'],'UTF-8')>$lim) 
					$result['description'] = mb_substr($result['description'], 0, $lim-3, 'UTF-8'). ' ' .'<a href="'.$data['more']. $result['testimonial_id'] .'" title="'.$data['text_more2'].'">'. $data['text_more'] . '</a>';

			}

			if (mb_strlen($result['title'],'UTF-8')>37)
					$result['title'] = mb_substr($result['title'], 0, 34, 'UTF-8').'...';

			if (mb_strlen($result['name'],'UTF-8')>17)
					$result['name'] = mb_substr($result['name'], 0, 14, 'UTF-8').'...';

			if (mb_strlen($result['city'],'UTF-8')>17)
					$result['city'] = mb_substr($result['city'], 0, 14, 'UTF-8').'...';
					
			$result['link'] = $data['more']. $result['testimonial_id'];

			$data['testimonials'][] = array(
				'id'			=> $result['testimonial_id'],											  
				'title'		=> $result['title'],
				'description'	=> $result['description'],
				'rating'		=> $result['rating'],
				'name'		=> $result['name'],
				'date_added'	=> $result['date_added'],
				'city'		=> $result['city'],
				'link'		=> $result['link']

			);
		}

		$this->id = 'testimonial';
		
		$data['module'] = $module++;
		
		return $this->load->view('module/cosyone_testimonial', $data);
		
	}
}