package space

type Planet string

var seconds_per_earth_year = 31557600.0

var orbital_periods_in_earth_years = map[Planet]float64 {
	"Earth": 1.0,
	"Mercury": 0.2408467,
	"Venus": 0.61519726,
	"Mars": 1.8808158,
	"Jupiter": 11.862615,
	"Saturn": 29.447498,
	"Uranus": 84.016846,
	"Neptune": 164.79132,
}

// Calculate age on planet
func Age(seconds float64, planet Planet) float64 {
	earth_years := seconds / seconds_per_earth_year
	planet_years := earth_years / orbital_periods_in_earth_years[planet]
	return planet_years
}
