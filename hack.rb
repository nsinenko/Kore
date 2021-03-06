class Kore
  attr_reader :solution_methods, :solution_code_string
  
  def initialize(inputs, requested_return_value)
    input1 = inputs[0]
    number_of_arguments = inputs.length - 1
    arguments = inputs[1..-1]
    
    @solution_methods = []
    
    input1.methods.each do |method_name|
      begin
        puts method_name
          if input1.send(method_name, *arguments) == requested_return_value
            @solution_methods << method_name
            @solution_code_string = "#{input1}.#{method_name}(#{arguments.join(',')})"
          end
      rescue
        
      end
    end
    
  end
end

class KoreKonditional
  attr_reader :condtional_type
  
  def initialize(inputs, requested_return_value)
    
  end
end