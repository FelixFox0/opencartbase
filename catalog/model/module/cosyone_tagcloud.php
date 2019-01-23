<?php
class ModelModuleCosyoneTagcloud extends Model {
	public function getRandomTags($data) {
		$cloudData = array();
		$limit = isset($data['limit']) ? $data['limit'] : 10;
		$tagQuery = $this->db->query("SELECT tag, qty FROM " . DB_PREFIX . "tag_cloud WHERE language_id = '" . $this->config->get('config_language_id') . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY qty DESC LIMIT " . $limit);
		$tags = $tagQuery->rows;
		$cloudData = array(
			'tags' => $tags
		);
		$tagcloud = $this->generateTagCloud($cloudData);
		return $tagcloud;
	}
	
	private function generateTagCloud($cloudData) {
	$tags = $cloudData['tags'];
	if ($tags) {
		foreach ($tags as $record) { 
			$tag_href = 'product/search&tag=' . $record['tag'];
			$cloud[] = '<a class="sq_tag" href="' . $this->url->link(str_replace('&', '&amp;', $tag_href)) . '" title="' . $record['tag'] . '">' . $record['tag'] . '</a> ';
			}
			$tagcloud = '';
			for ($x = 0; $x < count($cloud); $x++) { $tagcloud .= $cloud[$x]; }
		return $tagcloud;
		
		} else {
		$cloud = false; 
		}
	}
}