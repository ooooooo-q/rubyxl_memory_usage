require './operate.rb'

require 'memory_profiler'

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

write_report = MemoryProfiler.report do
  write_xlsx
end

write_report.pretty_print(scale_bytes: true, normalize_paths: true,
  retained_strings: 0, to_file: "results/#{ENV['PATTERN']}/write_fix_deafult_hash2.txt")

read_report = MemoryProfiler.report do
  read_xlsx
end

read_report.pretty_print(scale_bytes: true, normalize_paths: true,
  retained_strings: 0, to_file: "results/#{ENV['PATTERN']}/read_fix_default_hash2.txt")