require 'memory_profiler'

require './operate.rb'


def profile(file)
  puts "\n### #{file}\n\n"

  `mkdir -p #{"results/ruby_#{RUBY_VERSION}/#{ENV['PATTERN']}"}`

  if ENV['OPERATE'] == 'write'
    write_report = MemoryProfiler.report do 
      write_xlsx(ENV['PATTERN'])
    end

    write_report.pretty_print(
      scale_bytes: true, 
      retained_strings: 0,
      allocated_strings: 0,
      detailed_report: false
    )

    write_report.pretty_print(
      scale_bytes: true, 
      normalize_paths: true,
      retained_strings: 0,
      to_file: "results/ruby_#{RUBY_VERSION}/#{ENV['PATTERN']}/write_#{file}.txt"
    )

  elsif ENV['OPERATE'] == 'read'
    read_report = MemoryProfiler.report do
      read_xlsx(ENV['PATTERN'])
    end

    read_report.pretty_print(
      scale_bytes: true, 
      retained_strings: 0,
      allocated_strings: 0,
      detailed_report: false
    )

    read_report.pretty_print(
      scale_bytes: true, 
      normalize_paths: true,
      retained_strings: 0, 
      to_file: "results/ruby_#{RUBY_VERSION}/#{ENV['PATTERN']}/read_#{file}.txt"
    )
  end
end  



