require './test/test_helper'
require './lib/rotator'
require './lib/shift'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_that_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end
end
