# Steps to prepare us to build Python per
# https://devguide.python.org/getting-started/setup-building/index.html
sudo yum install -y git 
sudo yum install -y gcc

pushd ~
git clone --depth 1 https://github.com/reed9999/cpython.git
git remote add upstream https://github.com/python/cpython

# I'm including Python-native tools here just for balance, even though they use more Python than C/C++.
git clone --depth 1 https://github.com/pypa/pip.git 
popd
