require 'pry'

class Rotator
  attr_reader :character_map

  def initialize
    @character_map = ("a".."z").to_a << " "
  end

  def rotate(message, shift_amounts)
    binding.pry
    #i need to figure out how to pass in the shift amount
    split_message = message.split("")
    split_message.map do |character|
      character_index = @character_map.index(character)
      rotated_alphabet = @character_map.rotate(shift_amounts)
      if character_index
        rotated_alphabet[character_index]
      elsif
        character_index == nil
        character
      end
    end.join
  end

end
