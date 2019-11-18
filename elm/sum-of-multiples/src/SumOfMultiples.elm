module SumOfMultiples exposing (..)

import List

-- sumOfMultiples leveraging Gauss's trick
-- the sum of all numbers 1..n = n * (n + 1) / 2
-- the sum of the multiples of a single number n until including limit l hence is
--     n, 2*n, ..., n * l // n
--   = n * (sum 1 .. l // n)
--      substituting with Gauss
--   = n * ( (l // n) * (l // n + 1) // 2)
--
-- in case of two or more numbers we have to account for double counting of common multiples after adding the terms for the individual numbers for each pair of numbers
--
-- in case of three or more numbers, we have to account for double removing of common multiples during the double counting correcture for each triple of numbers
--
-- etc. pp.

sumOfMultiples : List Int -> Int -> Int
sumOfMultiples numbers limit =
    numbers
        |> combinations
        |> List.map (gaussTerm limit)
        |> List.sum

-- gaussTerm calculates a single summand in the sum of Gauss terms
gaussTerm : Int -> List Int -> Int
gaussTerm limit combination =
    case combination of
        [] -> 0
        ns ->
            let
                sign = (-1) ^ (1 + List.length ns)
                lcmCombined = List.foldl lcm 1
                factor = lcmCombined ns
                summandCount = (limit - 1) // factor
                total = factor * summandCount * (summandCount + 1) // 2
            in
                sign * total

combinations : List Int -> List (List Int)
combinations elements =
    case elements of
        [] -> [[]]
        x::xs -> List.map ((::) x) (combinations xs) ++ (combinations xs)
                 
lcm : Int -> Int -> Int
lcm a b =
    (a * b) // (gcd a b)

gcd : Int -> Int -> Int
gcd a b =
    case b of
        0 -> a
        otherwise -> gcd b (modBy b a)
