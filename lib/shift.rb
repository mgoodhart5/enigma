require 'pry'

class Shift
  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
  end

end
