module Say exposing (SayError(..), say)

import Dict
import Maybe

type SayError
    = Negative
    | TooLarge

say : Int -> Result SayError String
say number =
    Ok number
        |> Result.andThen excludeNegative
        |> Result.andThen excludeLarge
        |> Result.andThen (splitIntoTriples >> Ok)
        |> Result.andThen (flip zip powerWords >> List.reverse >> Ok)
        |> Result.andThen (safesayTriples >> Ok)

excludeNegative number =
    if number < 0 then
        Err Negative
    else
        Ok number

excludeLarge number =
    if number > 999999999999 then
        Err TooLarge
    else
        Ok number

splitIntoTriples : Int -> List Int
splitIntoTriples number =
    let
        head = number // 1000
        lastTriple = number % 1000
    in
        if head > 0 then
            lastTriple :: (splitIntoTriples head)
        else
            lastTriple :: []

                
safesayTriples : List (Int, String) -> String
safesayTriples =
    List.concatMap safesayTriplePair >> String.join " "

safesayTriplePair : (Int, String) -> List String
safesayTriplePair triplePair =
    let
        ( triple, powerWord ) = triplePair
    in
        if triple > 0 then
            if powerWord /= "" then
                [(safesayTriple triple), powerWord]
            else
                [(safesayTriple triple)]
        else
            []

safesayTriple : Int -> String
safesayTriple number =
    let
        triple = number % 1000
    in
        case hundreds triple of
            0 -> safesaySecondLastDigits number
            _ -> (safesaySingleDigit <| hundreds triple) ++ " hundred" ++ (andPrefix <| safesaySecondLastDigits number)

andPrefix : String -> String
andPrefix numWord =
    if numWord == "" then
        numWord
    else
        " and " ++ numWord

twoDigitNumberWords : Dict.Dict Int String
twoDigitNumberWords = Dict.fromList [
                       (0, ""),
                       (1, "one"),
                       (2, "two"),
                       (3, "three"),
                       (4, "four"),
                       (5, "five"),
                       (6, "six"),
                       (7, "seven"),
                       (8, "eight"),
                       (9, "nine"),
                       (10, "ten"),
                       (11, "eleven"),
                       (12, "twelve"),
                       (13, "thirteen"),
                       (14, "fourteen"),
                       (15, "tifteen"),
                       (16, "sixteen"),
                       (17, "seventeen"),
                       (18, "eighteen"),
                       (19, "nineteen"),
                       (20, "twenty"),
                       (30, "thirty"),
                       (40, "fourty"),
                       (50, "fifty"),
                       (60, "sixty"),
                       (70, "seventy"),
                       (80, "eighty"),
                       (90, "ninety")
                      ]
                   
powerWords = [
               "",
               "thousand",
               "million",
               "billion"
              ]

safesaySingleDigit : Int -> String
safesaySingleDigit number =
    let
        singleDigit = number % 10
        fixedWord = Dict.get singleDigit twoDigitNumberWords
    in
        Maybe.withDefault "" fixedWord

                       
safesaySecondLastDigits : Int -> String
safesaySecondLastDigits number =
    let
        secondLastDigits = number % 100
        fixedWord = Dict.get secondLastDigits twoDigitNumberWords
    in
        case fixedWord of
            Just x -> x
            Nothing -> (safesaySecondLastDigits <| (*) 10 <| tens <| number) ++ "-" ++ (safesaySecondLastDigits <| ones <| number)

                       
hundreds : Int -> Int
hundreds =
     ns 100

tens : Int -> Int
tens =
    ns 10

ones : Int -> Int
ones =
    ns 1

ns n =
    flip (//) n
        >> flip (%) 10


zip : List a -> List b -> List (a, b)
zip =
    List.map2 (,)
