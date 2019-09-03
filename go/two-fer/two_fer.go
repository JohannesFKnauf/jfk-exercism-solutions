// Package twofer implements the exercism two-fer challenge
package twofer

import (
	"fmt"
)

// ShareWith creates a sharing message for name
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
