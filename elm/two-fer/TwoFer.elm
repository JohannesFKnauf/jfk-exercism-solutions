module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer name =
    let
        greetee = Maybe.withDefault "you" name
    in
        "One for " ++ greetee ++ ", one for me."
