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

    assert_equal "o", rotator.rotate_forwards("a", shift_amounts)
  end

  def test_that_it_can_rotate_and_produce_an_encoded_word
    rotator = Rotator.new
    shift = Shift.new("05412")
    shift_amounts = shift.shift_values

    assert_equal "vnaab", rotator.rotate_forwards("hello", shift_amounts)
  end

  def test_that_it_returns_unknown_characters_as_themselves
    rotator = Rotator.new
    shift = Shift.new("05412")
    shift_amounts = shift.shift_values
    # character = "a"
    # index = 0
    # shift_amounts = [14, 63, 43, 16]
    # direction = 1
    # letters_converted = shift.letter_conversion(character, index, shift_amounts, direction)
    #
    # assert_equal "something", letters_converted

    assert_equal "o!", rotator.rotate_forwards("a!", shift_amounts)
  end

  def test_that_it_can_take_a_Shift_value_and_use_it
    rotator = Rotator.new
    shift = Shift.new("05412", "040895")
    shift_amounts = shift.shift_values
    actual_1 = rotator.rotate_forwards("a", shift_amounts)

    assert_equal "g", actual_1

    actual_2 = rotator.rotate_forwards("hello world", shift_amounts)

    assert_equal "neabu lexlt", actual_2
  end

  #use a real date and test other dates to ensure correctness and some whatevers

  def test_that_it_can_decrypt_with_shift_value_also
    rotator = Rotator.new
    shift = Shift.new("05412")
    shift_amounts = shift.shift_values
    encoded_message = rotator.rotate_forwards("hello world", shift_amounts)
    actual = "hello world"

    assert_equal actual, rotator.rotate_backwards(encoded_message, shift_amounts)
  end

end
