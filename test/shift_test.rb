require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def test_that_it_exists
    shift = Shift.new("02715")

    assert_instance_of Shift, shift
  end

  def test_that_it_takes_a_key_and_a_date_or_has_a_default_Date
    shift = Shift.new("02715", "040895")

    assert_equal "02715", shift.random_number
    assert_equal "040895", shift.date

    shift = Shift.new("02715")

    assert_instance_of Time, shift.date
  end

  def test_that_it_can_create_the_keys_from_not_yet_random_number
    shift = Shift.new("02715", "040895")

    assert_equal [2, 27, 71, 15], shift.keys("02715")
  end

  def test_that_it_can_mmddyy_a_date_object_or_to_i_a_date_string
    shift = Shift.new("02715")

    assert_equal Integer, shift.date_format.class

    shift = Shift.new("02715", "040895")

    assert_equal 40895, shift.date_format
  end

  def test_that_it_can_square_and_reverse_date
    shift = Shift.new("02715")
    date_data = 40895

    assert_equal ["1", "0", "2", "5"], shift.offset_number_math(date_data)
  end

  def test_that_it_can_get_last_4_digits_of_date
    shift = Shift.new("02715", "040895")

    assert_equal [1,0,2,5], shift.offset_numbers
  end

  def test_that_it_can_add_offset_numbers_with_keys
    shift = Shift.new("02715", "040895")

    assert_equal [3, 27, 73, 20], shift.shift_values
  end

end
