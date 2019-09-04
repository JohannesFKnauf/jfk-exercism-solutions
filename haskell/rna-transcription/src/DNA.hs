{-# LANGUAGE LambdaCase #-}
module DNA (toRNA) where

import Data.Traversable (traverse)

toRNA :: String -> Either Char String
toRNA dna = traverse nuclToRNA dna

nuclToRNA :: Char -> Either Char Char
nuclToRNA = \case
    'G' -> Right 'C'
    'C' -> Right 'G'
    'T' -> Right 'A'
    'A' -> Right 'U'
    bogus -> Left bogus
