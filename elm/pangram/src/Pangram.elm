module Pangram exposing (..)

import Set

isPangram : String -> Bool
isPangram text =
    text
        |> String.toList
        |> Set.fromList
        |> Set.map Char.toLower
        |> Set.filter Char.isAlpha
        |> Set.size
        |> (==) 26
