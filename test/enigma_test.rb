require './test/test_helper'
require './lib/rotator'
require './lib/shift'
require './lib/enigma'
require './lib/generator'
require 'date'

class EnigmaTest < Minitest::Test
  def test_that_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_that_it_can_encrypt_a_message_with_a_key_and_date
    enigma = Enigma.new
    generator = Generator.new
    random_number = generator.randomizer
    shift = Shift.new(random_number, date)
    shift.shift_values
    expected = {
         encryption: "keder ohulw",
         key: "02715",
         date: "040895"
       }

    assert_equal expected, enigma.encrypt(message, key, date)
  end
end
