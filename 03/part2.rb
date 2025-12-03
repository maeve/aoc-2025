#!/usr/bin/env ruby
# frozen_string_literal: true

input = File.readlines('./input.txt').map(&:chomp)

joltages = []

input.each do |line|
  bank = line.chars.map(&:to_i)
  digits = []

  until digits.size == 12
    initial_index = bank.index(digits.last) || -1
    bank = bank.slice((initial_index + 1)..)
    digits << bank[0..-(12 - digits.size)].max
  end

  joltages << digits.map(&:to_s).join.to_i
end

puts "Answer: #{joltages.sum}"
