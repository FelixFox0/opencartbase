<?php



use App\Service\RegisterService;

use App\Eloquent\Zone;

class ControllerModuleTestModul extends Controller {
	private $error = array(); 

	public function index() {
        
        
        $adr = Zone::get();
        dd($adr);
        
        
        
        $this->load->language('module/testModul');
        $this->document->setTitle($this->language->get('heading_title'));
        $data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
        
        
        $this->response->setOutput($this->load->view('module/testModul', $data));

        
        
	}

	private function validate() {
        
	}
}
