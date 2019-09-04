module CollatzConjecture (collatz) where

import Data.List (genericLength)

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = Just . genericLength $ collatzSeries n

collatzSeries :: Integer -> [Integer]
collatzSeries = takeWhile (/= 1) . iterate next
  where
    next i
      | even i = i `div` 2
      | otherwise = 3 * i + 1
