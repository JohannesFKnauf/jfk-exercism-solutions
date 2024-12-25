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

class Tournament
{
    public function __construct()
    {
    }

    public function tally(string $scores): string
    {
        $results = [];
        $matches = $scores == '' ? [] : explode("\n", $scores);
        foreach ($matches as $match) {
            list($team1, $team2, $result) = explode(';', $match);
            $results[$team1] ??= [
                'Team' => $team1,
                'MP' => 0,
                'W' => 0,
                'D' => 0,
                'L' => 0,
                'P' => 0,
            ];
            $results[$team2] ??= [
                'Team' => $team2,
                'MP' => 0,
                'W' => 0,
                'D' => 0,
                'L' => 0,
                'P' => 0,
            ];
            
            $results[$team1]['MP'] += 1;
            $results[$team2]['MP'] += 1;
            switch ($result) {
            case 'win':
                $results[$team1]['W'] += 1;
                $results[$team1]['P'] += 3;
                $results[$team2]['L'] += 1;
                break;
            case 'draw':
                $results[$team1]['D'] += 1;
                $results[$team1]['P'] += 1;
                $results[$team2]['D'] += 1;
                $results[$team2]['P'] += 1;
                break;
            case 'loss':
                $results[$team1]['L'] += 1;
                $results[$team2]['W'] += 1;
                $results[$team2]['P'] += 3;
                break;
            }
        }

        $format = '%-30s | %2d | %2d | %2d | %2d | %2d';
        $report = 'Team                           | MP |  W |  D |  L |  P';
        uasort($results, 'Tournament::compareTeams');
        foreach ($results as $team=>$result) {
            extract($result);
            
            $report .= "\n";
            $report .= sprintf($format, $team, $MP, $W, $D, $L, $P);

        }
        return $report;
    }

    private static function compareTeams(array $a, array $b): int {
        if ($a['P'] < $b['P']) {
            return 1;
        } else if ($a['P'] > $b['P']) {
            return -1;
        }

        if ($a['Team'] < $b['Team']) {
            return -1;
        } else if ($a['Team'] > $b['Team']) {
            return 1;
        }
        return 0;
    }
}
