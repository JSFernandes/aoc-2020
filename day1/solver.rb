class Solver
  TARGET_SUM = 2020

  def initialize(input)
    @sorted_input = input.sort
  end

  def solve
    @sorted_input.each.with_index do |input_number, index|
      corresponding_number = TARGET_SUM - input_number
      matching_number = @sorted_input.slice(index + 1, @sorted_input.length).bsearch { |x| corresponding_number - x }
      return input_number * matching_number if matching_number
    end
  end
end
