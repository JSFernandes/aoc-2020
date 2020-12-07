class Solver
  def initialize(bag_rules)
    @bag_rules = bag_rules
  end

  def solve_for(bag_color, already_known = [])
    rules_to_analyze = @bag_rules.reject { |color, _| already_known.include?(color) }
    can_hold_it = rules_to_analyze.select { |_, content_rules| content_rules.rules.any? { |rule| rule.color == bag_color } }.keys

    can_hold_indirectly = can_hold_it.map do |color|
      solve_for(color, [*already_known, *can_hold_it])
    end.flatten.uniq

    [*can_hold_it, *can_hold_indirectly]
  end
end
