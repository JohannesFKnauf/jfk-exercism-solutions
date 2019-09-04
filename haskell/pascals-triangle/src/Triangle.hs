module Triangle (rows) where

row :: Int -> [Integer]
row 0 = []
row 1 = [1]
row n = zipWith (+) prev $ reverse prev
  where
    prev = 0 : row (n - 1)

rows :: Int -> [[Integer]]
rows 0 = []
rows 1 = [row 1]
rows n = rows (n - 1) ++ [row n]
