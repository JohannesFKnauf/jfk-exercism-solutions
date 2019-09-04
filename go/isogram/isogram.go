// Package isogram implements isogram detection for words
package isogram

import (
	"unicode"
)

// IsIsogram detects if a given word is an isogram
// A word is an isogram, if it contains no character more than once
func IsIsogram(word string) bool {
	var letterSeen [26]bool // each field in the array corresponds to a letter in the alphabet; the array index is given by the offset from 'a'
	for _, letter := range word {
		caseInsensitiveLetter := unicode.ToLower(letter)
		i := int(caseInsensitiveLetter - 'a')
		if i < 0 || i > 25 {
			continue
		}
		if letterSeen[i] {
			return false
		}
		letterSeen[i] = true
	}
	return true
}
