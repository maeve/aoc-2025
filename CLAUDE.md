# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains solutions for Advent of Code 2025, an annual programming challenge with daily puzzles released throughout December.

## Repository Structure

Each day's solution is organized in its own directory with zero-padded numbering:

```
01/
├── part1.rb       # Solution for part 1
├── part2.rb       # Solution for part 2
├── input.txt      # Actual puzzle input
└── test-input.txt # Sample/example input
```

Some days may have additional test input files (e.g., `test-input2.txt`) when the puzzle provides multiple examples.

## Running Solutions

All Ruby scripts are executable and can be run directly:

```bash
cd 01
./part1.rb  # Run part 1
./part2.rb  # Run part 2
```

To test with sample input, temporarily modify the filename in the script from `input.txt` to `test-input.txt`.

## Ruby Code Conventions

All solution files follow these conventions:

- Start with shebang: `#!/usr/bin/env ruby`
- Include frozen string literal pragma: `# frozen_string_literal: true`
- Read input using: `File.readlines('./input.txt').map(&:chomp)`
- Output answers using: `puts "Answer: #{result}"`
- Scripts are executable (chmod +x)

Solutions may be simple procedural code or include classes when the problem complexity warrants it. Use whatever approach makes the solution clearest.

## Creating New Day Solutions

When creating solutions for a new day:

1. Create a new directory with zero-padded day number (e.g., `01`, `02`, etc.)
2. Create `part1.rb` and `part2.rb` with the standard header
3. Add `input.txt` with the puzzle input from the AoC website
4. Add `test-input.txt` with the sample input from the puzzle description
5. Make scripts executable: `chmod +x XX/part1.rb XX/part2.rb`
