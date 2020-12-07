require_relative "anyone_solver"
require_relative "everyone_solver"

input_array = File.read("./input").split("\n\n")
part1_solution = AnyoneSolver.new(input_array).count_answers
puts "Part1 solution: #{part1_solution}"
part2_solution = EveryoneSolver.new(input_array).count_answers
puts "Part2 solution: #{part2_solution}"
