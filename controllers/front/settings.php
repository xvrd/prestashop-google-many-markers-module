<?php

class GoogleManyMarkersSettingsModuleFrontController extends ModuleFrontController
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
        
        $settings = GoogleManyMarkers::getAllSettings();
        $markers = GoogleManyMarkers::getAllMarkers();
        
        $this->context->smarty->assign(array(
            'settings' => json_encode($settings)
        ));
        
        $this->setTemplate('settings.tpl');
    }
    
    
    public function setMedia()
    {
        parent::setMedia();
    }
}
