<?php
class ControllerModuleCosyoneProductbrand extends Controller {
    public function index() {
        $this->load->model('tool/image');

        $this->load->model('catalog/product');

        if (isset($this->request->get['product_id'])) {
            $product_id = (int)$this->request->get['product_id'];
        } else {
            $product_id = 0;
        }

        $product_info = $this->model_catalog_product->getProduct($product_id);

        $width = $this->config->get('cosyone_productbrand_width');
        $height = $this->config->get('cosyone_productbrand_height');
		$data['manufacturer_img'] = false; 
        $data['manufacturer_url'] = false;
		if (!empty($product_info)){
            $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);

            if(!empty($manufacturer_info['manufacturer_id'])){
                if(!empty($manufacturer_info['image'])) {
                    $image = $this->model_tool_image->resize($manufacturer_info['image'], $width, $height);
                } else {
                    $image = $this->model_tool_image->resize('no_image.jpg', $width, $height);
                }
                
                $data['manufacturer_img'] = $image; 
                $data['manufacturer_url'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer_info['manufacturer_id']);
            }
        } 

        return $this->load->view('module/cosyone_productbrand', $data);
        
	}
}