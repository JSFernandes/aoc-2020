class MultiSumSolver
  TARGET_SUM = 2020

  def initialize(input)
    @sorted_input = input.sort
  end

  def solve
    @sorted_input.each.with_index do |input_number, index|
      search_range = @sorted_input.slice(index + 1, @sorted_input.length)

      search_range.each.with_index do |search_range_number, search_range_index|
        corresponding_number = TARGET_SUM - input_number - search_range_number
        matching_number = search_range.slice(search_range_index + 1, search_range.length).bsearch { |x| corresponding_number - x }
        return input_number * search_range_number * matching_number if matching_number
      end
    end
  end
end
