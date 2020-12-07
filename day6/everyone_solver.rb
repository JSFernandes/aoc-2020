class EveryoneSolver
  def initialize(groups_answers)
    @groups_answers = groups_answers
  end

  def count_answers
    normalized_groups_answers.map { |group_answers| count_answers_for_group(group_answers) }.sum
  end

  private

  def normalized_groups_answers
    @normalized_groups_answers ||= @groups_answers.map { |answers| answers.split("\n") }
  end

  def count_answers_for_group(group_array)
    shortest_string = group_array.min { |a, b| a.length <=> b.length }
    shortest_string.chars.reduce(0) do |count, answer_char|
      count += 1 if group_array.all? { |answer| answer.match(answer_char) }
      count
    end
  end
end
