// Package diffsquares provides utils for calculating the diffence between sum-of-squares and square-of-sum
package diffsquares

// SquareOfSum calculates the square of the sum of all integers from 1..n
// example: SquareOfSum(4) = (1+2+3+4)**2
func SquareOfSum(n int) int {
	sum := n * (n + 1) / 2
	return sum * sum
}

// SumOfSquares calculates the sum of the squares of all integers from 1..n
// example: SumOfSquares(4) = 1**2 + 2**2 + 3**2 + 4**2
func SumOfSquares(n int) int {
	return (n * (n + 1) * (2*n + 1)) / 6
}

// Difference calculates the difference between square-of-sums and sum-of-squares for all integers 1..n
func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
