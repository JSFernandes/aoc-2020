require_relative "solver"
require_relative "multi_sum_solver"

input_array = File.read("./input").split.map(&:to_i)
part1_solution = Solver.new(input_array).solve
puts "Part1 solution: #{part1_solution}"
part2_solution = MultiSumSolver.new(input_array).solve
puts "Part2 solution: #{part2_solution}"
