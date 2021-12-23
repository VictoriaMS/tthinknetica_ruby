module Accessors 
  def attr_accessor_with_history(*attributes)
    attributes.each do |attribute|

      sym_attribute = "@#{attribute}".to_sym
      sym_history = "@#{attribute}_history".to_sym

      define_method(attribute) { instance_variable_get(sym_attribute)}

      define_method("#{attribute}=".to_sym) do |value|
        instance_variable_set(sym_attribute, value) 
        instance_variable_set(sym_history, []) if instance_variable_get(sym_history).nil?
        instance_variable_get(sym_history) << value
      end

      define_method("#{attribute}_history") { instance_variable_get(sym_history) }
    end
  end

  def strong_attr_accessor (attribute, attribute_class)
    sym_attribute = "@#{attribute}".to_sym

    define_method(attribute) { instance_variable_get(sym_attribute) }

    define_method("#{attribute}=") do |name|
      raise 'Wrong format' if name.class != attribute_class 
      instance_variable_set(sym_attribute, name) if name.is_a?(attribute_class) 
    end 
  end 
end
