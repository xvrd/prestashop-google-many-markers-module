<?php


class googlemanymarkersmarkersModuleFrontController extends ModuleFrontController
{
    
    public function __construct()
    {
        parent::__construct();
        $this->context = Context::getContext();
    }
    
    
    public function initContent()
    {
        parent::initContent();
        $this->id_module = (int) Tools::getValue('id_module');
        $this->display_header = false;
        $this->display_footer = false;
        
        $markers = GoogleManyMarkers::getAllMarkers();
        
        $this->context->smarty->assign(array(
            'markers' => json_encode($markers)
        ));
        
        $this->setTemplate('markers.tpl');
    }
    
    
    public function setMedia()
    {
        parent::setMedia();
    }
}