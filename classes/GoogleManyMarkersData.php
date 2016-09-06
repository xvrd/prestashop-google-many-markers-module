<?php

class GoogleManyMarkersData extends ObjectModel 
{
    public $id;
    public $id_marker;
    public $marker_name;
    public $street;
    public $postcode;
    public $city;
    public $phone;
    public $latitude;
    public $longitude;
    public $url;
    
    public static $definition = array(
        'table' => 'google_many_markers_data',
        'primary' => 'id_marker',
        'multilang' => false,
        'fields' => array(
            'marker_name' =>        array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'street' =>     array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'postcode' =>  array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'city' =>   array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'phone' =>   array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'latitude' =>   array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'longitude' =>   array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'url' =>   array('type' => self::TYPE_STRING, 'validate' => 'isString')
        ),
    );
    
}
