// Package clock provides utility functions for time calculations
package clock

import (
	"fmt"
)

// Clock represents the state of a clock as a positive amount of minutes
type Clock struct {
	mins int
}

// New creates a clock from a given hour h and minute m
// Neither h nor m need to be positive numbers
func New(h, m int) Clock {
	mins := m + 60*h
	mins = mins % (24 * 60)
	if mins < 0 {
		mins += (24 * 60)
	}
	return Clock{mins}
}

// String converts a clock into its human-readable 24h clock representation
func (c Clock) String() string {
	m := c.mins % 60
	h := (c.mins - m) / 60
	return fmt.Sprintf("%02d:%02d", h, m)
}

// Add adds minutes to a given clock
func (c Clock) Add(m int) Clock {
	mins := c.mins + m
	return New(0, mins)
}

// Subtract subtracts minutes from a given clock
func (c Clock) Subtract(m int) Clock {
	mins := c.mins - m
	return New(0, mins)
}
