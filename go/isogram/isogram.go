// Package isogram implements isogram detection for words
package isogram

import (
	"strings"
	"unicode"
)

// IsIsogram detects if a given word is an isogram
// A word is an isogram, if it contains no character more than once
func IsIsogram(word string) bool {
	seen := make(map[rune]bool)
	for _, r := range strings.ToLower(word) {
		if !unicode.IsLetter(r) {
			continue
		}
		if seen[r] {
			return false
		}
		seen[r] = true
	}
	return true
}
