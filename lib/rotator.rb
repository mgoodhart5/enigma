require 'pry'

class Rotator
  attr_reader :character_map

  def initialize
    @character_map = ("a".."z").to_a << " "
  end

  def rotate(letter, shift_amount)
    letter_thing = @character_map.index(letter)
    rotated_alphabet = @character_map.rotate(shift_amount)
    rotated_alphabet[letter_thing]
  end

end
