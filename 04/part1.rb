#!/usr/bin/env ruby
# frozen_string_literal: true

require 'matrix'

input = File.readlines('./input.txt').map(&:chomp)

grid = Matrix[*input.map(&:chars)]
result = 0

grid.each_with_index do |element, row, col|
  next unless element == '@'

  adjacent_rolls = 0

  up = row - 1
  down = row + 1
  left = col - 1
  right = col + 1

  unless up.negative?
    adjacent_rolls += 1 if left >= 0 && grid[up, left] == '@'
    adjacent_rolls += 1 if grid[up, col] == '@'
    adjacent_rolls += 1 if right < grid.column_count && grid[up, right] == '@'
  end

  adjacent_rolls += 1 if left >= 0 && grid[row, left] == '@'
  adjacent_rolls += 1 if right < grid.column_count && grid[row, right] == '@'

  unless down >= grid.row_count
    adjacent_rolls += 1 if left >= 0 && grid[down, left] == '@'
    adjacent_rolls += 1 if grid[down, col] == '@'
    adjacent_rolls += 1 if right < grid.column_count && grid[down, right] == '@'
  end

  result += 1 if adjacent_rolls < 4
end

puts "Answer: #{result}"
