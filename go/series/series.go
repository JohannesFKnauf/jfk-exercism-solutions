package series

// All returns all substrings of string s with length n
func All(n int, s string) []string {
	resCount := len(s) - n + 1
	res := make([]string, resCount)
	for i := 0; i < resCount; i++ {
		res[i] = s[i : i+n]
	}
	return res
}

// UnsafeFirst returns the first substring of string s with length n
func UnsafeFirst(n int, s string) string {
	return s[0:n]
}

// First returns the first substring of string s with length n and an ok flag for cases where this is impossible
func First(n int, s string) (string, bool) {
	if n > len(s) {
		return "", false
	}
	return s[0:n], true
}
