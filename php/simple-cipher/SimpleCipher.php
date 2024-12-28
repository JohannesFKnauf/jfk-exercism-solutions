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

class SimpleCipher
{
    public string $key;
    
    public function __construct(string $key = null)
    {
        if (is_null($key)) {
            $this->key = self::randomKey();
        } else if (!preg_match('/\A[a-z]+\z/', $key) || empty($key)) {
            throw new InvalidArgumentException('key may be composed only of lower case letters');
        } else {
            $this->key = $key;
        }
    }

    public function encode(string $plainText): string
    {
        return $this->shift($plainText, 1);
    }

    public function decode(string $cipherText): string
    {
        return $this->shift($cipherText, -1);
    }

    public function shift(string $text, int $direction): string {
        $shifted = '';
        
        for($i = 0; $i < strlen($text); $i++) {
            $key = ord($this->key[$i]) - ord('a');
            $letter = ord($text[$i]) - ord('a');
            $offset = ($letter + $direction * $key + 26) % 26;
            $shifted .= chr(ord('a') + $offset);
        }
        
        return $shifted;
    }

    private static function randomKey(): string {
        $length = 100;
        $key = '';

        for ($i = 0; $i < $length; $i++) {
            $key .= chr(random_int(ord('a'), ord('z')));
        }

        return $key;
    }
}
