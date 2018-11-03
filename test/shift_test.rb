require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def test_that_it_exists
    shift = Shift.new("05412")

    assert_instance_of Shift, shift
  end

  def test_that_it_takes_a_key_and_a_date_or_has_a_default
    shift = Shift.new("05412", "300484")

    assert_equal "05412", shift.key
    assert_equal "300484", shift.date

    shift = Shift.new("05412")

    assert_instance_of Date, shift.date
  end

end
