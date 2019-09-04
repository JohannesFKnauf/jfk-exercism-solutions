// Package luhn implements the Luhn algorithm
package luhn

import (
	"strconv"
	"unicode"
)

// Reverse reverts a string
func Reverse(s string) string {
	runes := []rune(s)
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		runes[i], runes[j] = runes[j], runes[i]
	}
	return string(runes)
}

// Valid checks for luhn validity of a given input number
func Valid(input string) bool {
	var alt bool // alt is false for each 'first' digit and true for each 'second' digit
	var n int    // n keeps the number of valid digits seen so far
	var sum int
	for _, r := range Reverse(input) {
		if unicode.IsDigit(r) {
			n++
			i, _ := strconv.Atoi(string(r))
			if alt {
				x := i * 2
				if x > 9 {
					x -= 9
				}
				sum += x
			} else {
				sum += i
			}
			alt = !alt
		} else if !unicode.IsSpace(r) {
			return false
		}
	}
	return n > 1 && sum%10 == 0
}
