class Passport
  REQUIRED_FIELDS = %w(byr iyr eyr hgt hcl ecl pid).freeze
  MIN_BIRTH_YEAR = 1920.freeze
  MAX_BIRTH_YEAR = 2002.freeze
  MIN_ISSUE_YEAR = 2010.freeze
  MAX_ISSUE_YEAR = 2020.freeze
  MIN_EXPIRATION_YEAR = 2020.freeze
  MAX_EXPIRATION_YEAR = 2030.freeze
  HEIGHT_REGEX = /^(\d+)(cm|in)$/.freeze
  MIN_HEIGHT_CM = 150.freeze
  MAX_HEIGHT_CM = 193.freeze
  MIN_HEIGHT_IN = 59.freeze
  MAX_HEIGHT_IN = 76.freeze
  VALID_HAIR_COLOR_REGEX = /^#[0-9,a-f]{6}$/.freeze
  VALID_EYE_COLORS = %w(amb blu brn gry grn hzl oth).freeze
  VALID_PID_REGEX = /^\d{9}$/.freeze

  attr_reader :fields

  def initialize(fields)
    @fields = fields
  end

  def valid?
    required_fields_present? && valid_birth_year? && valid_issue_year? && valid_expiration_year? && \
      valid_height? && valid_hair_color? && valid_eye_color? && valid_password_id?
  end

  def required_fields_present?
    REQUIRED_FIELDS.all? { |field_key| @fields[field_key].to_s.length > 0 }
  end

  private

  def string_number_between?(string_number, min, max)
    converted_string = string_number.to_i
    converted_string >= min && converted_string <= max
  end

  def valid_birth_year?
    string_number_between?(@fields["byr"], MIN_BIRTH_YEAR, MAX_BIRTH_YEAR)
  end

  def valid_issue_year?
    string_number_between?(@fields["iyr"], MIN_ISSUE_YEAR, MAX_ISSUE_YEAR)
  end

  def valid_expiration_year?
    string_number_between?(@fields["eyr"], MIN_EXPIRATION_YEAR, MAX_EXPIRATION_YEAR)
  end

  def valid_height?
    height_match = @fields["hgt"].match(HEIGHT_REGEX)
    return false unless height_match

    height, height_format = height_match.captures
    case height_format
    when "cm"
      string_number_between?(height, MIN_HEIGHT_CM, MAX_HEIGHT_CM)
    when "in"
      string_number_between?(height, MIN_HEIGHT_IN, MAX_HEIGHT_IN)
    else
      false
    end
  end

  def valid_hair_color?
    @fields["hcl"].match(VALID_HAIR_COLOR_REGEX)
  end

  def valid_eye_color?
    VALID_EYE_COLORS.include?(@fields["ecl"])
  end

  def valid_password_id?
    @fields["pid"].match(VALID_PID_REGEX)
  end
end
