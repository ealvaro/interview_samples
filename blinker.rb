# frozen_string_literal: true

# Conway’s Game of Life is a cellular automation devised by British mathematician John Conway in 1970.
# (Conway sadly passed away in 2020 after complications from COVID).
# It’s a zero-player “game” where the game state evolves by a combination of initial conditions and predefined rules.
# The beauty of the game lies in its ability to generate complex evolving patterns.

# We are going to implement the state-change logic for this game.

# The cells exist in a 2 dimensional grid. For our purposes, it will be finite. Each cell has 8 neighbors (except possibly at the edges).
# At time-step T+1, the following transitions occur
# Any live cell at time T with < 2 live neighbors dies (by underpopulation)
# Any live cell at time T  with exactly 2 or 3 live neighbors survives
# Any live cell at time T with > 3 live neighbors dies (by overpopulation)
# Any dead cell with exactly 3 live neighbors becomes alive (by reproduction)

class BlinkerGame
  # The interface to implement is

  # Transition exactly one timestep
  #    Grid is a 2D array
  def self.transition(old_state)
    new_state = Array.new(old_state.length) { Array.new(old_state[0].length, 0) }
    old_state.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        live_neighbors = count_live_neighbors(old_state, i, j)
        if cell == 1
          if live_neighbors < 2
            new_state[i][j] = 0
          elsif [2, 3].include?(live_neighbors)
            new_state[i][j] = 1
          elsif live_neighbors > 3
            new_state[i][j] = 0
          end
        elsif cell.zero?
          new_state[i][j] = 1 if live_neighbors == 3
        end
      end
    end
    new_state
  end

  def self.count_live_neighbors(grid, i, j)
    live_count = 0
    (i - 1..i + 1).each do |x|
      (j - 1..j + 1).each do |y|
        next if x == i && y == j
        next if x.negative? || x >= grid.length || y.negative? || y >= grid[0].length

        live_count += grid[x][y]
      end
    end
    live_count
  end

  def self.pp(array)
    array.each do |row|
      puts row.inspect
    end
  end
end
# old_state = [
# 	[0,1,0],
# 	[0,1,0],
# 	[0,1,0]
# ]
old_state = [
  [0, 1, 1, 1, 0],
  [1, 0, 0, 0, 1],
  [1, 0, 0, 0, 1],
  [1, 0, 0, 0, 1],
  [0, 1, 1, 1, 0]
]
BlinkerGame.pp old_state
puts
new_state = BlinkerGame.transition(old_state)
BlinkerGame.pp new_state
puts
old_state = BlinkerGame.transition(new_state)
BlinkerGame.pp old_state

#Output
# [0, 1, 1, 1, 0]
# [1, 0, 0, 0, 1]
# [1, 0, 0, 0, 1]
# [1, 0, 0, 0, 1]
# [0, 1, 1, 1, 0]

# [0, 1, 1, 1, 0]
# [1, 0, 1, 0, 1]
# [1, 1, 0, 1, 1]
# [1, 0, 1, 0, 1]
# [0, 1, 1, 1, 0]

# [0, 1, 1, 1, 0]
# [1, 0, 0, 0, 1]
# [1, 0, 0, 0, 1]
# [1, 0, 0, 0, 1]
# [0, 1, 1, 1, 0]
# [Finished in 134ms]
