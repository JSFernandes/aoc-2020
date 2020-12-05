class Passport
  REQUIRED_FIELDS = %w(byr iyr eyr hgt hcl ecl pid).freeze

  def initialize(fields)
    @fields = fields
  end

  def valid?
    REQUIRED_FIELDS.all? { |field_key| @fields[field_key].to_s.length > 0 }
  end
end
