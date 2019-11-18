module RunLengthEncoding exposing (decode, encode)

encode : String -> String
encode code =
    case String.uncons code of
        Just (next, rest) -> decumulate 1 next rest
        Nothing -> ""

decumulate : Int -> Char -> String -> String
decumulate dec cur code =
    case String.uncons code of
        Just (next, rest) ->
            if next == cur then
                decumulate (dec + 1) cur rest
            else
                (quantifier dec) ++ (String.fromChar cur) ++ (decumulate 1 next rest)
        Nothing ->
            (quantifier dec) ++ (String.fromChar cur)

quantifier : Int -> String
quantifier dec =
    if dec > 1 then
        Debug.toString dec
    else
        ""

decode : String -> String
decode code =
    case String.uncons code of
        Just (next, rest) ->
            if Char.isDigit next then
                accumulateQuantifier (String.fromChar next) rest
            else
                String.cons next (decode rest)
        Nothing -> ""

accumulateQuantifier : String -> String -> String
accumulateQuantifier acc code =
    case String.uncons code of
        Just (next, rest) ->
            if Char.isDigit next then
                accumulateQuantifier (acc ++ (String.fromChar next)) rest
            else
                expandQuantifier acc next ++ (decode rest)
        Nothing -> ""

expandQuantifier acc char =
    char
        |> String.fromChar
        |> String.repeat (accToInt acc)
                   
accToInt : String -> Int
accToInt acc =
    case String.toInt acc of
        Just num -> num
        Nothing -> 0
