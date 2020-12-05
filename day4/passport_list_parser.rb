require_relative "passport"

class PassportListParser
  def self.parse_file(file_name)
    File.read("./input").split("\n\n").map do |file_line|
      parse_passport(file_line)
    end
  end

  def self.parse_passport(passport_data)
    data_hash = passport_data.split.reduce({}) do |accumulated, kv_pair|
      data_key, data_value = kv_pair.split(":")
      accumulated[data_key] = data_value
      accumulated
    end
    Passport.new(data_hash)
  end
end
