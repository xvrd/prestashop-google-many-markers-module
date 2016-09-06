<?php

class GoogleManyMarkersSettings extends ObjectModel 
{
    public $id;
    public $id_settings;
    public $option_name;
    public $option_value;
    
    
    public static $definition = array(
        'table' => 'google_many_markers_settings',
        'primary' => 'id_settings',
        'multilang' => false,
        'fields' => array(
            'option_name' =>        array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'option_value' =>        array('type' => self::TYPE_STRING, 'validate' => 'isString')
        ),
    );
    
}
