// Package encode provides util functions for performing run-length-encoding and -decoding of strings
package encode

import (
	"bytes"
	"fmt"
	"strconv"
	"strings"
	"unicode"
)

// EncodeBlock encodes a single block of a n times repeated rune r
func encodeBlock(r rune, n int) string {
	switch n {
	case 0:
		return ""
	case 1:
		return fmt.Sprintf("%c", r)
	default:
		return fmt.Sprintf("%d%c", n, r)
	}
}

// RunLengthEncode encodes a given arbitrary decoded input string dec
// e.g. "AAABCCDDD" -> "3AB2C3D"
func RunLengthEncode(dec string) string {
	var b bytes.Buffer
	var prev rune
	var n int
	iMax := len(dec) - 1
	for i, cur := range dec {
		if cur == prev {
			n++
		} else {
			enc := encodeBlock(prev, n)
			b.WriteString(enc)
			prev = cur
			n = 1
		}
		if i == iMax {
			enc := encodeBlock(prev, n)
			b.WriteString(enc)
		}
	}
	return b.String()
}

// RunLengthDecode decodes a given run-length encoded input string enc
// e.g. "3AB2C3D" -> "AAABCCDDD"
func RunLengthDecode(enc string) string {
	var b bytes.Buffer
	var d bytes.Buffer
	for _, cur := range enc {
		s := fmt.Sprintf("%c", cur)
		if unicode.IsDigit(cur) {
			b.WriteString(s)
		} else {
			a := b.String()
			n, err := strconv.Atoi(a)
			if err != nil {
				n = 1
			}
			b.Reset()
			block := strings.Repeat(s, n)
			d.WriteString(block)
		}
	}
	return d.String()
}
