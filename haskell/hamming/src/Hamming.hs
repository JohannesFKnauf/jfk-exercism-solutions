module Hamming (distance) where

import Control.Monad (liftM)

distance :: String -> String -> Maybe Int
distance xs ys =
  liftM (length . filter not) . sequence $ zipWithOrFail (==) xs ys

zipWithOrFail :: (a -> a -> b) -> [a] -> [a] -> [Maybe b]
zipWithOrFail _ [] [] = []
zipWithOrFail _ _ [] = [Nothing]
zipWithOrFail _ [] _ = [Nothing]
zipWithOrFail f (x:xs) (y:ys) = Just (f x y) : (zipWithOrFail f xs ys)
