// Package clock provides utility functions for time calculations
package clock

import (
	"fmt"
)

// Clock represents the state of a clock as minutes
type Clock int

// Mod calculates (always positive) modulus of a number n for a divisor m
func Mod(n, m int) int {
	x := n % m
	if (x < 0 && m > 0) || (x > 0 && m < 0) {
		return x + m
	}
	return x
}

// New creates a clock from a given hour h and minute m
func New(h, m int) Clock {
	ms := Mod(m+60*h, 1440)
	return Clock(ms)
}

// String converts a clock into its human-readable 24h clock representation
func (c Clock) String() string {
	m := int(c) % 60
	h := (int(c) - m) / 60
	return fmt.Sprintf("%02d:%02d", h, m)
}

// Add adds minutes to a given clock
func (c Clock) Add(m int) Clock {
	mp := Mod(int(c)+m, 1440)
	return Clock(mp)
}

// Subtract subtracts minutes from a given clock
func (c Clock) Subtract(m int) Clock {
	mp := Mod(int(c)-m, 1440)
	return Clock(mp)
}
