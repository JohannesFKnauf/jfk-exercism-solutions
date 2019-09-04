module RunLength (decode, encode) where

import Data.Char (isDigit)

type Run = (Int, Char)    -- (length, repeated character)

decode :: String -> String
decode enc = concat . map decodeRun $ parseEnc enc
  where
    decodeRun (count, ch) = replicate count ch

parseEnc :: String -> [Run]
parseEnc "" = []
parseEnc enc = (count, ch) : parseEnc rest
  where
    (num, ch:rest) = span isDigit enc
    count | num == "" = 1 :: Int
          | otherwise = read num


encode :: String -> String
encode dec = concat . map encodeRun $ parseDec dec
  where
    encodeRun (count, ch) | count == 1 = [ch]
                          | otherwise = (show count) ++ [ch]


parseDec :: String -> [Run]
parseDec "" = []
parseDec (ch:xs) = (count, ch) : parseDec rest
  where
    (chs, rest) = span (== ch) xs
    count = 1 + length chs
