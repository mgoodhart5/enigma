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
      @date.strftime("%d%m%y").to_i
    elsif
      @date.class == String
      @date.to_i
    end
  end

  def offset_number_math(date_format)
    data = (date_format * date_format)
    data.to_s.split("")[-4..-1]
  end

  def offset_numbers
    offset_number_math(date_format).map do |number|
      number.to_i
    end
  end

  def shift_values
    numbers = offset_numbers.zip(keys(random_number))
    numbers.map do |mini_array|
      mini_array.sum
    end
  end

end
