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
		switch {
		case unicode.IsSpace(r):
			continue
		case unicode.IsDigit(r):
			digits++
			n, _ := strconv.Atoi(string(r))
			if alt {
				n *= 2
				if n > 9 {
					n -= 9
				}
			}
			sum += n
			alt = !alt
		default:
			return false
		}
	}
	return digits > 1 && sum%10 == 0
}
