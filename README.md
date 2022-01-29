# rubyxl_memory_usage


```
❯ ./all.sh
-- pattern1 --
bundle exec ruby base.rb  2.71s user 0.23s system 97% cpu 3.016 total
bundle exec ruby fix_default_hash.rb  2.44s user 0.18s system 98% cpu 2.652 total
bundle exec ruby fix_default_hash2.rb  2.59s user 0.20s system 99% cpu 2.815 total
bundle exec ruby fix_equal.rb  2.72s user 0.21s system 99% cpu 2.948 total
bundle exec ruby fix_set_string.rb  2.28s user 0.17s system 99% cpu 2.472 total
bundle exec ruby fix_all.rb  1.94s user 0.15s system 99% cpu 2.103 total
-- pattern2 --
bundle exec ruby base.rb  2.74s user 0.21s system 99% cpu 2.979 total
bundle exec ruby fix_default_hash.rb  2.46s user 0.19s system 99% cpu 2.662 total
bundle exec ruby fix_default_hash2.rb  2.65s user 0.20s system 99% cpu 2.873 total
bundle exec ruby fix_equal.rb  2.74s user 0.21s system 99% cpu 2.966 total
bundle exec ruby fix_set_string.rb  2.33s user 0.17s system 99% cpu 2.515 total
bundle exec ruby fix_all.rb  1.96s user 0.15s system 98% cpu 2.128 total
```