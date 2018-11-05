require 'pry'

class Rotator
  attr_reader :character_map

  def initialize
    @character_map = ("a".."z").to_a << " "
  end

  def rotate_forwards(message, shift_amounts)
    split_message = message.split("")
    encoded_message = split_message.map.with_index do |character, index|
      character_index = @character_map.index(character)
      if character_index
        shift_index = index % shift_amounts.length
        rotated_alphabet = @character_map.rotate(shift_amounts[shift_index])
        # binding.pry
        rotated_alphabet[character_index]
      elsif
        character_index == nil
        character
      end
    end
    encoded_message.join
  end

  def rotate_backwards(message, shift_amounts)
    split_message = message.split("")
    encoded_message = split_message.map.with_index do |character, index|
      character_index = @character_map.index(character)
      if character_index
        shift_index = index % shift_amounts.length
        rotated_alphabet = @character_map.rotate(-shift_amounts[shift_index])
        # binding.pry
        rotated_alphabet[character_index]
      elsif
        character_index == nil
        character
      end
    end
    encoded_message.join
  end


end
