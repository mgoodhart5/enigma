require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def test_that_it_exists
    shift = Shift.new("05412")

    assert_instance_of Shift, shift
  end

  def test_that_it_takes_a_key_and_a_date_or_has_a_default_Date
    shift = Shift.new("05412", "300484")

    assert_equal "05412", shift.random_number
    assert_equal "300484", shift.date

    shift = Shift.new("05412")

    assert_instance_of Time, shift.date
  end

  def test_that_it_can_create_the_keys_from_not_yet_random_number
    shift = Shift.new("05412", "300484")

    assert_equal [05, 54, 41, 12], shift.keys("05412")
  end

  def test_that_it_can_mmddyy_a_date_object
    shift = Shift.new("05412")

    assert_equal 31118, shift.date_format
  end

  def test_that_it_can_square_and_reverse_date
    shift = Shift.new("05412")
    date_data = 31118

    assert_equal ["4", "2", "9", "9"], shift.offset_number_math(date_data)
  end

  def test_that_it_can_get_last_4_digits_of_date
    shift = Shift.new("05412")

    assert_equal [4,2,9,9], shift.offset_numbers
  end

  def test_that_it_can_add_offset_numbers_with_keys
    shift = Shift.new("05412")

    assert_equal [9, 56, 50, 21], shift.shift_values
  end

end
