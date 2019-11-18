module Strain exposing (discard, keep)

keep : (t -> Bool) -> List t -> List t
keep condition list =
    case list of
        head::tail -> case condition head of
                          True -> head :: keep condition tail
                          False -> keep condition tail
        [] -> []


discard : (t -> Bool) -> List t -> List t
discard condition =
    keep (not << condition)
