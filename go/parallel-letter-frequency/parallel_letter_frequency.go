// Package letter provides a parallel letter count algorithm
package letter

import (
	"sync"
)

const numWorkers = 4

func Distribute(ss []string) chan string {
	tasks := make(chan string)
	go func() {
		for _, s := range ss {
			tasks <- s
		}
		close(tasks)
	}()
	return tasks
}

func Reducer(tasks <-chan string, result chan<- FreqMap) {
	for task := range tasks {
		result <- Frequency(task)
	}
}

func Combine(subResults <-chan FreqMap) FreqMap {
	r := FreqMap{}
	for f := range subResults {
		for k, v := range f {
			r[k] += v
		}
	}
	return r
}

// ConcurrentFrequency counts letters in text using a map-reduce like approach
// ss is an array of substrings to be counted
// individual substrings are counted concurrently (shared-nothing) in 4 go routines
// the final result is combined sequentially
func ConcurrentFrequency(ss []string) FreqMap {
	tasks := Distribute(ss)

	subResults := make(chan FreqMap)
	var wg sync.WaitGroup

	for i := 0; i < numWorkers; i++ {
		wg.Add(1)
		go func() {
			Reducer(tasks, subResults)
			wg.Done()
		}()
	}

	go func() {
		wg.Wait()
		close(subResults)
	}()
	

	r := Combine(subResults)

	return r
}

