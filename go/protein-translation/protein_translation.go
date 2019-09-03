// Package protein provides utils for translating RNA sequences into sequences of proteins
package protein

import (
	"errors"
)

var (
	// ErrStop signals a STOP codon
	ErrStop = errors.New("hit a STOP codon")
	// ErrInvalidBase signals a malformed RNA sequence, not corresponding to any known protein
	ErrInvalidBase = errors.New("hit an invalid base")
)

// FromCodon translates a codon into a protein
func FromCodon(codon string) (string, error) {
	var result string
	switch codon {
	case "AUG":
		result = "Methionine"
	case "UUU", "UUC":
		result = "Phenylalanine"
	case "UUA", "UUG":
		result = "Leucine"
	case "UCU", "UCC", "UCA", "UCG":
		result = "Serine"
	case "UAU", "UAC":
		result = "Tyrosine"
	case "UGU", "UGC":
		result = "Cysteine"
	case "UGG":
		result = "Tryptophan"
	case "UAA", "UAG", "UGA":
		return result, ErrStop
	default:
		return result, ErrInvalidBase
	}
	return result, nil
}

// FromRNA translates a whole RNS sequence into a polypeptide, i.e. a sequence of proteins
func FromRNA(rna string) ([]string, error) {
	var result []string
	for 3 <= len(rna) {
		codon := rna[:3]
		rna = rna[3:]
		protein, err := FromCodon(codon)
		switch err {
		case nil:
			result = append(result, protein)
		case ErrStop:
			return result, nil
		default:
			return result, err
		}
	}
	return result, nil
}
