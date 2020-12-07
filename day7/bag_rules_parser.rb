require_relative "bag_rule"

class BagRulesParser
  RULES_SENTENCE_REGEX = /(.+) bags contain( no other bags\.|( \d+ .+ bags?(,|\.))+)/
  NO_CONTENTS_SENTENCE = "no other bags"
  BAG_RULE_PART_REGEX = /(\d+) (.+) bag/

  def self.parse(sentences)
    sentences.each_with_object({}) do |sentence, bag_rules|
      bag_rule_color, bag_rule_contents = sentence.match(RULES_SENTENCE_REGEX).captures
      bag_rules[bag_rule_color] = BagRule.new(parse_rule_contents(bag_rule_contents))
    end
  end

  def self.parse_rule_contents(bag_rule_contents)
    return [] if bag_rule_contents.match(NO_CONTENTS_SENTENCE)

    bag_rule_parts = bag_rule_contents.split(",")
    bag_rule_parts.map do |rule_part|
      quantity, color = rule_part.match(BAG_RULE_PART_REGEX).captures
      ContentRule.new(quantity.to_i, color)
    end
  end
end
