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
incrementWordCount key =
    Dict.update key incrementWithDefault

incrementWithDefault : Maybe Int -> Maybe Int
incrementWithDefault num =
    (Maybe.withDefault 0 num) + 1
        |> Just
