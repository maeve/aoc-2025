#!/usr/bin/env ruby
# frozen_string_literal: true

input = File.readlines('./input.txt').map(&:chomp)

ranges = []
fresh_ingredients = []

until (line = input.shift).empty?
  start, finish = line.split('-').map(&:to_i)
  ranges << (start..finish)
end

input.each do |ingredient|
  fresh_ingredients << ingredient if ranges.any? { |r| r.include?(ingredient.to_i) }
end

puts "Answer: #{fresh_ingredients.size}"
