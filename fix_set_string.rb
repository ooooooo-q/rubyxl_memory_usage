# frozen_string_literal: true

require './profier.rb'

module RubyXL
  require 'rubyXL/objects/ooxml_object'

  module OOXMLObjectInstanceMethods

    @@_variable_keys = {}
    def initialize(params = {})
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
    
  end
end

profile('fix_set_string')