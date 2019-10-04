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

check : String -> String -> Bool
check =
    Regex.fromString >> safeRegex >> Regex.contains

isEmpty : String -> Bool
isEmpty =
    check "^[ \u{000D}\t\n]*$"

isAllUppercase : String -> Bool
isAllUppercase msg =
    check "[A-Z]" msg && String.toUpper msg == msg

hasEndingQuestionMark : String -> Bool
hasEndingQuestionMark =
    check "\\?[ \t\n]*$"
                   
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
