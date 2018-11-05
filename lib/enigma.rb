require 'pry'
require 'date'

class Enigma

  def encrypt(message, key, date)
    shift_amounts = Shift.new(key, date).shift_values
    Rotator.new.rotate_forwards(message, shift_amounts)
  end

end


#
# require 'date'
# #=> true
# require './lib/enigma'
# #=> true
# enigma = Enigma.new
# #=> #<Enigma:0x00007ff90f24cb78...>
# # encrypt a message with a key and date
# enigma.encrypt("hello world", "02715", "040895")
# #=>
# #   {
# #     encryption: "keder ohulw",
# #     key: "02715",
# #     date: "040895"
# #   }
# # decrypt a message with a key and date
# pry(main) > enigma.decrypt("keder ohulw", "02715", "040895")
# #=>
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
