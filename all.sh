#!/bin/zsh

echo '# File pattern1'
export PATTERN='pattern1'

echo '\n## Write xlsx'
export OPERATE='write'
bundle exec ruby base.rb
bundle exec ruby fix_all.rb
bundle exec ruby fix_default_hash.rb
bundle exec ruby fix_default_hash2.rb
bundle exec ruby fix_equal.rb
bundle exec ruby fix_set_string.rb

echo '\n## Read xlsx'
export OPERATE='read'
bundle exec ruby base.rb
bundle exec ruby fix_all.rb
bundle exec ruby fix_default_hash.rb
bundle exec ruby fix_default_hash2.rb
bundle exec ruby fix_equal.rb
bundle exec ruby fix_set_string.rb


echo '\n\n# File pattern2'
export PATTERN='pattern2'

echo '\n## Write xlsx'
export OPERATE='write'
bundle exec ruby base.rb
bundle exec ruby fix_all.rb
bundle exec ruby fix_default_hash.rb
bundle exec ruby fix_default_hash2.rb
bundle exec ruby fix_equal.rb
bundle exec ruby fix_set_string.rb

echo '\n## Read xlsx'
export OPERATE='read'
bundle exec ruby base.rb
bundle exec ruby fix_all.rb
bundle exec ruby fix_default_hash.rb
bundle exec ruby fix_default_hash2.rb
bundle exec ruby fix_equal.rb
bundle exec ruby fix_set_string.rb
