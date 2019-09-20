module SumOfMultiples exposing (..)

import List
import Set

sumOfMultiples : List Int -> Int -> Int
sumOfMultiples numbers limit =
    numbers
        |> List.map (allMultiplesUntil limit)
        |> List.concat
        |> Set.fromList
        |> Set.foldl (+) 0

allMultiplesUntil : Int -> Int -> List Int
allMultiplesUntil limit number =
    List.range 1 (maxFactorNotIncluding limit number)
        |> List.map (multiplyBy number)

maxFactorNotIncluding : Int -> Int -> Int
maxFactorNotIncluding limit number =
    (limit - 1) // number


multiplyBy : Int -> Int -> Int
multiplyBy factor number =
    factor * number
