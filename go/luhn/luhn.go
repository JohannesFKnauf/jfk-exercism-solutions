// Package luhn implements the Luhn algorithm
package luhn

import (
	"strconv"
	"unicode"
)

// Valid checks for luhn validity of a given input number
func Valid(input string) bool {
	var alt bool // alt is false for each 'first' digit and true for each 'second' digit
	var digits int
	var sum int
	rs := []rune(input)
	for i := len(rs) - 1; i >= 0; i-- {
		r := rs[i]
		if unicode.IsDigit(r) {
			digits++
			n, _ := strconv.Atoi(string(r))
			if alt {
				x := n * 2
				if x > 9 {
					x -= 9
				}
				sum += x
			} else {
				sum += n
			}
			alt = !alt
		} else if !unicode.IsSpace(r) {
			return false
		}
	}
	return digits > 1 && sum%10 == 0
}
