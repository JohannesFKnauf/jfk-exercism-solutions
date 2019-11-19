module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


allAllergies =
    [ Eggs
    , Peanuts
    , Shellfish
    , Strawberries
    , Tomatoes
    , Chocolate
    , Pollen
    , Cats
    ]


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    zip allAllergies (bitList score)
        |> find (hasAllergy allergy)
        |> (/=) Nothing


hasAllergy : Allergy -> ( Allergy, Int ) -> Bool
hasAllergy candidate ( allergy, scoreBit ) =
    candidate == allergy && scoreBit == 1


toList : Int -> List Allergy
toList score =
    zip allAllergies (bitList score)
        |> List.filter (Tuple.second >> (==) 1)
        |> List.map Tuple.first


zip : List a -> List b -> List ( a, b )
zip =
    List.map2 Tuple.pair


find : (a -> Bool) -> List a -> Maybe a
find pred xxs =
    case xxs of
        [] ->
            Nothing

        x :: xs ->
            if pred x then
                Just x

            else
                find pred xs


bitList : Int -> List Int
bitList int =
    case int of
        0 ->
            []

        a ->
            Bitwise.and a 1 :: (bitList <| Bitwise.shiftRightBy 1 a)
