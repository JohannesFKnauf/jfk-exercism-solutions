// Package etl implements scrabble score map pivoting
package etl

import (
	"strings"
)

// Transform scrabble score map from score->letters to letter->score
// additionally converts all letters to lower case
func Transform(scores map[int][]string) map[string]int {
	letterScores := make(map[string]int)
	for score, letters := range scores {
		for _, letter := range letters {
			idx := strings.ToLower(letter)
			letterScores[idx] = score
		}
	}
	return letterScores
}
