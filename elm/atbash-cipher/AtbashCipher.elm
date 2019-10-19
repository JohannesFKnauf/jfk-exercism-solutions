module AtbashCipher exposing (decode, encode)

import Dict

encode : String -> String
encode plain =
    plain
        |> String.filter isAlphaNum
        |> String.toLower
        |> String.map retrieveMapping
        |> chopChunksOf 5
        |> String.join " "

decode : String -> String
decode cipher =
    cipher
        |> String.filter ((/=) ' ')
        |> String.map retrieveMapping


alphabet : List Char
alphabet =
    String.toList "abcdefghijklmnopqrstuvwxyz"

alphabetCypherMapping : List (Char, Char)
alphabetCypherMapping = 
    zip alphabet
        (List.reverse alphabet)

digitsAsChar : List Char
digitsAsChar =
    List.range 0 9
        |> List.map String.fromInt
        |> String.concat
        |> String.toList

digitCypherMapping : List (Char, Char)
digitCypherMapping =
    zip digitsAsChar
        digitsAsChar

cypherMapping : Dict.Dict Char Char
cypherMapping =
    alphabetCypherMapping ++ digitCypherMapping
        |> Dict.fromList

retrieveMapping : Char -> Char
retrieveMapping key =
    Dict.get key cypherMapping |> Maybe.withDefault '_'

zip =
    List.map2 (\x y -> (x, y))
          
chopChunksOf : Int -> String -> List String
chopChunksOf n s =
    if s == "" then []
    else
        let
            start = String.left 5 s
            rest = String.dropLeft 5 s
        in
            start :: (chopChunksOf n rest)
    

isAlphaNum : Char -> Bool
isAlphaNum =
    Char.isUpper
        |> liftA2 (||) Char.isLower
        |> liftA2 (||) Char.isDigit

liftA2 : (b -> b -> b) -> (a -> b) -> (a -> b) -> a -> b
liftA2 c f g x =
    c (f x) (g x)



