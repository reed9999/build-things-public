# https://dev.mysql.com/doc/refman/8.0/en/installing-development-tree.html
# https://dev.mysql.com/doc/refman/8.0/en/source-installation-prerequisites.html
sudo yum install -y cmake
sudo yum install -y gcc
sudo yum install -y boost
sudo yum install -y ncurses  # not sure if we need this or only the development one
sudo yum install -y ncurses-devel
sudo yum install -y perl   # to run tests
sudo yum install -y bison   # to run tests

sudo yum install -y openssl-devel
sudo yum install -y libtirpc-devel
sudo yum install -y rpcgen


pushd ~
git clone --depth 1 https://github.com/mysql/mysql-server.git
mkdir build-mysql-server
popd
