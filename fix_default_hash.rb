# frozen_string_literal: true

require './profier.rb'

module RubyXL

  require 'rubyXL/objects/ooxml_object'
  module OOXMLObjectClassMethods

    def obtain_class_variable(var_name, default = nil)
      self.class_variable_get(var_name)
    rescue NameError
      self.class_variable_set(var_name, default || {})
    end
  end
    
  module OOXMLObjectInstanceMethods

    def obtain_class_variable(var_name, default = nil)
      self.class.obtain_class_variable(var_name, default)
    end
  end
end

profile('fix_default_hash')