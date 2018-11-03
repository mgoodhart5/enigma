require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def test_that_it_exists
    date = "300484"
    shift = Shift.new("05412", date)

    assert_instance_of Shift, shift
  end

  def test_that_it_takes_a_key_and_a_date
    date = Date.new
    shift = Shift.new("05412", date)

    assert_equal "05412", shift.key
    assert_instance_of Date, shift.date
  end

end
