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
	n := len(records)
	if n == 0 {
		return nil, nil
	}
	nodes := make([]*Node, n)

	sort.Slice(records, func(i, j int) bool { return records[i].ID < records[j].ID })

	for i, record := range records {
		switch {
		case i > record.ID:
			return nil, fmt.Errorf("Records contain duplicates. Expected next record.ID '%d', but got '%d'.", i, record.ID)
		case i < record.ID:
			return nil, fmt.Errorf("Records are non-continuous. Expected next record.ID '%d', but got '%d'.", i, record.ID)
		case record.ID == 0 && record.Parent != 0:
			return nil, fmt.Errorf("Root node '%v' does not reference itself.", record)
		case record.ID != 0 && record.Parent == record.ID:
			return nil, fmt.Errorf("Non-root node '%v' is referencing itself.", record)
		case record.ID != 0 && record.Parent > record.ID:
			return nil, fmt.Errorf("Parent ID '%d' higher than record ID '%d'.", record.Parent, record.ID)
		}

		node := Node{
			ID: record.ID,
		}
		nodes[i] = &node

		if record.ID != record.Parent {
			parent := nodes[record.Parent]
			parent.Children = append(parent.Children, &node)
		}

	}
	return nodes[0], nil
}
