// SamuraiSudoku.cs
using System;

class SamuraiSudoku
{
    int[,,] grids = new int[5,9,9];

    bool IsValid(int[,,] grid, int g, int row, int col, int num)
    {
        for (int i = 0; i < 9; i++)
            if (grid[g,row,i] == num || grid[g,i,col] == num) return false;
        int sr = (row/3)*3, sc = (col/3)*3;
        for (int i = 0; i < 3; i++)
            for (int j = 0; j < 3; j++)
                if (grid[g,sr+i,sc+j] == num) return false;
        return true;
    }

    bool SolveGrid(int[,,] grid, int g)
    {
        for (int row = 0; row < 9; row++)
            for (int col = 0; col < 9; col++)
                if (grid[g,row,col] == 0)
                {
                    for (int num = 1; num <= 9; num++)
                        if (IsValid(grid, g, row, col, num))
                        {
                            grid[g,row,col] = num;
                            if (SolveGrid(grid, g)) return true;
                            grid[g,row,col] = 0;
                        }
                    return false;
                }
        return true;
    }

    bool SolveSamurai()
    {
        for (int g = 0; g < 5; g++)
            if (!SolveGrid(grids, g)) return false;
        return true;
    }

    void Display()
    {
        for (int g = 0; g < 5; g++)
        {
            Console.WriteLine($"Grid {g+1}:");
            for (int row = 0; row < 9; row++)
            {
                for (int col = 0; col < 9; col++)
                    Console.Write((grids[g,row,col] == 0 ? '.' : grids[g,row,col].ToString()) + " ");
                Console.WriteLine();
            }
            Console.WriteLine();
        }
    }

    static void Main()
    {
        var s = new SamuraiSudoku();
        // Sample puzzle
        int[,] sample = new int[,] {
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
                    s.grids[g,i,j] = sample[i,j];
        Console.WriteLine("Samurai Sudoku (demo)");
        s.Display();
        Console.WriteLine("Solving...");
        if (s.SolveSamurai())
            s.Display();
        else
            Console.WriteLine("No solution.");
    }
}
