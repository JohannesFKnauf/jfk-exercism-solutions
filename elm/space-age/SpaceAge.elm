module SpaceAge exposing (..)

type Planet
  = Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

planetYearInSeconds : Planet -> Float
planetYearInSeconds planet =
    let
        earthYearSeconds = 31557600.0
    in
        case planet of
            Earth -> 1.0 * earthYearSeconds
            Mercury -> 0.2408467 * earthYearSeconds
            Venus -> 0.61519726  * earthYearSeconds
            Mars -> 1.8808158 * earthYearSeconds
            Jupiter -> 11.862615 * earthYearSeconds
            Saturn -> 29.447498 * earthYearSeconds
            Uranus -> 84.016846 * earthYearSeconds
            Neptune -> 164.79132 * earthYearSeconds


ageOn : Planet -> Float -> Float
ageOn planet ageSeconds =
    ageSeconds / (planetYearInSeconds planet)
