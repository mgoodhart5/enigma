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
    key = "02715"
    date = "040895"
    message_1 = "hello world"
    expected = {
         encryption: "keder ohulw",
         key: "02715",
         date: "040895"
       }
       # binding.pry
    assert_equal expected, enigma.encrypt(message_1, key, date)
  end
end
