require_relative "password_validator"

class PasswordListValidator
  LINE_REGEX = /(\d+)-(\d+) ([a-z]): ([a-z]+)$/

  PasswordInformation = Struct.new(:min_instances, :max_instances, :letter, :password, keyword_init: true)

  def initialize(list_lines)
    @parsed_lines = list_lines.map { |line| parse_list_line(line) }
  end

  def count_valids
    @parsed_lines.count do |password_information|
      validator = PasswordValidator.new(
        min_instances: password_information.min_instances,
        max_instances: password_information.max_instances,
        validated_letter: password_information.letter
      )
      validator.valid?(password_information.password)
    end
  end

  private

  def parse_list_line(line)
    minimum, maximum, letter, password = line.match(LINE_REGEX).captures
    PasswordInformation.new(
      min_instances: minimum,
      max_instances: maximum,
      letter: letter,
      password: password,
    )
  end
end
