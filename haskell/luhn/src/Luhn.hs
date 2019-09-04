module Luhn (isValid) where

import Data.Char (isSpace, digitToInt)

isValid :: String -> Bool
isValid = luhn . digits

luhn :: [Int] -> Bool
luhn [] = False
luhn [0] = False
luhn xs = divisibleBy 10 . sum . map luhnifyPair . pairs . reverse $ xs
  where
    luhnifyPair (x, y) | y > 4 = x + (2*y - 9)
                       | otherwise = x + (2*y)

digits :: String -> [Int]
digits = map digitToInt . filter (not . isSpace)

pairs :: Num a => [a] -> [(a, a)]
pairs [] = []
pairs [x] = [(x, 0)]
pairs (x:y:xs) = (x,y) : pairs xs

divisibleBy :: Int -> Int -> Bool
divisibleBy d i = i `rem` d == 0
