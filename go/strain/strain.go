// Package strain provides utils for filtering collections
package strain

// Ints represents a collection of int
type Ints []int

// Lists represents a collection of Ints
type Lists []Ints

// Strings represents a collection string
type Strings []string

// Keep returns a new collection with all elements in is that satisfy predicate p
func (is Ints) Keep(p func(int) bool) Ints {
	var r Ints
	for _, i := range is {
		if p(i) {
			r = append(r, i)
		}
	}
	return r
}

// Discard returns a new collection with all elements in is that do not satisfy predicate p
func (is Ints) Discard(p func(int) bool) Ints {
	np := func(x int) bool { return !p(x) }
	return is.Keep(np)
}

// Keep returns a new collection with all elements in ls that satisfy predicate p
func (is Lists) Keep(p func([]int) bool) Lists {
	var r Lists
	for _, i := range is {
		if p(i) {
			r = append(r, i)
		}
	}
	return r
}

// Keep returns a new collection with all elements in ss that satisfy predicate p
func (is Strings) Keep(p func(string) bool) Strings {
	var r Strings
	for _, i := range is {
		if p(i) {
			r = append(r, i)
		}
	}
	return r
}
