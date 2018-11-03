require 'pry'

class Shift
  attr_reader :random_number, :date

  def initialize(random_number, date = Date.new)
    @random_number = random_number
    @date = date
  end


end
