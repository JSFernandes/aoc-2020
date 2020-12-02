require_relative "password_list_validator"

input_array = File.read("./input").split("\n")
part1_solution = PasswordListValidator.new(input_array).count_valids
puts "Part1 solution: #{part1_solution}"
