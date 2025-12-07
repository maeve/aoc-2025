#!/usr/bin/env ruby
# frozen_string_literal: true

require 'matrix'

input = File.readlines('./input.txt').map(&:chomp)

result = 0

grid = Matrix[*input.map { |line| line.split(' ') }]

grid.column_vectors.each do |vector|
  column = vector.to_a

  operator = column.pop
  operands = column.map(&:to_i)

  result += operands.inject(operator.to_sym)
end

puts "Answer: #{result}"
