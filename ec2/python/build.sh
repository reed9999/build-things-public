# Steps to build Python per
# https://devguide.python.org/getting-started/setup-building/index.html
pushd ~/cpython
make clean
sudo yum install -y build-essential   # I think this was another way of getting gcc
./configure --with-pydebug

make -s -j2

make test | tee ~/python-test-output.txt