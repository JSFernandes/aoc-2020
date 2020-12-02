class PasswordListValidator
  LINE_REGEX = /(\d+)-(\d+) ([a-z]): ([a-z]+)$/

  PasswordInformation = Struct.new(:first_digit, :second_digit, :letter, :password, keyword_init: true)

  def initialize(list_lines, validator_class)
    @parsed_lines = list_lines.map { |line| parse_list_line(line) }
    @validator_class = validator_class
  end

  def count_valids
    @parsed_lines.count do |password_information|
      validator = @validator_class.new(
        first_digit: password_information.first_digit,
        second_digit: password_information.second_digit,
        validated_letter: password_information.letter
      )
      validator.valid?(password_information.password)
    end
  end

  private

  def parse_list_line(line)
    first_digit, second_digit, letter, password = line.match(LINE_REGEX).captures
    PasswordInformation.new(
      first_digit: first_digit,
      second_digit: second_digit,
      letter: letter,
      password: password,
    )
  end
end
