// Package raindrops implements the pling-plong child's game
package raindrops

import (
	"strconv"
)

// Convert a n into its pling-plong equivalent depending on its divisors
func Convert(n int) string {
	var equivalent string
	if n%3 == 0 {
		equivalent += "Pling"
	}
	if n%5 == 0 {
		equivalent += "Plang"
	}
	if n%7 == 0 {
		equivalent += "Plong"
	}
	if equivalent == "" {
		equivalent = strconv.Itoa(n)
	}
	return equivalent
}
