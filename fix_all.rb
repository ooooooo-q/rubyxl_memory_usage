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

    @@_variable_keys = {}
    DEFAULT_HASH = {}
    def initialize(params = DEFAULT_HASH)
      @local_namespaces = nil

      obtain_class_variable(:@@ooxml_attributes).each_value { |v|
        unless v[:computed]
          unless @@_variable_keys[v[:accessor]]
            @@_variable_keys[v[:accessor]] = "@#{v[:accessor]}".freeze
          end
          instance_variable_set(@@_variable_keys[v[:accessor]], params[v[:accessor]])
        end
      }

      init_child_nodes(params)
    end

    def init_child_nodes(params)
      obtain_class_variable(:@@ooxml_child_nodes).each_value { |v|

        initial_value =
          if params.has_key?(v[:accessor]) then params[v[:accessor]]
          elsif v[:is_array] then []
          else nil
          end

        unless @@_variable_keys[v[:accessor]]
          @@_variable_keys[v[:accessor]] = "@#{v[:accessor]}".freeze
        end
        instance_variable_set(@@_variable_keys[v[:accessor]], initial_value)
      }
    end

    def ==(other)
      return true if other.is_a?(self.class)
      
      obtain_class_variable(:@@ooxml_attributes).each_value do |v| 
        return false unless self.send(v[:accessor]) == other.send(v[:accessor]) 
      end

      obtain_class_variable(:@@ooxml_child_nodes).each_value do |v| 
        return false unless self.send(v[:accessor]) == other.send(v[:accessor]) 
      end
    end
  end
end

profile('fix_all')
