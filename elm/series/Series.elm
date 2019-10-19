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
takes n l =
    case l of
        [] -> []
        x::xs -> (take n l) :: takes n xs

take : Int -> List a -> List a
take n l =
    case n of
        0 -> []
        _ -> case l of
                 [] -> []
                 x::xs -> x :: take (n-1) xs

intResultFromChar : Char -> Result String Int
intResultFromChar char =
    char
        |> String.fromChar
        |> String.toInt
        |> Result.fromMaybe ("Error parsing number from char: " ++ String.fromChar char)

singleton : a -> List a
singleton a =
    [a]


sequenceResult : List (Result a b) -> Result a (List b)
sequenceResult lst =
    case lst of
        x :: xs -> x
                |> Result.andThen (\xval -> (sequenceResult xs)
                                  |> Result.andThen (\xsval -> Ok (xval::xsval)))
        [] -> Ok []
