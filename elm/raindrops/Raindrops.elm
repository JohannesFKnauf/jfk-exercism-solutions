module Raindrops exposing (raindrops)

        
raindrops : Int -> String
raindrops number =
    let
        pling = ifDivisibleBy 3 "Pling"
        plang = ifDivisibleBy 5 "Plang"
        plong = ifDivisibleBy 7 "Plong"
        applySoundTo x f = f x
        plingplangplong = [pling, plang, plong] |>
                              List.map (applySoundTo number) |>
                              String.concat
    in
        case plingplangplong of
            "" ->
                String.fromInt number
            _ ->
                plingplangplong

ifDivisibleBy : Int -> String -> Int -> String
ifDivisibleBy divisor msg candidate =
    if remainderBy divisor candidate == 0
    then msg
    else ""
