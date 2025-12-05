#!/usr/bin/env ruby
# frozen_string_literal: true

input = File.readlines('./input.txt').map(&:chomp)

ranges = []

until (line = input.shift).empty?
  range = Range.new(*line.split('-').map(&:to_i))

  overlaps, ranges = ranges.partition { |r| r.overlap?(range) }

  if overlaps.empty?
    ranges << range
  else
    start = [range.min, *overlaps.map(&:min)].min
    finish = [range.max, *overlaps.map(&:max)].max

    ranges << (start..finish)
  end
end

fresh_ingredients = ranges.map { |r| r.max - r.min + 1 }

puts "Answer: #{fresh_ingredients.sum}"
