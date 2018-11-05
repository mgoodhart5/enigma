require './test/test_helper'
require './lib/generator'

class GeneratorTest < Minitest::Test

  def test_that_it_exists
    generator = Generator.new

    assert_instance_of Generator, generator
  end

  def test_that_it_is_initialized_with_numbers
    generator = Generator.new

    assert_equal [0,1,2,3,4,5,6,7,8,9], generator.numbers
  end

  def test_that_it_can_produce_randomly_generated_numbers
    generator = Generator.new

    assert_equal 5, generator.randomizer.length
  end
end
