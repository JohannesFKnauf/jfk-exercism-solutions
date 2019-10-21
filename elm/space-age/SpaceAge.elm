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

planetYearLength : Planet -> Float
planetYearLength planet =
    case planet of
        Earth -> 31557600.0
        Mercury -> 0.2408467 * planetYearLength Earth
        Venus -> 0.61519726  * planetYearLength Earth
        Mars -> 1.8808158 * planetYearLength Earth
        Jupiter -> 11.862615 * planetYearLength Earth
        Saturn -> 29.447498 * planetYearLength Earth
        Uranus -> 84.016846 * planetYearLength Earth
        Neptune -> 164.79132 * planetYearLength Earth


ageOn : Planet -> Float -> Float
ageOn planet ageSeconds =
    ageSeconds / (planetYearLength planet)