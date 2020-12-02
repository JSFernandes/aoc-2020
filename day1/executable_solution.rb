require_relative "solver"

input_array = File.read("./input").split.map(&:to_i)
solution = Solver.new(input_array).solve
puts solution
