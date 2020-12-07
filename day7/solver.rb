class Solver
  def initialize(bag_rules)
    @bag_rules = bag_rules
  end

  def find_possible_holders(bag_color, already_known = [])
    rules_to_analyze = @bag_rules.reject { |color, _| already_known.include?(color) }
    can_hold_it = rules_to_analyze.select { |_, content_rules| content_rules.rules.any? { |rule| rule.color == bag_color } }.keys

    can_hold_indirectly = can_hold_it.map do |color|
      find_possible_holders(color, [*already_known, *can_hold_it])
    end.flatten.uniq

    [*can_hold_it, *can_hold_indirectly]
  end

  def count_required_bags(bag_color)
    @bag_rules[bag_color].rules.reduce(1) do |accumulated_count, rule|
      accumulated_count + rule.quantity * count_required_bags(rule.color)
    end
  end
end
