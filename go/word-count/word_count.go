package wordcount

import (
	"regexp"
	"strings"
)

type Frequency map[string]int

// WordCount counts word frequencies in a given phrase
func WordCount(phrase string) Frequency {
	separators := regexp.MustCompile("[ \n,]+")
	leadingSeparators := regexp.MustCompile("^[ \n,]+")
	noChars := regexp.MustCompile("[:!&@$%^.]")
	quotation := regexp.MustCompile("'([^']+)'")
	
	r := make(Frequency)
	phrase = leadingSeparators.ReplaceAllString(phrase, "")
	for _, word := range separators.Split(phrase, -1) {
		word = noChars.ReplaceAllString(word, "")
		word = strings.ToLower(word)
		word = quotation.ReplaceAllString(word, "$1")
		r[word]++
	}
	return r
}
