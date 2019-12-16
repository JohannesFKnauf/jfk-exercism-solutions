package wordcount

import (
	"regexp"
	"strings"
)

// Frequency holds word counts
type Frequency map[string]int

// WordCount counts word frequencies in a given phrase
func WordCount(phrase string) Frequency {
	r := make(Frequency)
	words := regexp.MustCompile(`\b\w*[']?\w*\b`)
	phrase = strings.ToLower(phrase)

	for _, word := range words.FindAllString(phrase, -1) {
		r[word]++
	}
	return r
}
