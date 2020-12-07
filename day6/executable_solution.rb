require_relative "solver"

input_array = File.read("./input").split("\n\n")
solver = Solver.new(input_array)
part1_solution = solver.count_answers
puts "Part1 solution: #{part1_solution}"
