require_relative "password_list_validator"
require_relative "password_validator"
require_relative "part_2_password_validator"

input_array = File.read("./input").split("\n")
part1_solution = PasswordListValidator.new(input_array, PasswordValidator).count_valids
puts "Part1 solution: #{part1_solution}"
part2_solution = PasswordListValidator.new(input_array, Part2PasswordValidator).count_valids
puts "Part2 solution: #{part2_solution}"
