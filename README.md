🧩 Samurai Sudoku – Multi‑Language Edition
A Samurai Sudoku solver and generator – five interconnected 9×9 grids that share central blocks, creating a challenging puzzle experience.
Built in 7 programming languages – each implementation features puzzle generation, solving with backtracking, validation, and clean terminal output.

✨ Features
Samurai Sudoku format – 5 overlapping grids (one centre, four corners) with shared 3×3 blocks.

Puzzle generation – creates a valid, solvable Samurai Sudoku with a unique solution (or a random seeded puzzle).

Solving engine – uses backtracking with constraint propagation for fast solving.

Validation – checks row, column, and block constraints across all grids.

Display – prints the full Samurai layout in a readable format (with grid borders and overlap highlighting).

Interactive mode – allows users to input their own puzzles or generate new ones.

Export/Import – save/load puzzles to/from a text file (optional, implemented in some languages).

🗂 Languages & Files
Language	File
Python	samurai_sudoku.py
Go	samurai_sudoku.go
JavaScript (Node)	samurai_sudoku.js
C#	SamuraiSudoku.cs
Java	SamuraiSudoku.java
Ruby	samurai_sudoku.rb
Swift	samurai_sudoku.swift
🚀 How to Run
Each file is standalone – run it with the appropriate interpreter/compiler.

Language	Command
Python	python samurai_sudoku.py
Go	go run samurai_sudoku.go
JavaScript	node samurai_sudoku.js
C#	dotnet run (or csc SamuraiSudoku.cs && SamuraiSudoku.exe)
Java	javac SamuraiSudoku.java && java SamuraiSudoku
Ruby	ruby samurai_sudoku.rb
Swift	swift samurai_sudoku.swift
📊 Example Output
text
Samurai Sudoku (5 grids)
+-------+-------+-------+-------+-------+
| . . . | . . . | . . . | . . . | . . . |
| . . . | . . . | . . . | . . . | . . . |
| . . . | . . . | . . . | . . . | . . . |
...
(Full 45×45 layout with borders.)

🎮 Controls (Interactive Mode)
Generate a new puzzle – press g

Solve the current puzzle – press s

Display the puzzle – press d

Quit – press q

📜 License
MIT – use freely.
