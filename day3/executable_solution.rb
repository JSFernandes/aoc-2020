require_relative "solver"

input_array = File.read("./input").split("\n").map { |row| row.split("") }
solver = Solver.new(input_array)
part1_solution = solver.solve(3, 1)
puts "Part1 solution: #{part1_solution}"

part2_solution_parts = [solver.solve(1, 1), part1_solution, solver.solve(5, 1), solver.solve(7, 1), solver.solve(1, 2)]
part2_solution = part2_solution_parts.reduce(:*)
puts "Part2 solution: #{part2_solution}"
