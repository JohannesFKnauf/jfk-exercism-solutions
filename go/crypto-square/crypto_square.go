package cryptosquare

import (
	u "unicode"
)

func Encode(pt string) string {
	normalized := []rune{}
	
	for _, r := range pt {
		if u.IsDigit(r) || u.IsLetter(r) {
			normalized = append(normalized, u.ToLower(r))
		}
	}
	
	l := len(normalized)
	c, r := calcSquare(l)

	result := []rune{}
	
	for i := 0; i < c; i++ {
		if i > 0 {
			result = append(result, ' ')
		}
		for j := 0; j < r; j++ {
			from := i + j * c
			if from < l {
				result = append(result, normalized[from])
			} else {
				result = append(result, ' ')
			}
		}
	}
	return string(result)
}

func calcSquare(l int) (int, int) {
	for i := 0;; i++ {
		if i * i >= l {
			return i, i
		}
		if (i+1) * i >= l {
			return i+1, i
		}
	}
}
