require 'pry'
require 'date'
require './lib/generator'
require './lib/shift'
require './lib/rotator'

class Enigma

  def encrypt(message, key = Generator.new.randomizer, date = Time.new)
    answer = {}
    shift_amounts = Shift.new(key, date).shift_values
    answer[:encryption] = Rotator.new.rotate_forwards(message, shift_amounts)
    answer[:key] = key
    answer[:date] = date_converter(date)
    answer
  end

  def date_converter(date)
    if date.class == Time
      date.strftime("%d%m%y")
    else
      date
    end
  end

  def decrypt(message, key, date = Time.new)
    answer = {}
    shift_amounts = Shift.new(key, date).shift_values
    answer[:decryption] = Rotator.new.rotate_backwards(message, shift_amounts)
    answer[:key] = key
    answer[:date] = date_converter(date)
    answer
  end

end
