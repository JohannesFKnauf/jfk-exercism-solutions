module NucleotideCount exposing (nucleotideCounts, version)

import Char

version : Int
version =
    2


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> NucleotideCounts
nucleotideCounts sequence =
    let
        empty = NucleotideCounts 0 0 0 0
        inc nuc cnt = case Char.toLower nuc of
                          'a' -> { cnt | a = cnt.a + 1 }
                          't' -> { cnt | t = cnt.t + 1 }
                          'c' -> { cnt | c = cnt.c + 1 }
                          'g' -> { cnt | g = cnt.g + 1 }
                          _ -> cnt
    in
        sequence
            |> String.toList
            |> List.foldl inc empty
      

