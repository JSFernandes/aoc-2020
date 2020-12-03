require_relative "solver"

input_array = File.read("./input").split("\n").map { |row| row.split("") }
part1_solution = Solver.new(input_array).solve(3, 1)
puts "Part1 solution: #{part1_solution}"
