// Package hamming implements a library for DNA strand comparison
package hamming

import (
	"errors"
)

// Distance calculates the hamming distance of 2 DNA strands a and b
// Errors are reported as second return value error
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("comparing DNA strands of different length is not allowed")
	}
	d := 0
	for i := range a {
		if a[i] != b[i] {
			d++
		}
	}
	return d, nil
}
