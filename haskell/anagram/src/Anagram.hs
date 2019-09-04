module Anagram (anagramsFor) where

import Data.List (filter, sort)
import Data.Char (toLower)

normalizeCase :: String -> String
normalizeCase =
  map toLower

normalize :: String -> String
normalize =
  sort . normalizeCase

isAnagram :: String -> String -> Bool
isAnagram ref cand =
  (normalize ref) == (normalize cand)

isSameWord :: String -> String -> Bool
isSameWord ref cand =
  (normalizeCase ref) == (normalizeCase cand)

anagramsFor :: String -> [String] -> [String]
anagramsFor ref xs =
  filter (isAnagram ref) (filter (not . (isSameWord ref)) xs)
