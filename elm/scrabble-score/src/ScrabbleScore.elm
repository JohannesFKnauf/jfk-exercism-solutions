module ScrabbleScore exposing (..)

import Dict exposing (Dict)


scoreWord : String -> Int
scoreWord =
    let
        letterScore letter = letterScores
                           |> Dict.get (Char.toUpper letter)
                           |> Maybe.withDefault 0
    in
        String.toList
            >> List.map letterScore
            >> List.sum


letterScores : Dict Char Int
letterScores = Dict.fromList [('A', 1),
                              ('E', 1),
                              ('I', 1),
                              ('O', 1),
                              ('U', 1),
                              ('L', 1),
                              ('N', 1),
                              ('R', 1),
                              ('S', 1),
                              ('T', 1),
                              ('D', 2),
                              ('G', 2),
                              ('B', 3),
                              ('M', 3),
                              ('P', 3),
                              ('F', 4),
                              ('H', 4),
                              ('V', 4),
                              ('W', 4),
                              ('Y', 4),
                              ('K', 5),
                              ('J', 8),
                              ('X', 8),
                              ('Q', 10),
                              ('Z', 10)]
