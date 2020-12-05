require_relative "seat"

seat_strings = File.read("./input").split("\n")
part1_solution = seat_strings.map { |seat_string| Seat.new(seat_string).seat_id }.max
puts "Part1 solution: #{part1_solution}"
