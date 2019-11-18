module Anagram exposing (..)

detect : String -> List String -> List String
detect word candidates =
    let
        notSameWord a = String.toLower a /= String.toLower word
        canonicalize = String.toLower >> String.toList >> List.sort
        sameChars a = canonicalize a == canonicalize word
    in
        candidates
            |> List.filter notSameWord
            |> List.filter sameChars
