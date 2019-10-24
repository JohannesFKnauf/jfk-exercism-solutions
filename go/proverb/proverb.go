// Package proverb generates algorithmic proverbs
package proverb

import (
	"fmt"
)

// Proverb generates lines of a proverb
// given a list of rhyme words.
func Proverb(rhyme []string) []string {
	var result []string

	if len(rhyme) == 0 {
		return result
	}

	for i := 0; i < len(rhyme)-1; i++ {
		next := fmt.Sprintf("For want of a %s the %s was lost.", rhyme[i], rhyme[i+1])
		result = append(result, next)
	}

	ending := fmt.Sprintf("And all for the want of a %s.", rhyme[0])
	result = append(result, ending)

	return result
}
