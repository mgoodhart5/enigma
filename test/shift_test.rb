require './test/test_helper'
require './lib/key'

class ShiftTest < Minitest::Test

  def test_that_it_exists
    shift = Shift.new

     assert_instance_of Shift, shift
  end

end
