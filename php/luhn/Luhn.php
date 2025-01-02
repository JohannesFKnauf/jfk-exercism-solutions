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

function isValid(string $number): bool
{
    // strip all whitespace
    $number = preg_replace('/\s+/', '', $number);

    // guard condition: only digits remain
    if (preg_match('/[^0-9]/', $number)) {
        return false;
    }

    $num_digits = strlen($number);
    if ($num_digits == 1) {
        return false;
    }

    $odd = true;
    $checksum = 0;

    // iterating from right to left
    for ($i = $num_digits - 1; $i >= 0; $i--) {
        $x = (int) $number[$i];
        if ($odd) {
            $checksum += $x;
        } else {
            $double = $x * 2;
            $checksum += $double > 9 ? $double - 9 : $double;
        }
        $odd = !$odd;
    }
    return ($checksum % 10 == 0);
}
