Analyzing RubyXL's memory usage using memory_profiler
===

- [RubyXL](https://github.com/weshatheleopard/rubyXL)
- [memory_profiler](https://github.com/SamSaffron/memory_profiler)

```
./all.sh

rbenv local 3.1.0
bundle install
./all.sh &> results/ruby_3.1.0/result.md

rbenv local 3.0.3
bundle install
./all.sh &> results/ruby_3.0.3/result.md

rbenv local 2.7.5
bundle install
./all.sh &> results/ruby_2.7.5/result.md

rbenv local 2.6.9
gem install bundler:2.3.3
bundle install
./all.sh &> results/ruby_2.6.9/result.md
```