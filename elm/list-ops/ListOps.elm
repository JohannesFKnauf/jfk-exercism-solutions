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
length =
    let
        inc _ acc = acc + 1
    in
        foldl inc 0

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
    case list of
        [] -> []
        x::xs -> (f x)::(map f xs)

filter : (a -> Bool) -> List a -> List a
filter pred list =
    case list of
        [] -> []
        x::xs -> if pred x then
                     x::(filter pred xs)
                 else
                     (filter pred xs)

append : List a -> List a -> List a
append xxs ys =
    case xxs of
        [] -> ys
        x::xs -> x::(append xs ys)

concat : List (List a) -> List a
concat list =
    foldr append [] list
