module Clock (addDelta, fromHourMin, toString) where

import Text.Printf (printf)

-- Clock is just a container for minutes
data Clock = Clock Int deriving (Eq, Show)


fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock $ totalMin `mod` minPerDay
  where
    minPerDay = 24 * 60
    totalMin  = (h * 60) + m


toString :: Clock -> String
toString (Clock totalMin) = printf "%02d:%02d" h m
  where
    (h, m) = totalMin `divMod` 60

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m (Clock totalMin) = fromHourMin h (m + totalMin)
