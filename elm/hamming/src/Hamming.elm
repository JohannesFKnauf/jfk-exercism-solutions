module Hamming exposing (..)

import List
import String

distance : String -> String -> Result String Int
distance xs ys =
    if (String.length xs) /= (String.length ys) then
        Err "left and right strands must be of equal length"
    else
        List.map2 (/=) (String.toList xs) (String.toList ys)
            |> List.filter identity
            |> List.length
            |> Ok
