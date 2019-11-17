// Package tree provides algorithms for building a nested tree structure from a set of records
package tree

import (
	"fmt"
	"sort"
)

// Record contains a single input record
type Record struct {
	ID     int
	Parent int
}

// Node is used to represent the reconstructed tree nodes
type Node struct {
	ID       int
	Children []*Node
}

// Build assembles a tree from a set of records
// it returns a pointer to the root node
func Build(records []Record) (*Node, error) {
	lookup := make(map[int]*Node)
	sort.Slice(records, func(i, j int) bool { return records[i].ID < records[j].ID })

	for i, record := range records {
		if _, ok := lookup[record.ID]; ok {
			return nil, fmt.Errorf("Record with ID %d already existed. This should not happen with a list of unique records.", record.ID)
		}
		if i != record.ID {
			return nil, fmt.Errorf("Records are non-continuous. Expected next record.ID '%d', but got '%d'.", i, record.ID)
		}
		lookup[record.ID] = &Node{
			ID: record.ID,
		}
	}
	for _, record := range records {
		parent := lookup[record.Parent]
		if parent == nil {
			return nil, fmt.Errorf("Parent '%d' does not exist.", record.Parent)
		}

		if record.ID == 0 && record.Parent != 0 {
			return nil, fmt.Errorf("Root node '%v' does not reference itself.", record)
		}
		if record.ID != 0 && record.Parent == record.ID {
			return nil, fmt.Errorf("Non-root node '%v' is referencing itself.", record)
		}
		if record.ID != 0 && record.Parent > record.ID {
			return nil, fmt.Errorf("Parent ID '%d' higher than record ID '%d'.", record.Parent, record.ID)
		}
		node := lookup[record.ID]
		if node != parent {
			parent.Children = append(parent.Children, lookup[record.ID])
		}
	}
	return lookup[0], nil
}
