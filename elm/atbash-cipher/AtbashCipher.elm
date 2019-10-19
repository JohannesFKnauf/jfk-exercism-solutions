module AtbashCipher exposing (decode, encode)

import Dict

encode : String -> String
encode plain =
    plain
        |> String.filter Char.isAlphaNum
        |> String.toLower
        |> String.map atbash
        |> chopChunksOf 5
        |> String.join " "

decode : String -> String
decode cipher =
    cipher
        |> String.filter ((/=) ' ')
        |> String.map atbash

chopChunksOf : Int -> String -> List String
chopChunksOf n s =
    case s of
        "" -> []
        _ -> 
            let
                start = String.left 5 s
                rest = String.dropLeft 5 s
            in
                start :: (chopChunksOf n rest)
           
atbash : Char -> Char
atbash c =
    Dict.get c atbashMapping |> Maybe.withDefault '_'

atbashMapping : Dict.Dict Char Char
atbashMapping =
    alphabetCypherMapping ++ digitCypherMapping
        |> Dict.fromList

alphabetCypherMapping : List (Char, Char)
alphabetCypherMapping = 
    zip alphabet
        (List.reverse alphabet)

digitCypherMapping : List (Char, Char)
digitCypherMapping =
    zip digitsAsChar
        digitsAsChar

alphabet : List Char
alphabet =
    String.toList "abcdefghijklmnopqrstuvwxyz"

digitsAsChar : List Char
digitsAsChar =
    List.range 0 9
        |> List.map String.fromInt
        |> String.concat
        |> String.toList

zip =
    List.map2 (\x y -> (x, y))
