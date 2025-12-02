#!/usr/bin/env ruby
# frozen_string_literal: true

input = File.readlines('./input.txt').map(&:chomp)

results = []

input.each do |line|
  line.split(',').each do |range|
    start, finish = range.split('-')
    invalid_ids = []

    (start..finish).each do |id|
      next unless id.length.even?
      middle = id.length / 2
      invalid_ids << id if id[0...middle] == id[middle..]
    end

    if invalid_ids.empty?
      puts "- #{range} contains no invalid IDs."
    else
      puts "- #{range} has #{invalid_ids.size} invalids IDs, #{invalid_ids.join(' and ')}."
    end

    results += invalid_ids
  end
end

puts "Answer: #{results.map(&:to_i).sum}"
