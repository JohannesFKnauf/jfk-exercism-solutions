module CryptoSquare (encode) where

import qualified Data.List as List (intercalate, transpose)
import qualified Data.Char as Char (toLower, isAlphaNum)

encode :: String -> String
encode xs = cypher
  where
    normalized = map Char.toLower . filter Char.isAlphaNum $ xs
    (_, c) = rectangleDims $ length normalized
    chunks = chunksOf c normalized
    transposedChunks = List.transpose chunks
    cypher = List.intercalate " " transposedChunks
    

chunksOf :: Int -> [a] -> [[a]]
chunksOf _ [] = []
chunksOf n xs = h : chunksOf n t
  where
    (h, t) = splitAt n xs

rectangleDims :: Int -> (Int, Int)
rectangleDims n
  | n == lower * lower = (lower, lower)
  | n <= lower * upper = (lower, upper)
  | otherwise = (upper, upper)
  where
    s = sqrt $ fromIntegral n :: Double
    lower = floor s
    upper = lower + 1
