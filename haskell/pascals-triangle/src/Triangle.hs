module Triangle (rows) where

import Data.List (tails)

rows :: Int -> [[Integer]]
rows 0 = []
rows 1 = [[1]]
rows n = prev ++ [[ x + y | (x:y:_) <- tails lastRow ]]
  where
    prev = rows (n - 1)
    lastRow = [0] ++ (last prev) ++ [0]
