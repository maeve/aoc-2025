#!/usr/bin/env ruby
# frozen_string_literal: true

require 'matrix'

input = File.readlines('./input.txt').map(&:chomp)

class Grid
  def initialize(input)
    @grid = Matrix[*input.map(&:chars)]
  end

  def remove_available_rolls!
    result = 0

    @grid.each_with_index do |_, row, col|
      next unless available_roll?(row, col)

      result += 1
      @grid[row, col] = 'x'
    end

    result
  end

  def available_roll?(row, col)
    return false unless @grid[row, col] == '@'

    adjacent_rolls = 0

    up = row - 1
    down = row + 1
    left = col - 1
    right = col + 1

    unless up.negative?
      adjacent_rolls += 1 if left >= 0 && @grid[up, left] == '@'
      adjacent_rolls += 1 if @grid[up, col] == '@'
      adjacent_rolls += 1 if right < @grid.column_count && @grid[up, right] == '@'
    end

    adjacent_rolls += 1 if left >= 0 && @grid[row, left] == '@'
    adjacent_rolls += 1 if right < @grid.column_count && @grid[row, right] == '@'

    unless down >= @grid.row_count
      adjacent_rolls += 1 if left >= 0 && @grid[down, left] == '@'
      adjacent_rolls += 1 if @grid[down, col] == '@'
      adjacent_rolls += 1 if right < @grid.column_count && @grid[down, right] == '@'
    end

    adjacent_rolls < 4
  end
end

grid = Grid.new(input)
result = 0

loop do
  rolls_removed = grid.remove_available_rolls!
  break if rolls_removed.zero?

  result += rolls_removed
end

puts "Answer: #{result}"
