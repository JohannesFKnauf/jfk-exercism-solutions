module Raindrops (convert) where

convert :: Int -> String
convert n = case plingPlangWords n of
  [] -> show n
  ws -> concat ws
  
plingPlangWords :: Int -> [String]
plingPlangWords n = [w | (d, w) <- plingPlangRules,
                         n `divisibleBy` d ]

plingPlangRules :: [(Int, String)]
plingPlangRules = [(3, "Pling"), (5, "Plang"), (7, "Plong")]

divisibleBy :: Int -> Int -> Bool
divisibleBy x y = x `rem` y == 0
