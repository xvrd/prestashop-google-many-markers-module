<?php


class AdminGoogleManyMarkersController extends ModuleAdminController
 {
    public function __construct()
    {
        $this->module = 'googlemanymarkers';
        $this->template = 'displayAdmin.tpl';
        $this->bootstrap = true;
        $this->context = Context::getContext();
        
        parent::__construct();
    } 
    
    public function createTemplate($tpl_name) {
        
        $markerCollection = GoogleManyMarkers::getAllMarkers();
        $settingsCollection = GoogleManyMarkers::getAllSettings();
        
        $token = Tools::getAdminTokenLite('AdminGoogleManyMarkers');
        return $this->context->smarty->createTemplate(__DIR__ . '/../..//views/templates/admin/'. $tpl_name, array(
            'token' => $token,
            'markerCollection' => isset($markerCollection) ? $markerCollection : null,
            'settingsCollection' => isset($settingsCollection) ? $settingsCollection : null
            ));
    }
    
    public function initContent()
    {
        parent::initContent();
        $this->setTemplate('displayAdmin.tpl');
    }
    
    public function postProcess()
    {
        
        
        // Editing settings
        if(!empty(Tools::getValue('markersSettings')['submit'])) {
            $data = Tools::getValue('markersSettings');
            unset($data['submit']);
            
            $settingsCollection = GoogleManyMarkers::getAllSettings();
            foreach($settingsCollection as $settingsRow) {
                foreach($data as $key => $value) {
                    if($settingsRow->option_name == $key) {
                        $markerData = new GoogleManyMarkersSettings( $settingsRow->id);
                        $markerData->option_value = $value;
                        $markerData->save();
                    }
                }
            } 
        }
        
        // Deletign markers part
        if(!empty(Tools::getValue('marker')['delete'])) {
            $marker_id = Tools::getValue('marker')['delete'];
            $marker = new GoogleManyMarkersData( $marker_id );
            $marker->delete();
        }
        
        // Editing markers part
        if(!empty(Tools::getValue('markerEdit')['submit'])) {
            $data = Tools::getValue('markerEdit');
            unset($data['submit']);
            foreach($data as $key => $value) {
                $markerData = new GoogleManyMarkersData( $data[$key]['id']);
                foreach($value as $key_name => $key_value) {
                    $markerData->$key_name = $key_value;
                }
                $markerData->save();
            }
        }
        
        // Add new markers part
        if(!empty(Tools::getValue('markerAddNew')) && 
                !empty(Tools::getValue('markerAddNew')['submit'])) {
            $data = Tools::getValue('markerAddNew');

            
            $markerData = new GoogleManyMarkersData();
            foreach($data as $key => $value) {
                    $markerData->$key = $value;
            }
            $markerData->save();
         }
    }
       
    
        
    
}
