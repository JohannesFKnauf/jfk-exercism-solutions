module DifferenceOfSquares exposing (..)

import List

squareOfSum : Int -> Int
squareOfSum num =
    (num * (num + 1) // 2)^2
        
sumOfSquares : Int -> Int
sumOfSquares num =
    List.range 1 num
        |> List.map (\n -> n^2)
        |> List.sum
               
difference : Int -> Int
difference num =
    (squareOfSum num) - (sumOfSquares num)
