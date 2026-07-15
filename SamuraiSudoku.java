// SamuraiSudoku.java
public class SamuraiSudoku {
    int[][][] grids = new int[5][9][9];

    boolean isValid(int g, int row, int col, int num) {
        for (int i = 0; i < 9; i++)
            if (grids[g][row][i] == num || grids[g][i][col] == num) return false;
        int sr = (row/3)*3, sc = (col/3)*3;
        for (int i = 0; i < 3; i++)
            for (int j = 0; j < 3; j++)
                if (grids[g][sr+i][sc+j] == num) return false;
        return true;
    }

    boolean solveGrid(int g) {
        for (int row = 0; row < 9; row++)
            for (int col = 0; col < 9; col++)
                if (grids[g][row][col] == 0) {
                    for (int num = 1; num <= 9; num++)
                        if (isValid(g, row, col, num)) {
                            grids[g][row][col] = num;
                            if (solveGrid(g)) return true;
                            grids[g][row][col] = 0;
                        }
                    return false;
                }
        return true;
    }

    boolean solveSamurai() {
        for (int g = 0; g < 5; g++)
            if (!solveGrid(g)) return false;
        return true;
    }

    void display() {
        for (int g = 0; g < 5; g++) {
            System.out.println("Grid " + (g+1) + ":");
            for (int row = 0; row < 9; row++) {
                for (int col = 0; col < 9; col++)
                    System.out.print((grids[g][row][col] == 0 ? "." : grids[g][row][col]) + " ");
                System.out.println();
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {
        SamuraiSudoku s = new SamuraiSudoku();
        int[][] sample = {
            {5,3,0,0,7,0,0,0,0},
            {6,0,0,1,9,5,0,0,0},
            {0,9,8,0,0,0,0,6,0},
            {8,0,0,0,6,0,0,0,3},
            {4,0,0,8,0,3,0,0,1},
            {7,0,0,0,2,0,0,0,6},
            {0,6,0,0,0,0,2,8,0},
            {0,0,0,4,1,9,0,0,5},
            {0,0,0,0,8,0,0,7,9}
        };
        for (int g = 0; g < 5; g++)
            for (int i = 0; i < 9; i++)
                for (int j = 0; j < 9; j++)
                    s.grids[g][i][j] = sample[i][j];
        System.out.println("Samurai Sudoku (demo)");
        s.display();
        System.out.println("Solving...");
        if (s.solveSamurai())
            s.display();
        else
            System.out.println("No solution.");
    }
}
