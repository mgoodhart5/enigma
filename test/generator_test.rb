require './test/test_helper'
require './lib/generator'

class GeneratorTest < Minitest::Test
  def test_that_it_exists
    generator = Generator.new
    
    assert_instance_of generator, Generator
  end
end
