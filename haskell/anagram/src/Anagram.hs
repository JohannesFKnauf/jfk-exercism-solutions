module Anagram (anagramsFor) where

import Control.Monad (liftM, liftM2)
import Data.Function (on)
import Data.List (filter, sort)
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor =
  let
    -- (String -> String -> Bool) is interpreted as (String -> String ->) nested function Monad
    (.&&.) = liftM2 $ liftM2 (&&)
    notM = liftM $ liftM not
    normalizeCase = map toLower
    normalize = sort . normalizeCase
    equivalentAfter = on (==)
    hasSameLettersAs = equivalentAfter normalize
    isSameWordAs = equivalentAfter normalizeCase
    isDifferentWordAs = notM isSameWordAs
  in
    filter . (hasSameLettersAs .&&. isDifferentWordAs)
