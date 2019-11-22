// Package cryptosquare provides crypto square encryption functionality
package cryptosquare

import (
	u "unicode"
)

// Encode encrypts a given plain text pt
func Encode(pt string) string {
	normalized := []rune{}

	for _, r := range pt {
		if u.IsDigit(r) || u.IsLetter(r) {
			normalized = append(normalized, u.ToLower(r))
		}
	}

	l := len(normalized)
	c, r := calcSquare(l)

	result := []rune{}

	for i := 0; i < c; i++ {
		if i > 0 {
			result = append(result, ' ')
		}
		for j := 0; j < r; j++ {
			// c is the stride for each row skipped
			// j * c is the row offset
			// i is the column offset
			from := i + j*c
			if from < l {
				result = append(result, normalized[from])
			} else {
				result = append(result, ' ')
			}
		}
	}
	return string(result)
}

// calcSquare calculates the crypto square size
// intentionally avoids float arithmetics
// performance-wise this is only responsible for small rectangles
func calcSquare(l int) (int, int) {
	for i := 0; ; i++ {
		if i*i >= l {
			return i, i
		}
		if (i+1)*i >= l {
			return i + 1, i
		}
	}
}
