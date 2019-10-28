// Package letter provides a parallel letter count algorithm
package letter

// ConcurrentFrequency counts letters in text using a map-reduce like approach
// ss is an array of substrings to be counted
// individual substrings are counted concurrently (shared-nothing) in numWorkers (default: 4) go routines
// the final result is combined sequentially
func ConcurrentFrequency(ss []string) FreqMap {
	freqs := make(chan FreqMap)

	for _, s := range ss {
		go func(s string) {
			freqs <- Frequency(s)
		}(s)
	}

	r := FreqMap{}
	taskCount := len(ss)
	for i := 0; i < taskCount; i++ {
		f := <-freqs
		for k, v := range f {
			r[k] += v
		}
	}

	return r
}
