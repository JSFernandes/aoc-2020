class PasswordValidator
  def initialize(validated_letter:, first_digit:, second_digit:)
    @validated_letter = validated_letter
    @min_instances = first_digit.to_i
    @max_instances = second_digit.to_i
  end

  def valid?(password)
    instance_count = 0
    password.each_char do |char|
      instance_count += 1 if char == @validated_letter
      return false if instance_count > @max_instances
    end
    instance_count >= @min_instances
  end
end
