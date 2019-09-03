// Package triangle contains utility functions for classifying triangles
package triangle

import (
	"math"
)

// Kind represents a triangle kind
type Kind int

// All permissible kinds of triangles
const (
	NaT Kind = iota // not a triangle
	Equ             // equilateral
	Iso             // isosceles
	Sca             // scalene
)

// KindFromSides determines the Kind of a triangle, described by its side lengths a, b, c
func KindFromSides(a, b, c float64) Kind {
	// Test for negative or zero side lengths
	if a <= 0 || b <= 0 || c <= 0 {
		return NaT
	}
	// Test for not-a-number
	if math.IsNaN(a) || math.IsNaN(b) || math.IsNaN(c) {
		return NaT
	}
	// Test for positive infinity side length
	if math.IsInf(a, 1) || math.IsInf(b, 1) || math.IsInf(c, 1) {
		return NaT
	}
	// Test for Triangle inequality violation
	if a > b+c || b > a+c || c > a+b {
		return NaT
	}
	if a == b && b == c && a == c {
		return Equ
	}
	if a == b || b == c || a == c {
		return Iso
	}
	return Sca
}
