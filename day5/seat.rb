class Seat
  MAX_ROW = 127.freeze
  MAX_COLUMN = 7.freeze

  def initialize(seat_string)
    @row_string = seat_string[0..6]
    @column_string = seat_string[7..-1]
  end

  def row
    return @row if @row

    @row = binary_search(
      seat_string: @row_string,
      max_value: MAX_ROW,
      min_value: 0,
      more_token: "B",
      less_token: "F",
    )
  end

  def column
    return @column if @column

    @column = binary_search(
      seat_string: @column_string,
      max_value: MAX_COLUMN,
      min_value: 0,
      more_token: "R",
      less_token: "L",
    )
  end

  def seat_id
    row * 8 + column
  end

  private

  def binary_search(seat_string:, max_value:, min_value:, more_token:, less_token:)
    return min_value if seat_string.length == 0

    if seat_string[0] == more_token
      binary_search(
        seat_string: seat_string[1..-1],
        max_value: max_value,
        min_value: ((max_value + min_value) / 2.0).ceil,
        more_token: more_token,
        less_token: less_token,
      )
    else
      binary_search(
        seat_string: seat_string[1..-1],
        max_value: ((max_value + min_value) / 2.0).floor,
        min_value: min_value,
        more_token: more_token,
        less_token: less_token,
      )
    end
  end
end
