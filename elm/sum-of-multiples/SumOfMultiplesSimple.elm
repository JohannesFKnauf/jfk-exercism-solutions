module SumOfMultiplesSimple exposing (..)

import List

sumOfMultiples : List Int -> Int -> Int
sumOfMultiples numbers limit =
    List.range 1 (limit - 1)
        |> List.filter (multipleOfAny numbers)
        |> List.sum

multipleOfAny : List Int -> Int -> Bool
multipleOfAny numbers n =
    List.any (divisorOf n) numbers

divisorOf : Int -> Int -> Bool
divisorOf n x =
    modBy x n == 0
