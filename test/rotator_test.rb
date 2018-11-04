require './test/test_helper'
require './lib/rotator'
require './lib/shift'

class RotatorTest < Minitest::Test
  def test_that_it_exists
    skip
    rotator = Rotator.new

    assert_instance_of Rotator, rotator
  end

  def test_that_it_it_initialized_with_a_character_map
    skip
    rotator = Rotator.new
    expected = ("a".."z").to_a << " "
    assert_equal expected, rotator.character_map
  end

  def test_that_it_can_rotate_a_letter
    skip
    rotator = Rotator.new

    assert_equal "b", rotator.rotate("a", 1)
  end

  def test_that_it_can_rotate_and_produce_an_encoded_word
    skip
    rotator = Rotator.new

    assert_equal "ifmmp", rotator.rotate("hello", 1)
  end

  def test_that_it_returns_unknown_characters_as_themselves
    skip
    rotator = Rotator.new

    assert_equal "b!", rotator.rotate("a!", 1)
  end

  def test_that_it_can_take_Shift_values
    rotator = Rotator.new
    shift = Shift.new("05412")
    shift_amounts = shift.shift_values
    actual = rotator.rotate("a", shift_amounts)

    assert_equal "something", actual
  end

end
