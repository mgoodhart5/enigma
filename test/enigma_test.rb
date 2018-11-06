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
    date = Time.new
    expected = date.strftime("%d%m%y")

    assert_equal expected, enigma.date_converter(date)
  end

  def test_that_it_can_encrypt_a_message_with_a_key_and_no_date
    enigma = Enigma.new
    key = "02715"
    message_1 = "hello world"
    actual = enigma.encrypt(message_1, key)
    date = Time.now.strftime("%d%m%y")

    assert_equal 3, actual.keys.length
    assert_equal 3, actual.values.length
    assert_equal :encryption, actual.keys[0]
    assert_equal Symbol, actual.keys[1].class
    assert_equal String, actual.values[2].class
    assert_equal date, actual[:date]
  end

  def test_that_it_can_encrypt_a_message_with_a_date_and_no_key
    enigma = Enigma.new
    date = "300484"
    message_1 = "hello world"
    actual = enigma.encrypt(message_1, date)

    assert_equal 3, actual.keys.length
    assert_equal 3, actual.values.length
    assert_equal :encryption, actual.keys[0]
    assert_equal Symbol, actual.keys[1].class
    assert_equal String, actual.values[2].class
  end

  def test_that_it_can_encrypt_a_message_with_no_key_or_date
    enigma = Enigma.new
    message_1 = "hello world"
    actual = enigma.encrypt(message_1)

    assert_equal 3, actual.keys.length
    assert_equal 3, actual.values.length
    assert_equal :encryption, actual.keys[0]
    assert_equal Symbol, actual.keys[1].class
    assert_equal String, actual.values[2].class
  end

  def test_that_it_can_decrypt_a_message_with_a_key_and_date
    enigma = Enigma.new
    key = "02715"
    date = "040895"
    message_1 = "keder ohulw"
    expected = {
         decryption: "hello world",
         key: "02715",
         date: "040895"
       }

    assert_equal expected, enigma.decrypt(message_1, key, date)
  end

  def test_that_it_can_decrypt_a_message_with_a_key_and_a_date_of_now
    enigma = Enigma.new
    key = "02715"
    date = Time.now.strftime("%d%m%y")
    encrypted = {
         encryption: "snddziogbuw",
         key: "02715",
         date: date
       }
    expected = {
         decryption: "hello world",
         key: "02715",
         date: date
       }

    assert_equal expected, enigma.decrypt(encrypted[:encryption], key, date)
  end

  def test_that_it_can_decrypt_a_message_with_a_key_and_no_date
    enigma = Enigma.new
    key = "02715"
    date = Time.now.strftime("%d%m%y")
    encrypted = {
         encryption: "snddziogbuw",
         key: "02715",
         date: date
       }
    expected = {
         decryption: "hello world",
         key: "02715",
         date: date
       }

    assert_equal expected, enigma.decrypt(encrypted[:encryption], key)
  end

  def test_that_it_can_encrypt_a_message_with_randomly_generated_number_and_todays_date
    enigma = Enigma.new
    date = Time.now.strftime("%d%m%y")
    encrypted = {
         encryption: "hpuzokebrwm",
         key: "45610",
         date: date
       }
    expected_decryption = {
         decryption: "hello world",
         key: "45610",
         date: date
       }

    assert_equal expected_decryption, enigma.decrypt(encrypted[:encryption], "45610")
  end

end
