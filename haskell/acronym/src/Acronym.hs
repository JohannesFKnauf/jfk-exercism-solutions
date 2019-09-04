module Acronym (abbreviate) where

import qualified Data.Char as C
import qualified Data.Text as T
import qualified Data.Text.Manipulate as TM

abbreviate :: String -> String
abbreviate = map (C.toUpper . T.head) . TM.splitWords . T.filter isNoQuoteCharacter . T.pack
  where
    isNoQuoteCharacter = not . flip elem "'\""
