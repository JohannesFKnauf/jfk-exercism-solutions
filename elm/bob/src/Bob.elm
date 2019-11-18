module Bob exposing (..)

import String
import Char

type SentenceType = SayingNothing
                  | YellingQuestion
                  | AskingQuestion
                  | Yelling
                  | Other

hey : String -> String
hey s =
    case sentenceType s of
        SayingNothing ->
            "Fine. Be that way!"
        YellingQuestion ->
            "Calm down, I know what I'm doing!"
        AskingQuestion ->
            "Sure."
        Yelling ->
            "Whoa, chill out!"
        Other ->
            "Whatever."

sentenceType s =
    if isEmpty s then
        SayingNothing
    else if hasWordChar s && isAllUppercase s && endsInQuestionMark s then
        YellingQuestion
    else if hasWordChar s && isAllUppercase s then
        Yelling
    else if endsInQuestionMark s then
        AskingQuestion
    else
        Other

isEmpty =
    String.trim >> (==) ""

hasWordChar =
    String.any Char.isAlpha

isAllUppercase msg =
    String.toUpper msg == msg

endsInQuestionMark =
    String.trimRight >> String.endsWith "?"
