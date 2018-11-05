require 'pry'
require 'date'

class Enigma

  def encrypt(message, key, date)
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

  def decrypt(message, key, date)
    answer = {}
    shift_amounts = Shift.new(key, date).shift_values
    answer[:decryption] = Rotator.new.rotate_backwards(message, shift_amounts)
    answer[:key] = key
    answer[:date] = date_converter(date)
    answer
  end



end



# enigma.decrypt("keder ohulw", "02715", "040895")
# #   {
# #     decryption: "hello world",
# #     key: "02715",
# #     date: "040895"
# #   }
# # encrypt a message with a key (uses today's date)
# encrypted = enigma.encrypt("hello world", "02715")
# #=> # encryption hash here
# #decrypt a message with a key (uses today's date)
# pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
# #=> # decryption hash here
# # encrypt a message (generates random key and uses today's date)
# enigma.encrypt("hello world")
# #=> # encryption hash here
