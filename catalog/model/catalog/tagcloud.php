<?php
//-----------------------------------------------------
// TagCloud for Opencart v1.5.6    						
// Adapted by villagedefrance                          		
// contact@villagedefrance.net                       		
//-----------------------------------------------------

class ModelCatalogTagCloud extends Model {

	public function getRandomTags($data) {
	
		$cloudData = array();
	
		$limit = isset($data['limit']) ? $data['limit'] : 5;
		$random = isset($data['random']) && $data['random'] == 1 ? true : false;
	
		$tagQuery = $this->db->query("SELECT tag, qty FROM " . DB_PREFIX . "tag_cloud WHERE language_id = '" . $this->config->get('config_language_id') . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY RAND() LIMIT " . $limit);
	
		$tags = $tagQuery->rows;
	
		$cloudData = array(
			'tags'          		=> $tags,
			'random'        		=> $random
		);
	
		$tagcloud = $this->generateTagCloud($cloudData);
	
		return $tagcloud;
	}

	private function generateTagCloud($cloudData) {
	
		$tags = $cloudData['tags'];
		$random = isset($cloudData['random']) && $cloudData['random'] == 1 ? true : false;
	
		if ($random == false) {
		
			$qty_arr = array();
		
			foreach($tags as $tag) {
				$qty_arr[] = $tag['qty'];
			}
		
			$cloud = array();
		
			foreach ($tags as $record) {
			
				if ((VERSION == '1.5.5') || (substr(VERSION, 0, -2) == '1.5.5') || (VERSION == '1.5.6') || (substr(VERSION, 0, -2) == '1.5.6')) {
					$tag_href = 'product/search&search=' . $record['tag'] . '&filter_tag=' . $record['tag'];
				} else {
					$tag_href = 'product/search&filter_tag=' . $record['tag'];
				}
			
				$cloud[] = '<a class="sq_tag" href="' . $this->url->link(str_replace('&', '&amp;', $tag_href)) . '" title="' . $record['qty'] . ' ' .$this->language->get('text_href_title') . ' ' . $record['tag'] . '">' . $record['tag'] . '</a> ';
			}
		
		} else {
		
			foreach ($tags as $record) { 
			
				if ((VERSION == '1.5.5') || (substr(VERSION, 0, -2) == '1.5.5') || (VERSION == '1.5.6') || (substr(VERSION, 0, -2) == '1.5.6')) {
					$tag_href = 'product/search&search=' . $record['tag'] . '&filter_tag=' . $record['tag'];
				} else {
					$tag_href = 'product/search&filter_tag=' . $record['tag'];
				}
			
				$cloud[] = '<a href="' . $this->url->link(str_replace('&', '&amp;', $tag_href)) . '" title="' . $record['qty'] . ' ' .$this->language->get('text_href_title') . ' ' . $record['tag'] . '">' . $record['tag'] . '</a> ';
			}
		}
	
		$tagcloud = '';
	
		shuffle($cloud);
	
		for ($x = 0; $x < count($cloud); $x++) { $tagcloud .= $cloud[$x]; }
	
		return $tagcloud;
	}
}
?>