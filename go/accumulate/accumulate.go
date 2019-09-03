// Package accumulate implements a map-like operation
package accumulate

// Accumulate takes a collection coll, applies a given operation op to each element and returns the resulting collection
func Accumulate(coll []string, op func(string) string) []string {
	var s []string
	for _, e := range coll {
		s = append(s, op(e))
	}
	return s
}
