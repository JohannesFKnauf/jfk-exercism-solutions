module TwelveDays exposing (recite)

import List

recite : Int -> Int -> List String
recite start stop =
    List.range start stop
        |> List.map stanza
        

stanza : Int -> String
stanza n =
    prefix n ++ accumulateGifts n

accumulateGifts : Int -> String
accumulateGifts n =
    case n of
        1 -> nthgift n ++ "."
        2 -> nthgift n ++ ", and " ++ accumulateGifts (n - 1)
        _ -> nthgift n ++ ", " ++ accumulateGifts (n - 1)

prefix : Int -> String
prefix n =
    "On the " ++ nthword n ++ " day of Christmas my true love gave to me: "

nthword : Int -> String
nthword n =
    case n of
        1 -> "first"
        2 -> "second"
        3 -> "third"
        4 -> "fourth"
        5 -> "fifth"
        6 -> "sixth"
        7 -> "seventh"
        8 -> "eighth"
        9 -> "ninth"
        10 -> "tenth"
        11 -> "eleventh"
        12 -> "twelfth"
        _ -> ""

nthgift : Int -> String
nthgift n =
    case n of
        1 -> "a Partridge in a Pear Tree"
        2 -> "two Turtle Doves"
        3 -> "three French Hens"
        4 -> "four Calling Birds"
        5 -> "five Gold Rings"
        6 -> "six Geese-a-Laying"
        7 -> "seven Swans-a-Swimming"
        8 -> "eight Maids-a-Milking"
        9 -> "nine Ladies Dancing"
        10 -> "ten Lords-a-Leaping"
        11 -> "eleven Pipers Piping"
        12 -> "twelve Drummers Drumming"
        _ -> ""
