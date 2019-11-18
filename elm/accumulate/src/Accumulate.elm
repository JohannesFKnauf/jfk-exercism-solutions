module Accumulate exposing (..)


accumulate : (t -> t) -> List t -> List t
accumulate f xxs =
    case xxs of
        [] ->
            []
                
        x::xs ->
            (f x) :: (accumulate f xs)
