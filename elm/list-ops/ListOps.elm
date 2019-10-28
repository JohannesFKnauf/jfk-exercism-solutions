module ListOps
    exposing
        ( append
        , concat
        , filter
        , foldl
        , foldr
        , length
        , map
        , reverse
        )


length : List a -> Int
length list =
    let
        inc _ acc = acc + 1
    in
        foldl inc 0 list

reverse : List a -> List a
reverse list =
    foldl (::) [] list

foldl : (a -> b -> b) -> b -> List a -> b
foldl f acc list =
    case list of
        [] -> acc
        x::xs -> foldl f (f x acc) xs

foldr : (a -> b -> b) -> b -> List a -> b
foldr f acc list =
    list
        |> reverse
        |> foldl f acc

map : (a -> b) -> List a -> List b
map f list =
    foldr (f >> (::)) [] list

filter : (a -> Bool) -> List a -> List a
filter pred list =
    let
        appendIf p x acc = if p x then x::acc else acc
    in
        foldr (appendIf pred) [] list

append : List a -> List a -> List a
append xs ys =
    foldr (::) ys xs

concat : List (List a) -> List a
concat list =
    foldr append [] list
