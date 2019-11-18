module Leap exposing (..)

isLeapYear : Int -> Bool
isLeapYear year =
    if divisibleBy 400 year then True
    else if divisibleBy 100 year then False
    else if divisibleBy 4 year then True
    else False

divisibleBy : Int -> Int -> Bool
divisibleBy a b =
    remainderBy a b == 0
