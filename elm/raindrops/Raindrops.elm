module Raindrops exposing (raindrops)

        
raindrops : Int -> String
raindrops number =
    let
        ifDivisibleBy divisor msg candidate = if remainderBy divisor candidate == 0 then msg else ""
        pling = ifDivisibleBy 3 "Pling"
        plang = ifDivisibleBy 5 "Plang"
        plong = ifDivisibleBy 7 "Plong"
        applyTo x f = f x
        plingplangplong = [pling, plang, plong] |>
                              List.map (applyTo number) |>
                              String.concat
    in
        case plingplangplong of
            "" ->
                String.fromInt number
            _ ->
                plingplangplong
