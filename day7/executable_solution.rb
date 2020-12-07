require_relative "bag_rules_parser"
require_relative "solver"

input_array = File.read("./input").split("\n")
parsed_rules = BagRulesParser.parse(input_array)
part1_solution = Solver.new(parsed_rules).solve_for("shiny gold").length
puts "Part1 solution: #{part1_solution}"
