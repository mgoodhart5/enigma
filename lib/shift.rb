require 'pry'

class Shift
  attr_reader :random_number, :date

  def initialize(random_number, date = Time.new)
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

  def date_format
    if @date.class == Time
      format = @date.strftime("%d%m%y")
    end
    format.to_i
  end



  def offset_numbers(date_format)
    data = (date_format * date_format)
    offset_strings = data.to_s.split("").reverse
    offset_numbers = offset_strings[0..3]
    offset_numbers.map do |number|
      number.to_i
    end
  end





end
