package series

func All(n int, s string) []string {
	resCount := len(s) - n + 1
	res := make([]string, resCount)
	for i := 0; i < resCount; i++ {
		res[i] = s[i:i+n]
	}
	return res
}

func UnsafeFirst(n int, s string) string {
	return s[0:n]
}
