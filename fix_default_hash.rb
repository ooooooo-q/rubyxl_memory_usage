require './operate.rb'

require 'memory_profiler'

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

write_report = MemoryProfiler.report do
  write_xlsx
end

write_report.pretty_print(scale_bytes: true, normalize_paths: true,
  retained_strings: 0, to_file: "results/#{ENV['PATTERN']}/write_fix_deafult_hash.txt")

read_report = MemoryProfiler.report do
  read_xlsx
end

read_report.pretty_print(scale_bytes: true, normalize_paths: true,
  retained_strings: 0, to_file: "results/#{ENV['PATTERN']}/read_fix_default_hash.txt")