// Package strain provides utils for filtering collections
package strain

// Ints represents a collection of int
type Ints []int
type predI func(int) bool

// Lists represents a collection of Ints
type Lists [][]int
type predL func([]int) bool

// Strings represents a collection string
type Strings []string
type predS func(string) bool

// Keep returns a new collection with all elements in collection is that satisfy predicate p
func (is Ints) Keep(p predI) Ints {
	var r Ints
	for _, i := range is {
		if p(i) {
			r = append(r, i)
		}
	}
	return r
}

// Discard returns a new collection with all elements in collection is that do not satisfy predicate p
func (is Ints) Discard(p predI) Ints {
	var r Ints
	for _, i := range is {
		if !p(i) {
			r = append(r, i)
		}
	}
	return r
}

// Keep returns a new collection with all elements in collection is that satisfy predicate p
func (is Lists) Keep(p predL) Lists {
	var r Lists
	for _, i := range is {
		if p(i) {
			r = append(r, i)
		}
	}
	return r
}

// Keep returns a new collection with all elements in collection is that satisfy predicate p
func (is Strings) Keep(p predS) Strings {
	var r Strings
	for _, i := range is {
		if p(i) {
			r = append(r, i)
		}
	}
	return r
}
