module Sublist exposing (ListComparison(..), sublist, version)

import List

version : Int
version =
    2


type ListComparison
    = Equal
    | Superlist
    | Sublist
    | Unequal


sublist : List a -> List a -> ListComparison
sublist xs ys =
    let
        aOfB = isTrueSublist xs ys
        bOfA = isTrueSublist ys xs
    in
        case (aOfB, bOfA) of
            (True, True) -> Equal
            (True, False) -> Sublist
            (False, True) -> Superlist
            (False, False) -> Unequal

isTrueSublist : List a -> List a -> Bool
isTrueSublist xxs yys =
    case yys of
        [] ->
            xxs == []
        y::ys ->
            if isPrefixOf xxs yys then
                True
            else
                isTrueSublist xxs ys


isPrefixOf : List a -> List a -> Bool
isPrefixOf xxs yys =
    case (xxs, yys) of
        ([], _) ->
            True
        (_, []) ->
            False
        (x::xs, y::ys) ->
            if x /= y then
                False
            else
                isPrefixOf xs ys
