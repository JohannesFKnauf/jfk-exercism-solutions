<?php

class LuckyNumbers
{
    public function sumUp(array $digitsOfNumber1, array $digitsOfNumber2): int
    {
        return self::asInt($digitsOfNumber1) + self::asInt($digitsOfNumber2);
    }

    public static function asInt(array $digits): int {
        $number = 0;
        $posValue = 1;
        foreach (array_reverse($digits) as $digit) {
            $number += $digit * $posValue;
            $posValue *= 10;
        }
        return $number;
    }

    public function isPalindrome(int $number): bool
    {
        return self::asArray($number) == array_reverse(self::asArray($number));
    }

    public static function asArray(int $number): array
    {
        $digits = [];
        $digit = $number % 10;
        $digits[] = $digit;
        $x = intdiv($number, 10);
        while ($x > 0) {
            $digits[] = $x % 10;
            $x = intdiv($x, 10);
        }
        return array_reverse($digits);
    }

    public function validate(string $input): string
    {
        if ($input == '') {
            return 'Required field';
        }
        if ((int) $input <= 0) {
            return 'Must be a whole number larger than 0';
        }

        return '';
    }
}
