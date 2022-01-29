require './operate.rb'

require 'memory_profiler'

module RubyXL
  require 'rubyXL/objects/ooxml_object'

  module OOXMLObjectInstanceMethods

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

write_report = MemoryProfiler.report do
  write_xlsx
end

write_report.pretty_print(scale_bytes: true, normalize_paths: true,
  retained_strings: 0, to_file: "results/#{ENV['PATTERN']}/write_fix_equal.txt")

read_report = MemoryProfiler.report do
  read_xlsx
end

read_report.pretty_print(scale_bytes: true, normalize_paths: true,
  retained_strings: 0, to_file: "results/#{ENV['PATTERN']}/read_fix_equal.txt")