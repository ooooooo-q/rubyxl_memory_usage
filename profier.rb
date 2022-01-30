# frozen_string_literal: true

require 'memory_profiler'
require 'benchmark'

require './operate.rb'


def profile(file)
  puts "\n### #{file}\n\n"


  with_frozen = ENV['FROZEN'] == 'true' ? '_with_frozen' : ''
  `mkdir -p #{"results/ruby_#{RUBY_VERSION}#{with_frozen}/#{ENV['PATTERN']}"}`


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
      to_file: "results/ruby_#{RUBY_VERSION}#{with_frozen}/#{ENV['PATTERN']}/write_#{file}.txt"
    )

    Benchmark.bm do |x|
      x.report { write_xlsx(ENV['PATTERN']) }
    end

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
      to_file: "results/ruby_#{RUBY_VERSION}#{with_frozen}/#{ENV['PATTERN']}/read_#{file}.txt"
    )

    Benchmark.bm do |x|
      x.report { read_xlsx(ENV['PATTERN']) }
    end
  end
end  



