module Bob exposing (..)

import String
import Regex

type MatchResult = SayNothing
    | ForcefulQuestion
    | Yelling
    | Asking
    | NoMatch

safeRegex re =
    Maybe.withDefault Regex.never re

isEmpty : String -> Bool
isEmpty msg =
    let
        re = Regex.fromString "^[ \u{000D}\t\n]*$" |> safeRegex
    in
        Regex.contains re msg

isAllUppercase : String -> Bool
isAllUppercase msg =
    let
        re = Regex.fromString "[A-Z]" |> safeRegex
    in
        Regex.contains re msg && String.toUpper msg == msg

hasEndingQuestionMark : String -> Bool
hasEndingQuestionMark msg =
    let
        re = Regex.fromString "\\?[ \t\n]*$" |> safeRegex
    in
        Regex.contains re msg
                   
classify : String -> MatchResult
classify msg =
    if isEmpty msg then SayNothing
    else if isAllUppercase msg && hasEndingQuestionMark msg then ForcefulQuestion
    else if isAllUppercase msg then Yelling
    else if hasEndingQuestionMark msg then Asking
    else NoMatch

hey : String -> String
hey msg =
    case classify msg of
        Yelling ->
            "Whoa, chill out!"
        ForcefulQuestion ->
            "Calm down, I know what I'm doing!"
        Asking ->
            "Sure."
        SayNothing ->
            "Fine. Be that way!"
        _ ->
            "Whatever."
