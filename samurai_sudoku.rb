# samurai_sudoku.rb
class SamuraiSudoku
  def initialize
    @grids = Array.new(5) { Array.new(9) { Array.new(9, 0) } }
  end

  def valid?(g, row, col, num)
    (0...9).each do |i|
      return false if @grids[g][row][i] == num || @grids[g][i][col] == num
    end
    sr = (row/3)*3
    sc = (col/3)*3
    (0...3).each do |i|
      (0...3).each do |j|
        return false if @grids[g][sr+i][sc+j] == num
      end
    end
    true
  end

  def solve_grid(g)
    (0...9).each do |row|
      (0...9).each do |col|
        next unless @grids[g][row][col] == 0
        (1..9).each do |num|
          if valid?(g, row, col, num)
            @grids[g][row][col] = num
            return true if solve_grid(g)
            @grids[g][row][col] = 0
          end
        end
        return false
      end
    end
    true
  end

  def solve_samurai
    (0...5).each { |g| return false unless solve_grid(g) }
    true
  end

  def display
    (0...5).each do |g|
      puts "Grid #{g+1}:"
      (0...9).each do |row|
        line = ''
        (0...9).each do |col|
          val = @grids[g][row][col]
          line << (val == 0 ? '. ' : "#{val} ")
        end
        puts line
      end
      puts
    end
  end
end

sample = [
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

s = SamuraiSudoku.new
(0...5).each do |g|
  (0...9).each do |i|
    (0...9).each do |j|
      s.instance_variable_get(:@grids)[g][i][j] = sample[i][j]
    end
  end
end
puts "Samurai Sudoku (demo)"
s.display
puts "Solving..."
if s.solve_samurai
  s.display
else
  puts "No solution."
end
