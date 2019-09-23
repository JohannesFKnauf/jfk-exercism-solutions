module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer name =
    case name of
        Just xs -> "One for " ++ xs ++ ", one for me."
        Nothing -> twoFer (Just "you")
