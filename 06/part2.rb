#!/usr/bin/env ruby
# frozen_string_literal: true

lines = File.readlines('./input.txt').map(&:chomp)

result = 0

operator_input = lines.pop

grid = lines.map(&:chars)

until operator_input.empty?
  operator = operator_input.match(/^[^ ] */)[0]
  operator_input.sub!(operator, '')

  operand_inputs = []

  grid.each do |line|
    operand_inputs << line.shift(operator.length)
  end

  operands = []

  operand_inputs.transpose.each do |row|
    value = row.join.strip
    next if value.empty?

    operands << value.to_i
  end

  result += operands.inject(operator.strip.to_sym)
end

puts "Answer: #{result}"
