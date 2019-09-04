module SumOfMultiples (sumOfMultiples) where

import qualified Data.Set as Set

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ Set.fromList $ allMultiples
  where
    multiples 0 = [0]
    multiples f = [f, f+f .. limit-1]
    allMultiples = factors >>= multiples
