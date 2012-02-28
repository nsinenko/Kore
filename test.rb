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

  def test_produce_code_string
    inputs = [Range, 1, 3]
    requested_return_value = Range.new(1,3)
    failure_message = "Can't produce code string"
    kore = Kore.new(inputs, requested_return_value)
    code_string = kore.solution_code_string
    code_return_value = eval(code_string)
    assert_equal requested_return_value, code_return_value, failure_message
  end
  
  def test_if_versus_unless
    inputs = [true, "foo", "bar"]
    requested_return_value = "foo"
    expected_conditional = :if
    failure_message = "Can't determine whether you should use if or unless"
    kore_konditional = KoreKonditional.new(inputs, requested_return_value)
    actual_condtional_type = kore_konditional.condtional_type
    assert_equal expected_conditional, actual_conditional_type, failure_message
  end
end
