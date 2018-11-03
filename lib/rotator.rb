require 'pry'

class Rotator
  attr_reader :character_map

  def initialize
    @character_map = ("a".."z").to_a << " "
  end

end
