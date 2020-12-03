class Solver
  def initialize(geography)
    @geography = geography
  end

  def solve(slope_right, slope_down, current_trees: 0, current_horizontal_coordinate: 0, current_vertical_coordinate: 0)
    return current_trees if current_vertical_coordinate >= @geography.length

    is_on_tree = @geography[current_vertical_coordinate][current_horizontal_coordinate] == "#"
    solve(
      slope_right,
      slope_down,
      current_trees: is_on_tree ? current_trees + 1 : current_trees,
      current_horizontal_coordinate: (current_horizontal_coordinate + slope_right) % @geography[0].length,
      current_vertical_coordinate: current_vertical_coordinate + slope_down,
    )
  end
end
