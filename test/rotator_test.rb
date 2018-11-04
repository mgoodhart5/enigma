require './test/test_helper'
require './lib/rotator'

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

    assert_equal "b", rotator.rotate("a", 1)
  end


  def test_that_it_can_rotate_and_produce_an_encoded_word
    rotator = Rotator.new

    assert_equal "ifmmp", rotator.rotate("hello", 1)
  end

  def test_that_it_returns_unknown_characters_as_themselves
    rotator = Rotator.new

    assert_equal "b!", rotator.rotate("a!", 1)
    binding.pry
  end
end
