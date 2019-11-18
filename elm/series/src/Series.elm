module Series exposing (slices)

import Result

slices : Int -> String -> Result String (List (List Int))
slices size input =
    if size == 0 then Err "slice length cannot be zero"
    else if size < 0 then Err "slice length cannot be negative"
    else if String.length input == 0 then Err "series cannot be empty"
    else if size > String.length input then Err "slice length cannot be greater than series length"
    else
        input
            |> String.toList
            |> List.map intResultFromChar
            |> sequenceResult
            |> Result.andThen (Ok << takes size)
            |> Result.andThen (Ok << (List.filter ((==) size << List.length)))

takes : Int -> List a -> List (List a)
takes n xxs =
    case xxs of
        [] -> []
        x::xs -> (List.take n xxs) :: takes n xs

intResultFromChar : Char -> Result String Int
intResultFromChar char =
    char
        |> String.fromChar
        |> String.toInt
        |> Result.fromMaybe ("Error parsing number from char: " ++ String.fromChar char)

sequenceResult : List (Result a b) -> Result a (List b)
sequenceResult xxs =
    let
        extendOk x xs = Ok (x::xs)
        sequenceStep xs x = sequenceResult xs |> Result.andThen (extendOk x)
        extendResult xs = Result.andThen (sequenceStep xs)
    in
        case xxs of
            x::xs -> x |> extendResult xs
            [] -> Ok []
