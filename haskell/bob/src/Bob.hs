module Bob (responseFor) where

import Control.Monad (liftM2)
import Data.Char (isSpace, isLetter, isLower)
import Data.List (dropWhileEnd)

responseFor :: String -> String
responseFor xs
  | isSayingNothing xs' = "Fine. Be that way!"
  | isForcefulQuestion xs' = "Calm down, I know what I'm doing!"
  | isYelling xs' = "Whoa, chill out!"
  | isQuestion xs' = "Sure."
  | otherwise = "Whatever."
  where
    xs' = trim xs

isSayingNothing :: String -> Bool
isSayingNothing = all isSpace

isYelling :: String -> Bool
isYelling = all (not . isLower) .&&. any isLetter

isQuestion :: String -> Bool
isQuestion = (== '?') . last

isForcefulQuestion :: String -> Bool
isForcefulQuestion = isYelling .&&. isQuestion

(.&&.) :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
(.&&.) = liftM2 (&&)

trim :: String -> String
trim = dropWhileEnd isSpace . dropWhile isSpace
