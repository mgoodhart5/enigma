require './test/test_helper'
require './lib/rotator'

class RotatorTest < Minitest::Test
  def test_that_it_exists
    rotator = Rotator.new

    assert_instance_of Rotator, rotator
  end
end
