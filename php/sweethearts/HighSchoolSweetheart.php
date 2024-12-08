<?php

class HighSchoolSweetheart
{
    public function firstLetter(string $name): string
    {
        return substr(trim($name), 0, 1);
    }

    public function initial(string $name): string
    {
        return strtoupper($this->firstLetter($name) . '.');
    }

    public function initials(string $name): string
    {
        $names = explode(' ', $name);
        $initials = array_map(function ($name) {
            return $this->initial($name);
        }, $names);
        
        return implode(' ', $initials);
    }

    public function pair(string $sweetheart_a, string $sweetheart_b): string
    {
        $in_a = $this->initials($sweetheart_a);
        $in_b = $this->initials($sweetheart_b);
        
        $heart = '';
        $heart .= <<<EOD
                 ******       ******
               **      **   **      **
             **         ** **         **
            **            *            **
            **                         **
            **     $in_a  +  $in_b     **
             **                       **
               **                   **
                 **               **
                   **           **
                     **       **
                       **   **
                         ***
                          *
            EOD;

        return $heart;
    }
}
