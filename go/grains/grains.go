// Package grains implements utils for calculating the amount of grains involved in the famous 'chess board' story
// See also: https://en.wikipedia.org/wiki/Wheat_and_chessboard_problem
//
// The code leverages the fact, that a uint64 already implements all involved logic. The 64 bits correspond to the chess board squares. Setting bits is equivalent to filling squares.
package grains

import (
	"errors"
	"fmt"
)

// Square computes the number of grains on a particular square
func Square(n int) (uint64, error) {
	if n < 1 || 64 < n {
		msg := fmt.Sprintf("chess boards of size %d are not supported; square index must be in range [1..64]", n)
		return 0, errors.New(msg)
	}
	bit := uint64(1)
	offset := uint64(n - 1)
	return bit << offset, nil
}

// Total computes the overall number of grains on the chess board
func Total() uint64 {
	return ^uint64(0)
}
