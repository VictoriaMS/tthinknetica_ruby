module Validation 
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :data_validation

    def validate(attr_name, validation_type, additional_params = nil)
      @data_validation ||= []
      @data_validation << [attr_name, validation_type, additional_params]
    end
  end

  module InstanceMethods
    def validate! 
      self.class.data_validation.each do |data|
        attribute = instance_variable_get("@#{data[0]}".to_sym)
        validation_type = data[1]
        additional_params = data[2]
        send(validation_type, attribute, additional_params) 
      end
    end
    
    def valid?
      validate!
      true
    rescue StandardError
      false
    end
     
    def presence(attribute, additional_params)
      raise 'Enter is empty' if attribute.nil? || attribute == ''
    end

    def format(attribute, additional_params)
      raise 'Input does not match format' if attribute !~ additional_params
    end

    def type(attribute, additional_params)
      raise 'Input of the wrong type' if attribute.class != additional_params
    end
  end
end
