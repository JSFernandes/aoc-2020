class Solver
  def initialize(groups_answers)
    @groups_answers = groups_answers
  end

  def count_answers
    normalized_groups_answers.map(&:length).sum
  end

  private

  def normalized_groups_answers
    @normalized_groups_answers ||= @groups_answers.map { |answers| answers.delete("\n").chars.uniq }
  end
end
