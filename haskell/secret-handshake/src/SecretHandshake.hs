module SecretHandshake (handshake) where

import Data.List as List

handshake :: Int -> [String]
handshake n =
  reverse $ foldl action [] $ binaryComponents n

action :: [String] -> Int -> [String]
action xs i =
  case i of
    1 -> "wink" : xs
    2 -> "double blink" : xs
    4 -> "close your eyes" : xs
    8 -> "jump" : xs
    16 -> reverse xs
    _ -> error "Found components greater than 16! Probably you entered a too large number."

binaryComponents :: Int -> [Int]
binaryComponents n =
  filter (/= 0) . List.zipWith (*) (iterate (*2) 1) $ (binary n)

binary :: Int -> [Int]
binary 0 = []
binary n =
  (rem n 2) : (binary (div n 2))
