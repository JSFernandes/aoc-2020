require_relative "seat"
require_relative "free_seat_finder"

seat_strings = File.read("./input").split("\n")
seat_ids = seat_strings.map { |seat_string| Seat.new(seat_string).seat_id }
part1_solution = seat_ids.max
puts "Part1 solution: #{part1_solution}"
part2_solution = FreeSeatFinder.new(seat_ids).find_free_seat
puts "Part2 solution: #{part2_solution}"
