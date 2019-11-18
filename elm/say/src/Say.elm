module Say exposing (SayError(..), say)

import Dict
import Maybe

type SayError
    = Negative
    | TooLarge

say : Int -> Result SayError String
say number =
    if number == 0 then
        Ok "zero"
    else
        Ok number
            |> Result.andThen excludeNegative
            |> Result.andThen excludeLarge
            |> Result.andThen (splitIntoTriples >> Ok)
            |> Result.andThen (flip zip powerWords >> Ok)
            |> Result.andThen (List.reverse >> Ok)
            |> Result.andThen (List.concatMap tripleWords >> Ok)
            |> Result.andThen (List.filter ((/=) "") >> Ok)
            |> Result.andThen (stripLeadingAnds >> Ok)
            |> Result.andThen (String.join " " >> Ok)

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

stripLeadingAnds : List String -> List String
stripLeadingAnds list =
    case list of
        [] -> []
        x :: xs -> if x == "and" then
                       xs
                   else
                       list
            
splitIntoTriples : Int -> List Int
splitIntoTriples number =
    let
        head = number // 1000
        lastTriple = remainderBy 1000 number
    in
        if head > 0 then
            lastTriple :: (splitIntoTriples head)
        else
            lastTriple :: []

tripleWords : (Int, String) -> List String
tripleWords triplePair =
    let
        (triple, powerWord) = triplePair
    in
        if triple == 0 then
            []
        else
            sayTriple triple powerWord
    

sayTriple : Int -> String -> List String
sayTriple number powerWord =
    let
        hundredsSaid = sayHundreds number
        hundredsSaidAugmented = case hundredsSaid of
                                      Nothing -> []
                                      Just word -> [word, "hundred"]
        secondLastSaid = saySecondLast number
        secondLastSaidAugmented = case secondLastSaid of
                                      Nothing -> []
                                      Just word -> case hundredsSaidAugmented of
                                                       [] -> if powerWord == "" then 
                                                                 ["and", word]
                                                             else
                                                                 [word]
                                                       a -> ["and", word]
    in
        hundredsSaidAugmented ++ secondLastSaidAugmented ++ [powerWord]

sayHundreds : Int -> Maybe String
sayHundreds number =
    let
        toSay = hundreds number
        singleDigit = remainderBy 10 toSay
        fixedWord = Dict.get singleDigit twoDigitNumberWords
    in
        if singleDigit == 0 then
            Nothing
        else
            fixedWord

saySecondLast : Int -> Maybe String
saySecondLast number =
    let
        digits = remainderBy 100 number
        secondLast = saySecondLastDigits digits
    in
        if secondLast == "" then
            Nothing
        else
            Just secondLast

safesaySingleDigit : Int -> String
safesaySingleDigit number =
    let
        singleDigit = remainderBy 10 number
        fixedWord = Dict.get singleDigit twoDigitNumberWords
    in
        Maybe.withDefault "" fixedWord

                       
saySecondLastDigits : Int -> String
saySecondLastDigits number =
    let
        secondLastDigits = remainderBy 100 number
        fixedWord = Dict.get secondLastDigits twoDigitNumberWords
    in
        case fixedWord of
            Just x -> x
            Nothing -> let
                           tensSaid = (saySecondLastDigits <| (*) 10 <| tens <| number)
                           onesSaid = (saySecondLastDigits <| ones <| number)
                       in
                           tensSaid ++ "-" ++ onesSaid

                       
hundreds : Int -> Int
hundreds =
     ns 100

tens : Int -> Int
tens =
    ns 10

ones : Int -> Int
ones =
    ns 1

ns n x =
    x // n |> remainderBy 10

flip : (a -> b -> c) -> (b -> a -> c)
flip f a b =
    f b a

zip : List a -> List b -> List (a, b)
zip =
    List.map2 Tuple.pair

        
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
                       (40, "forty"),
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
