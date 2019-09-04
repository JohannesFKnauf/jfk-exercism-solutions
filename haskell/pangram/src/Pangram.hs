module Pangram (isPangram) where

import qualified Data.Set as Set
import Data.Char (isAlpha, toLower)

isPangram :: String -> Bool
isPangram =
  null . (foldl removeFromSet alphabet) . (map toLower) . (filter isAlpha)
  where
    alphabet = Set.fromList ['a'..'z']
    removeFromSet = flip Set.delete
