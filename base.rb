require './operate.rb'

require 'memory_profiler'

write_report = MemoryProfiler.report do
  write_xlsx
end

write_report.pretty_print(scale_bytes: true, normalize_paths: true,
  retained_strings: 0, to_file: "results/#{ENV['PATTERN']}/write_base.txt")

read_report = MemoryProfiler.report do
  read_xlsx
end

read_report.pretty_print(scale_bytes: true, normalize_paths: true,
  retained_strings: 0, to_file: "results/#{ENV['PATTERN']}/read_base.txt")

