$: << "."

require "test/unit"
require "hack"

class TestKore < Test::Unit::TestCase
  def test_choose_method
    inputs = [2, 3]
    requested_return_value = 5
    expected_method = :+
    failure_message = "Can't determine that + will make 2 and 3 give 5"
    kore = Kore.new(inputs, requested_return_value)
    actual_methods = kore.solution_methods
    assert actual_methods.include?(expected_method), failure_message
  end
  
  def test_no_parameters
    inputs = [-2]
    requested_return_value = 2
    expected_method = :abs
    failure_message = "Can't handle a lack of parameters"
    kore = Kore.new(inputs, requested_return_value)
    actual_methods = kore.solution_methods
    assert actual_methods.include?(expected_method), failure_message
  end
  
  def test_two_parameters
    inputs = [Range, 1, 3]
    requested_return_value = Range.new(1,3)
    expected_method = :new
    failure_message = "Can't handle two parameters"
    kore = Kore.new(inputs, requested_return_value)
    actual_methods = kore.solution_methods
    assert actual_methods.include?(expected_method), failure_message
  end
end
