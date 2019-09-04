module Clock (addDelta, fromHourMin, toString) where

import Text.Printf (printf)

type Clock = Int


fromHourMin :: Int -> Int -> Clock
fromHourMin h m = totalMin `mod` minPerDay
  where
    minPerDay = 24 * 60
    totalMin  = (h * 60) + m


toString :: Clock -> String
toString clock = printf "%02d:%02d" h m
  where
    (h, m) = clock `divMod` 60

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m clock = fromHourMin h (m + clock)
