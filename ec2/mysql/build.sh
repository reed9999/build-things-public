pushd ~
cd build-mysql-server

echo "pwd $(pwd)"
echo "*****
* cmake 
*****
"
echo
cmake ~/mysql-server  -DDOWNLOAD_BOOST=1 -DWITH_BOOST=~/boost -DWITH_SSL=system

# The rest of this is junk

echo "*****
* configure
*****

"
./configure 

echo "*****
* make 
*****

"
make

echo "*****
* make test
*****

"
make test
popd
