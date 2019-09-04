module Grains (square, total) where

square :: Monad m => Integer -> m Integer
square n
  | n <= 0 = fail "n too small"
  | n > 64 = fail "n too large"
  | otherwise = return $ 2 ^ (n - 1)

total :: Integer
total = 2 ^ 64 - 1
