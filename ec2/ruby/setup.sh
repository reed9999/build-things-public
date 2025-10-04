# https://www.ruby-lang.org/en/documentation/installation/#building-from-source
# https://github.com/ruby/ruby/blob/master/doc/contributing/building_ruby.md
#
# Some of these may still be unneeded -- be mindful of parsimony
pushd ~
sudo yum install -y gcc
sudo yum install -y libyaml-devel
sudo yum install -y zlib-devel
sudo yum install -y autoconf
sudo yum install -y bison
sudo yum install -y gperf
sudo yum install -y libffi-devel
sudo yum install -y openssl-devel
sudo yum install -y readline-devel
sudo yum install -y ruby	# according to official ruby instructions
sudo yum install -y ruby-devel	# or is it this? or both?

gem install bundler
git clone --depth 1 https://github.com/ruby/ruby.git 
	pushd ruby
	./autogen.sh
	mkdir build
	popd
popd


# Although it seemed like a longshot this actually made everything but psych appear to work.
# However, we don't have rvm installed and it doesn't seem to matter too much.
#
# https://github.com/rvm/rvm/issues/5069
export optflags="-Wno-error=implicit-function-declaration"; \
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"; \
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"; \
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig" | rvm install 2.6.6
