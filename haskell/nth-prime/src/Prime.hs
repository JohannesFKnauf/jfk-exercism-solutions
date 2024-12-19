module Prime (nth) where

doesntDivide :: Integer -> Integer -> Bool
doesntDivide divisor dividend =
  dividend `mod` divisor /= 0

erathostenes :: [Integer] -> [Integer]
erathostenes [] = []
erathostenes (prime : candidates) = prime : erathostenes [ candidate | candidate <- candidates, prime `doesntDivide` candidate ]

primes :: [Integer]
primes = erathostenes [2 .. ]

nth :: Int -> Maybe Integer
nth n
  | n <= 0 = Nothing
  | otherwise = Just $ primes !! (n-1)
