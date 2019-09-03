// Package reverse provides a library for string reversal
package reverse

// Reverse reverses the input string
func Reverse(input string) string {
	var s string
	for _, r := range input {
		s = string(r) + s
	}
	return s
}
