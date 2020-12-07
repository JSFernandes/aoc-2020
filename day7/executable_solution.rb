require_relative "bag_rules_parser"
require_relative "solver"

input_array = File.read("./input").split("\n")
parsed_rules = BagRulesParser.parse(input_array)
solver = Solver.new(parsed_rules)
part1_solution = solver.find_possible_holders("shiny gold").length
puts "Part1 solution: #{part1_solution}"
part2_solution = solver.count_required_bags("shiny gold") - 1
puts "Part2 solution: #{part2_solution}"
