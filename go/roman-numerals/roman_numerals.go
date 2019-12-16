package romannumerals

import (
	"fmt"
)

// ToRomanNumeral converts a given number to a roman numeral
func ToRomanNumeral(n int) (string, error) {
	switch {
	case n == 0:
		return "", fmt.Errorf("the romans did not invent zero")
	case n < 0:
		return "", fmt.Errorf("the romans did not know how to handle negative numbers")
	case n > 3000:
		return "", fmt.Errorf("numbers greater than 3000 are not supported by this program")
	}

	r := ""

	switch n / 1000 {
	case 1:
		r += "M"
	case 2:
		r += "MM"
	case 3:
		r += "MMM"
	}

	switch n % 1000 / 100 {
	case 1:
		r += "C"
	case 2:
		r += "CC"
	case 3:
		r += "CCC"
	case 4:
		r += "CD"
	case 5:
		r += "D"
	case 6:
		r += "DC"
	case 7:
		r += "DCC"
	case 8:
		r += "DCCC"
	case 9:
		r += "CM"
	}

	switch n % 100 / 10 {
	case 1:
		r += "X"
	case 2:
		r += "XX"
	case 3:
		r += "XXX"
	case 4:
		r += "XL"
	case 5:
		r += "L"
	case 6:
		r += "LX"
	case 7:
		r += "LXX"
	case 8:
		r += "LXXX"
	case 9:
		r += "XC"
	}
	
	switch n % 10 {
	case 1:
		r += "I"
	case 2:
		r += "II"
	case 3:
		r += "III"
	case 4:
		r += "IV"
	case 5:
		r += "V"
	case 6:
		r += "VI"
	case 7:
		r += "VII"
	case 8:
		r += "VIII"
	case 9:
		r += "IX"
	}

	return r, nil
}
