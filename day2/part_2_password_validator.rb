class Part2PasswordValidator
  def initialize(validated_letter:, first_digit:, second_digit:)
    @validated_letter = validated_letter
    @first_position = first_digit.to_i - 1
    @second_position = second_digit.to_i - 1
  end

  def valid?(password)
    (password[@first_position] == @validated_letter) ^ (password[@second_position] == @validated_letter)
  end
end
