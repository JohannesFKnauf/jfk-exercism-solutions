// Package raindrops implements the pling-plong child's game
package raindrops

import (
	"strconv"
)

type replacementRule struct {
	divisor     int
	replacement string
}

var replacementRules = []replacementRule{
	replacementRule{3, "Pling"},
	replacementRule{5, "Plang"},
	replacementRule{7, "Plong"},
}

// DivisibleBy checks a given number for its divisibility by a given divisor
func DivisibleBy(number int, divisor int) bool {
	return number%divisor == 0
}

// Convert a n into its pling-plong equivalent depending on its divisors
func Convert(n int) string {
	var equivalent string
	for _, rule := range replacementRules {
		if DivisibleBy(n, rule.divisor) {
			equivalent += rule.replacement
		}
	}
	if equivalent == "" {
		equivalent = strconv.Itoa(n)
	}
	return equivalent
}
