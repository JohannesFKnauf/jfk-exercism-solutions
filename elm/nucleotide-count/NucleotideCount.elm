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
    sequence
        |> String.toList
        |> List.foldl incNucleotid zeroNucleotideCounts
      

zeroNucleotideCounts =
    { a=0
    , t=0
    , c=0
    , g=0
    }

incNucleotid : Char -> NucleotideCounts -> NucleotideCounts
incNucleotid nucleotid nucleotidCount =
    let
        incA = { nucleotidCount | a = nucleotidCount.a + 1 }
        incT = { nucleotidCount | t = nucleotidCount.t + 1 }
        incC = { nucleotidCount | c = nucleotidCount.c + 1 }
        incG = { nucleotidCount | g = nucleotidCount.g + 1 }
    in
        case Char.toLower nucleotid of
            'a' -> incA
            't' -> incT
            'c' -> incC
            'g' -> incG
            _ -> nucleotidCount
