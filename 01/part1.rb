#!/usr/bin/env ruby
# frozen_string_literal: true

input = File.readlines('./input.txt').map(&:chomp)

result = 0
current = 50

puts "The dial starts by pointing at #{current}."

input.each do |rotation|
  direction = rotation[0]
  clicks = rotation[1..].to_i

  clicks = -clicks if direction == 'L'
  current = (current + clicks) % 100

  puts "The dial is rotated #{rotation} to point at #{current}."

  result += 1 if current.zero?
end

puts "Answer: #{result}"
