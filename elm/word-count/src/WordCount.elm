module WordCount exposing (..)

import Dict
import Maybe


        
wordCount : String -> Dict.Dict String Int
wordCount sentence =
    let
        isValidChar a = Char.isAlphaNum a || a == ' '
        incWithDefault = Maybe.withDefault 0 >> (+) 1 >> Just
        inc key = Dict.update key incWithDefault
    in
        sentence
            |> String.toLower
            |> String.filter isValidChar
            |> String.words
            |> List.foldl inc Dict.empty
