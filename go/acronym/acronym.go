package acronym

import (
	"regexp"
	"strings"
	"unicode"
)

var separator *regexp.Regexp = regexp.MustCompile(`[- _]+`)

// Abbreviate converts long names to an acronym
func Abbreviate(s string) string {
	var words []string = separator.Split(s, -1)
	var sb strings.Builder
	for _, word := range words {
		start := firstRune(word)
		initial := unicode.ToUpper(start)
		sb.WriteRune(initial)
	}
	
	return sb.String()
}

func firstRune(s string) rune {
	for _, r := range s {
		return r
	}
	// string was empty - should never happen in our example
	return ' '
}
