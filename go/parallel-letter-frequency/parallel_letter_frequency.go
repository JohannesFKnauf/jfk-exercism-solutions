// Package letter provides a parallel letter count algorithm
package letter

const numWorkers = 4

// ConcurrentFrequency counts letters in text using a map-reduce like approach
// ss is an array of substrings to be counted
// individual substrings are counted concurrently (shared-nothing) in numWorkers (default: 4) go routines
// the final result is combined sequentially
func ConcurrentFrequency(ss []string) FreqMap {
	taskCount := len(ss)

	tasks := make(chan string)
	subResults := make(chan FreqMap)

	go func() {
		for _, s := range ss {
			tasks <- s
		}
		close(tasks)
	}()

	for i := 0; i < numWorkers; i++ {
		go func() {
			for task := range tasks {
				subResults <- Frequency(task)
			}
		}()
	}

	r := FreqMap{}
	for i := 0; i < taskCount; i++ {
		f := <-subResults
		for k, v := range f {
			r[k] += v
		}
	}

	close(subResults)

	return r
}
