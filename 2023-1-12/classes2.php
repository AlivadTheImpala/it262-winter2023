<?php
//classes2.php
// an object is like an associative array and can be associated with multiple things.
//data items inside of a class are called properties.


$cars[] = new Car('Porsche', '911', '12345', 'red');
$cars[] = new Car('Hyundai', 'Elantra', '70,069', 'blue');
$cars[] = new Car('Tesla', 'Model 3', '69,420', 'black');


$totalMileage = 0;
//well create a foreach loop to go through each new car object in $cars and assign them the $myCar variable.
foreach ($cars as $myCar) {
    echo "<p>My car is a $myCar->color $myCar->make $myCar->model that has $myCar->mileage miles on the odometer<p/>";

    $totalMileage += $myCar->mileage;
}

$carCount = count($cars);
$average = $totalMileage / $carCount;
$average = number_format($average, 2);

echo "<p>I have $carCount cars and the average mileage is $average</p>";


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
