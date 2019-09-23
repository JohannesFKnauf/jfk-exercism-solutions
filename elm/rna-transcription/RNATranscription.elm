module RNATranscription exposing (..)

import List
import String

toRNA : String -> Result Char String
toRNA dna =
    case String.uncons dna of
        Just (nextbase, restdna) ->
            case singleBaseToRna nextbase of
                Ok result ->
                    Result.map (String.cons result) (toRNA restdna)
                Err error ->
                    Err error
        Nothing ->
            Ok ""

singleBaseToRna base =
    case base of
        'A' -> Ok 'U'
        'C' -> Ok 'G'
        'G' -> Ok 'C'
        'T' -> Ok 'A'
        _ -> Err base

