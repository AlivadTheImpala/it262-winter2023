<?php
//classes.php
// an object is like an associative array and can be associated with multiple things.
//data items inside of a class are called properties.


$myCar = new Car('Porsche', '911', '12345', 'Red');

// echo $myCar->mileage;

echo '<pre>';
var_dump($myCar);
echo '</pre>';

class Car
{
    public $make = '';
    public $model = '';
    public $mileage = 0;
    public $color = '';

    //we need a constructor to instantiate an object
    //$this is a reserved keyword that looks at the current object and applies the respective properties to create the object of a car. 
    public function __construct($make, $model, $mileage, $color)
    {
        $this->make = $make;
        $this->model = $model;
        $this->mileage = $mileage;
        $this->color = $color;
    }
}
