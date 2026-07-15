// samurai_sudoku.swift
class SamuraiSudoku {
    var grids = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 9), count: 9), count: 5)

    func isValid(g: Int, row: Int, col: Int, num: Int) -> Bool {
        for i in 0..<9 {
            if grids[g][row][i] == num || grids[g][i][col] == num { return false }
        }
        let sr = (row / 3) * 3
        let sc = (col / 3) * 3
        for i in 0..<3 {
            for j in 0..<3 {
                if grids[g][sr+i][sc+j] == num { return false }
            }
        }
        return true
    }

    func solveGrid(g: Int) -> Bool {
        for row in 0..<9 {
            for col in 0..<9 {
                if grids[g][row][col] == 0 {
                    for num in 1...9 {
                        if isValid(g: g, row: row, col: col, num: num) {
                            grids[g][row][col] = num
                            if solveGrid(g: g) { return true }
                            grids[g][row][col] = 0
                        }
                    }
                    return false
                }
            }
        }
        return true
    }

    func solveSamurai() -> Bool {
        for g in 0..<5 {
            if !solveGrid(g: g) { return false }
        }
        return true
    }

    func display() {
        for g in 0..<5 {
            print("Grid \(g+1):")
            for row in 0..<9 {
                var line = ""
                for col in 0..<9 {
                    let val = grids[g][row][col]
                    line += (val == 0 ? ". " : "\(val) ")
                }
                print(line)
            }
            print()
        }
    }
}

let sample = [
    [5,3,0,0,7,0,0,0,0],
    [6,0,0,1,9,5,0,0,0],
    [0,9,8,0,0,0,0,6,0],
    [8,0,0,0,6,0,0,0,3],
    [4,0,0,8,0,3,0,0,1],
    [7,0,0,0,2,0,0,0,6],
    [0,6,0,0,0,0,2,8,0],
    [0,0,0,4,1,9,0,0,5],
    [0,0,0,0,8,0,0,7,9]
]

let s = SamuraiSudoku()
for g in 0..<5 {
    for i in 0..<9 {
        for j in 0..<9 {
            s.grids[g][i][j] = sample[i][j]
        }
    }
}
print("Samurai Sudoku (demo)")
s.display()
print("Solving...")
if s.solveSamurai() {
    s.display()
} else {
    print("No solution.")
}
