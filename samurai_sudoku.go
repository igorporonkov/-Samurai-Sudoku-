// samurai_sudoku.go
package main

import (
	"fmt"
	"math/rand"
	"time"
)

type SamuraiSudoku struct {
	grids [5][9][9]int
}

func NewSamuraiSudoku() *SamuraiSudoku {
	return &SamuraiSudoku{}
}

func (s *SamuraiSudoku) isValid(grid *[9][9]int, row, col, num int) bool {
	for i := 0; i < 9; i++ {
		if grid[row][i] == num || grid[i][col] == num {
			return false
		}
	}
	startRow := (row / 3) * 3
	startCol := (col / 3) * 3
	for i := 0; i < 3; i++ {
		for j := 0; j < 3; j++ {
			if grid[startRow+i][startCol+j] == num {
				return false
			}
		}
	}
	return true
}

func (s *SamuraiSudoku) solveGrid(grid *[9][9]int) bool {
	for row := 0; row < 9; row++ {
		for col := 0; col < 9; col++ {
			if grid[row][col] == 0 {
				for num := 1; num <= 9; num++ {
					if s.isValid(grid, row, col, num) {
						grid[row][col] = num
						if s.solveGrid(grid) {
							return true
						}
						grid[row][col] = 0
					}
				}
				return false
			}
		}
	}
	return true
}

func (s *SamuraiSudoku) solveSamurai() bool {
	for g := 0; g < 5; g++ {
		if !s.solveGrid(&s.grids[g]) {
			return false
		}
	}
	return true
}

func (s *SamuraiSudoku) display() {
	for g := 0; g < 5; g++ {
		fmt.Printf("Grid %d:\n", g+1)
		for row := 0; row < 9; row++ {
			for col := 0; col < 9; col++ {
				if s.grids[g][row][col] == 0 {
					fmt.Print(". ")
				} else {
					fmt.Printf("%d ", s.grids[g][row][col])
				}
			}
			fmt.Println()
		}
		fmt.Println()
	}
}

func main() {
	rand.Seed(time.Now().UnixNano())
	s := NewSamuraiSudoku()
	// Sample puzzle (same for all grids for demo)
	sample := [9][9]int{
		{5,3,0,0,7,0,0,0,0},
		{6,0,0,1,9,5,0,0,0},
		{0,9,8,0,0,0,0,6,0},
		{8,0,0,0,6,0,0,0,3},
		{4,0,0,8,0,3,0,0,1},
		{7,0,0,0,2,0,0,0,6},
		{0,6,0,0,0,0,2,8,0},
		{0,0,0,4,1,9,0,0,5},
		{0,0,0,0,8,0,0,7,9},
	}
	for g := 0; g < 5; g++ {
		s.grids[g] = sample
	}
	fmt.Println("Samurai Sudoku (demo)")
	s.display()
	fmt.Println("Solving...")
	if s.solveSamurai() {
		s.display()
	} else {
		fmt.Println("No solution found.")
	}
}
