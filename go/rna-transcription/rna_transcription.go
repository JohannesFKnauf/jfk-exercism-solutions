// Package strand provides RNA transcription tools
package strand

import "strings"

// ToRNA translates a DNA strand given as string dna to RNA
func ToRNA(dna string) string {
	return strings.Map(transcribeBase, dna)
}

func transcribeBase(b rune) rune {
	switch b {
	case 'G':
		return 'C'
	case 'C':
		return 'G'
	case 'T':
		return 'A'
	case 'A':
		return 'U'
	}
	return '0'
}
