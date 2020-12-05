require_relative "seat"

class FreeSeatFinder
  def initialize(seat_ids)
    @sorted_seat_ids = seat_ids.sort
  end

  def find_free_seat
    @sorted_seat_ids.each.with_index do |seat_id, index|
      next if seat_id < Seat::NUM_COLUMNS

      expected_id = @sorted_seat_ids[index - 1] + 1
      skipped_id = seat_id != expected_id
      return expected_id if skipped_id
    end
  end
end
