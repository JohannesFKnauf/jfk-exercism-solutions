module Anagram (anagramsFor) where

import Control.Monad (liftM2)
import Data.Function (on)
import Data.List (filter, sort)
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor ref =
  let
    normalizeCase = map toLower
    normalize = sort . normalizeCase
    equivalentAfter = on (==)
    hasSameLettersAs = equivalentAfter normalize
    isSameWordAs = equivalentAfter normalizeCase
    (.&&.) = liftM2 (&&)
  in
    filter ((not . isSameWordAs ref) .&&. (hasSameLettersAs ref))
