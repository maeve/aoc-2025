#!/usr/bin/env ruby
# frozen_string_literal: true

input = File.readlines('./input.txt').map(&:chomp)

fresh_ingredients = []

until (line = input.shift).empty?
  start, finish = line.split('-').map(&:to_i)
  fresh_ingredients += (start..finish).to_a
end

puts "Answer: #{fresh_ingredients.uniq.size}"
