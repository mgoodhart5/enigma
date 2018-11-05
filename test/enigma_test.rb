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
    assert_equal expected, enigma.encrypt(message_1, key, date)
  end

  def test_that_it_can_convert_dates_if_need_be
    enigma = Enigma.new
    enigma = Enigma.new
    key = "02715"
    date = Time.new
    message_1 = "hello world"
    expected = {
         encryption: "keder ohulw",
         key: "02715",
         date: "040895"
       }

    assert_equal "051118", enigma.date_converter
  end

  def test_that_it_can_encrypt_a_message_with_a_key_and_NOT_a_date
    skip
    enigma = Enigma.new
    key = "02715"
    date = Time.new
    message_1 = "hello world"
    expected = {
         encryption: "keder ohulw",
         key: "02715",
         date: "040895"
       }
    assert_equal expected, enigma.encrypt(message_1, key, date)
  end

end
