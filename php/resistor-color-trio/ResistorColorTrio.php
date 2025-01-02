<?php

/*
 * By adding type hints and enabling strict type checking, code can become
 * easier to read, self-documenting and reduce the number of potential bugs.
 * By default, type declarations are non-strict, which means they will attempt
 * to change the original type to match the type specified by the
 * type-declaration.
 *
 * In other words, if you pass a string to a function requiring a float,
 * it will attempt to convert the string value to a float.
 *
 * To enable strict mode, a single declare directive must be placed at the top
 * of the file.
 * This means that the strictness of typing is configured on a per-file basis.
 * This directive not only affects the type declarations of parameters, but also
 * a function's return type.
 *
 * For more info review the Concept on strict type checking in the PHP track
 * <link>.
 *
 * To disable strict typing, comment out the directive below.
 */

declare(strict_types=1);

class ResistorColorTrio
{
    private static $color_values = [
        'black',
        'brown',
        'red',
        'orange',
        'yellow',
        'green',
        'blue',
        'violet',
        'grey',
        'white',
    ];

    private static $magnitude_terms = [
        'ohms',
        'kiloohms',
        'megaohms',
        'gigaohms',
    ];

    public function label(array $colors): string
    {
        $value10 = array_search($colors[0], self::$color_values);
        $value1 = array_search($colors[1], self::$color_values);
        $exponent = array_search($colors[2], self::$color_values);

        $value = ($value10 * 10 + $value1) * 10**$exponent;

        $magnitude = 0;
        while (($value > 0) &&
               ($value % 1000 == 0)) {
            $value /= 1000;
            $magnitude++;
        }
        
        return $value . ' ' . self::$magnitude_terms[$magnitude];
    }
}
