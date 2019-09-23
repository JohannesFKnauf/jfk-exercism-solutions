module RNATranscription exposing (..)

toRNA : String -> Result Char String
toRNA dna =
    String.foldr (Result.map2 String.cons << baseToRna) (Ok "") dna

baseToRna base =
    case base of
        'A' -> Ok 'U'
        'C' -> Ok 'G'
        'G' -> Ok 'C'
        'T' -> Ok 'A'
        _ -> Err base

