require './test/test_helper'
require './lib/rotator'
require './lib/shift'

class RotatorTest < Minitest::Test
  def test_that_it_exists
    rotator = Rotator.new

    assert_instance_of Rotator, rotator
  end

  def test_that_it_it_initialized_with_a_character_map
    rotator = Rotator.new
    expected = ("a".."z").to_a << " "
    assert_equal expected, rotator.character_map
  end

  def test_that_it_can_rotate_a_letter
    rotator = Rotator.new
    shift = Shift.new("05412")
    shift_amounts = shift.shift_values

    assert_equal "j", rotator.encrypt("a", shift_amounts)
  end

  def test_that_it_can_rotate_and_produce_an_encoded_word
    rotator = Rotator.new
    shift = Shift.new("05412")
    shift_amounts = shift.shift_values

    assert_equal "qghfx", rotator.encrypt("hello", shift_amounts)
  end

  def test_that_it_returns_unknown_characters_as_themselves
    rotator = Rotator.new
    shift = Shift.new("05412")
    shift_amounts = shift.shift_values

    assert_equal "j!", rotator.encrypt("a!", shift_amounts)
  end

  def test_that_it_can_take_a_Shift_value_and_use_it
    rotator = Rotator.new
    shift = Shift.new("05412")
    shift_amounts = shift.shift_values
    actual_1 = rotator.encrypt("a", shift_amounts)

    assert_equal "j", actual_1

    actual_2 = rotator.encrypt("hello world", shift_amounts)

    assert_equal "qghfxbsi n ", actual_2
  end

  def test_that_it_can_decrypt_with_shift_value_also
    rotator = Rotator.new
    shift = Shift.new("05412")
    shift_amounts = shift.shift_values
    encoded_message = rotator.encrypt("hello world", shift_amounts)
    actual = "hello world"

    assert_equal actual, rotator.decrypt(encoded_message, shift_amounts)
  end

end
