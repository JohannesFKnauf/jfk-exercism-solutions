module WordCount exposing (..)

import Dict
import Maybe


        
wordCount : String -> Dict.Dict String Int
wordCount sentence =
    sentence
        |> String.toLower
        |> String.filter (\a -> Char.isAlphaNum a || a == ' ')
        |> String.words
        |> accumulateWordCount

accumulateWordCount =
    List.foldr incrementWordCount Dict.empty
        
incrementWordCount : String -> Dict.Dict String Int -> Dict.Dict String Int
incrementWordCount key map =
    let
        cur = Dict.get key map
        next = Maybe.withDefault 0 cur + 1
    in
        Dict.insert key next map
