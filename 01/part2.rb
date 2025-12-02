#!/usr/bin/env ruby
# frozen_string_literal: true

input = File.readlines('./input.txt').map(&:chomp)

result = 0
current = 50

input.each do |rotation|
  direction = rotation[0]
  clicks = rotation[1..].to_i

  clicks = -clicks if direction == 'L'
  count = (current + clicks) / 100
  current = (current + clicks) % 100

  result += count.abs
end

puts "Answer: #{result}"
