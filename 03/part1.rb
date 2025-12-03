#!/usr/bin/env ruby
# frozen_string_literal: true

input = File.readlines('./input.txt').map(&:chomp)

joltages = []

input.each do |line|
  bank = line.chars.map(&:to_i)
  first_digit = bank[0...-1].max

  second_digit = bank[(bank.index(first_digit) + 1)..].max

  joltages << "#{first_digit}#{second_digit}".to_i
end

puts "Answer: #{joltages.sum}"
