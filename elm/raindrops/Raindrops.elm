module Raindrops exposing (raindrops)


ifDivisibleReturn : Int -> Int -> String -> String
ifDivisibleReturn divisor candidate msg =
    case remainderBy divisor candidate of
        0 ->
            msg
        _ ->
            ""

pling : Int -> String
pling number =
    ifDivisibleReturn 3 number "Pling"

plang : Int -> String
plang number =
    ifDivisibleReturn 5 number "Plang"

plong : Int -> String
plong number =
    ifDivisibleReturn 7 number "Plong"

raindrops : Int -> String
raindrops number =
    let
        plingplangplong = pling number ++ plang number ++ plong number
    in
        case plingplangplong of
            "" ->
                String.fromInt number
            _ ->
                plingplangplong
