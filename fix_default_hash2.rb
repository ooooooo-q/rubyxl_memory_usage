require './profier.rb'

module RubyXL
  require 'rubyXL/objects/ooxml_object'

  module OOXMLObjectInstanceMethods

    DEFAULT_HASH = {}
    def initialize(params = DEFAULT_HASH)
      @local_namespaces = nil

      obtain_class_variable(:@@ooxml_attributes).each_value { |v|
        instance_variable_set("@#{v[:accessor]}", params[v[:accessor]]) unless v[:computed]
      }

      init_child_nodes(params)
    end
    
  end
end

profile('fix_default_hash2')