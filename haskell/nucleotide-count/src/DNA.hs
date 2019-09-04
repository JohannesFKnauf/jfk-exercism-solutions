{-# LANGUAGE LambdaCase #-}
module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.List (foldl)
import Data.Map (Map, fromList, adjust)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = fmap countNucls . nucleotides
  where
    nucleotides = traverse parseNucl
    incMapEntry countsMap key = adjust (+1) key countsMap
    countNucls = foldl incMapEntry zeroNucleotideMap
    

zeroNucleotideMap :: Map Nucleotide Int
zeroNucleotideMap = fromList . map zeroNuclEntry $ [A, C, G, T]
  where
    zeroNuclEntry x = (x, 0)

parseNucl :: Char -> Either String Nucleotide
parseNucl = \case
  'A' -> Right A
  'C' -> Right C
  'G' -> Right G
  'T' -> Right T
  x -> Left $ "Invalid nucleotide: " ++ [x]
