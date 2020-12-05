require_relative "passport_list_parser"

passports = PassportListParser.parse_file("input")
part1_solution = passports.count(&:valid?)
puts "Part1 solution: #{part1_solution}"
