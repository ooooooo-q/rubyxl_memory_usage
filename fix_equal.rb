# frozen_string_literal: true

require './profier.rb'

module RubyXL
  require 'rubyXL/objects/ooxml_object'

  module OOXMLObjectInstanceMethods

    # todo メモリ使用量が逆に増える場合がある
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

profile('fix_equal')