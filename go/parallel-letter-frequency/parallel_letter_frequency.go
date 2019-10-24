// Package letter provides a parallel letter count algorithm
package letter

const numWorkers = 4

func distribute(ss []string, tasks chan<- string) {
	for _, s := range ss {
		tasks <- s
	}
}

func reduce(tasks <-chan string, result chan<- FreqMap) {
	for task := range tasks {
		result <- Frequency(task)
	}
}

func combine(subResults <-chan FreqMap, numResults int) FreqMap {
	r := FreqMap{}
	for i := 0; i < numResults; i++ {
		f := <-subResults
		for k, v := range f {
			r[k] += v
		}
	}
	return r
}

// ConcurrentFrequency counts letters in text using a map-reduce like approach
// ss is an array of substrings to be counted
// individual substrings are counted concurrently (shared-nothing) in numWorkers (default: 4) go routines
// the final result is combined sequentially
func ConcurrentFrequency(ss []string) FreqMap {
	taskCount := len(ss)

	tasks := make(chan string)
	subResults := make(chan FreqMap)

	go func() {
		distribute(ss, tasks)
		close(tasks)
	}()

	for i := 0; i < numWorkers; i++ {
		go reduce(tasks, subResults)
	}

	r := combine(subResults, taskCount)
	close(subResults)

	return r
}
