require 'pry'

class Rotator
  attr_reader :character_map

  def initialize
    @character_map = ("a".."z").to_a << " "
  end

  def rotate_forwards(message, shift_amounts)
    split_message = message.split("")
    encoded_message = split_message.map.with_index do |character, index|
      letter_conversion(character, index, shift_amounts, 1)
    end
    encoded_message.join
  end

  def rotate_backwards(message, shift_amounts)
    split_message = message.split("")
    encoded_message = split_message.map.with_index do |character, index|
      letter_conversion(character, index, shift_amounts, -1)
    end
    encoded_message.join
  end

  def letter_conversion(character, index, shift_amounts, direction)
    if character_index = @character_map.index(character)
      shift_index = index % shift_amounts.length
      rotated_alphabet = @character_map.rotate(direction * shift_amounts[shift_index])
      rotated_alphabet[character_index]
    else
      character
    end
  end

end
