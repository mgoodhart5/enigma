require 'pry'

class Shift
  attr_reader :random_number, :date

  def initialize(random_number, date = Date.new)
    @random_number = random_number
    @date = date
  end

  def keys(random_number)
    split_number = random_number.split("")
    keys = []
    index = 0
    split_number.each do |key|
      keys << (key + split_number[index + 1]).to_i
      index += 1
      break if keys.length == 4
    end
    keys
  end


end
