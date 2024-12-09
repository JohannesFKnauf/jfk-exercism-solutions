<?php

class PizzaPi
{
    public function calculateDoughRequirement($pizza_count, $people_count)
    {
        return $pizza_count * (($people_count * 20) + 200);
    }

    public function calculateSauceRequirement($pizza_count, $sauce_can_volume_ml)
    {
        $sauce_per_pizza_ml = 125;
        return ceil(($pizza_count * $sauce_per_pizza_ml) /
                    $sauce_can_volume_ml);
    }

    public function calculateCheeseCubeCoverage($cheese_cube_side_length, $pizza_thickness, $pizza_diameter)
    {
        return floor(($cheese_cube_side_length ** 3) / 
                     ($pizza_thickness * pi() * $pizza_diameter));
    }

    public function calculateLeftOverSlices($pizza_count, $friends_count)
    {
        $pieces_per_pizza = 8;
        return ($pizza_count * $pieces_per_pizza) % $friends_count;
    }
}
