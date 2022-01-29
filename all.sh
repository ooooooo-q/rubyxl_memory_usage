#!/bin/zsh

echo '-- pattern1 --'
export PATTERN='pattern1'

time bundle exec ruby base.rb
time bundle exec ruby fix_default_hash.rb
time bundle exec ruby fix_default_hash2.rb
time bundle exec ruby fix_equal.rb
time bundle exec ruby fix_set_string.rb
time bundle exec ruby fix_all.rb


echo '-- pattern2 --'
export PATTERN='pattern2'

time bundle exec ruby base.rb
time bundle exec ruby fix_default_hash.rb
time bundle exec ruby fix_default_hash2.rb
time bundle exec ruby fix_equal.rb
time bundle exec ruby fix_set_string.rb
time bundle exec ruby fix_all.rb
