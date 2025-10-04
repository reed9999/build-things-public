# See https://github.com/ruby/ruby/blob/master/doc/contributing/testing_ruby.md

echo "Tests starting $(date)"
pushd ~/ruby/build
make btest OPTS=-v  # miniruby - Pass all 1828 now
make test OPTS=-v  # full ruby
make test-all
make test-spec
echo "Tests ending $(date)"
