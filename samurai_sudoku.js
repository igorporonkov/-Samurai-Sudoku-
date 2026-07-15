// samurai_sudoku.js
class SamuraiSudoku {
    constructor() {
        this.grids = Array.from({length:5}, () => Array.from({length:9}, () => Array(9).fill(0)));
    }

    isValid(grid, row, col, num) {
        for (let i = 0; i < 9; i++) {
            if (grid[row][i] === num || grid[i][col] === num) return false;
        }
        let sr = Math.floor(row/3)*3, sc = Math.floor(col/3)*3;
        for (let i = 0; i < 3; i++)
            for (let j = 0; j < 3; j++)
                if (grid[sr+i][sc+j] === num) return false;
        return true;
    }

    solveGrid(grid) {
        for (let row = 0; row < 9; row++) {
            for (let col = 0; col < 9; col++) {
                if (grid[row][col] === 0) {
                    for (let num = 1; num <= 9; num++) {
                        if (this.isValid(grid, row, col, num)) {
                            grid[row][col] = num;
                            if (this.solveGrid(grid)) return true;
                            grid[row][col] = 0;
                        }
                    }
                    return false;
                }
            }
        }
        return true;
    }

    solveSamurai() {
        for (let g = 0; g < 5; g++) {
            if (!this.solveGrid(this.grids[g])) return false;
        }
        return true;
    }

    display() {
        for (let g = 0; g < 5; g++) {
            console.log(`Grid ${g+1}:`);
            for (let row = 0; row < 9; row++) {
                let line = '';
                for (let col = 0; col < 9; col++) {
                    line += (this.grids[g][row][col] === 0 ? '.' : this.grids[g][row][col]) + ' ';
                }
                console.log(line);
            }
            console.log();
        }
    }
}

// Sample puzzle
const sample = [
    [5,3,0,0,7,0,0,0,0],
    [6,0,0,1,9,5,0,0,0],
    [0,9,8,0,0,0,0,6,0],
    [8,0,0,0,6,0,0,0,3],
    [4,0,0,8,0,3,0,0,1],
    [7,0,0,0,2,0,0,0,6],
    [0,6,0,0,0,0,2,8,0],
    [0,0,0,4,1,9,0,0,5],
    [0,0,0,0,8,0,0,7,9]
];

const s = new SamuraiSudoku();
for (let g = 0; g < 5; g++) {
    s.grids[g] = sample.map(row => [...row]);
}
console.log("Samurai Sudoku (demo)");
s.display();
console.log("Solving...");
if (s.solveSamurai()) {
    s.display();
} else {
    console.log("No solution.");
}
