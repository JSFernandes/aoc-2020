class PasswordValidator
  def initialize(validated_letter:, min_instances:, max_instances:)
    @validated_letter = validated_letter
    @min_instances = min_instances.to_i
    @max_instances = max_instances.to_i
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
