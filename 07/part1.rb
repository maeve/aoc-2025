#!/usr/bin/env ruby
# frozen_string_literal: true

lines = File.readlines('./input.txt').map(&:chomp)

class Manifold
  attr_reader :grid

  START = 'S'
  SPLITTER = '^'
  BEAM = '|'

  def initialize(input)
    @grid = input.map(&:chars)
  end

  def split_tachyon_beam
    count = 0

    start_index = grid.first.find_index(START)
    prev_indexes = [grid.first.find_index(START)]

    grid.slice(1..-1).each do |row|
      curr_indexes = []

      prev_indexes.each do |index|
        split = false
        if row[index] == SPLITTER
          left = index - 1
          if !left.negative? && !curr_indexes.include?(left)
            curr_indexes << left
            split = true
          end

          right = index + 1
          if right < row.size && !curr_indexes.include?(right)
            curr_indexes << right
            split = true
          end
        else
          curr_indexes << index
        end

        count += 1 if split
      end

      prev_indexes = curr_indexes
    end

    count
  end
end

manifold = Manifold.new(lines)
result = manifold.split_tachyon_beam

puts "Answer: #{result}"
