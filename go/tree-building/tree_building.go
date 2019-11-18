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
	nodes := make(map[int]*Node)

	sort.Slice(records, func(i, j int) bool { return records[i].ID < records[j].ID })

	for i, record := range records {
		switch {
		case i != record.ID:
			return nil, fmt.Errorf("expected next record.ID '%d', but got '%d'", i, record.ID)
		case record.ID == 0 && record.Parent != 0:
			return nil, fmt.Errorf("root node '%v' does not reference itself", record)
		case record.ID > 0 && record.Parent >= record.ID:
			return nil, fmt.Errorf("parent ID '%d' must be less than record ID '%d'", record.Parent, record.ID)
		}

		node := Node{
			ID: record.ID,
		}
		nodes[i] = &node

		if record.ID > 0 {
			parent := nodes[record.Parent]
			parent.Children = append(parent.Children, &node)
		}

	}
	return nodes[0], nil
}
