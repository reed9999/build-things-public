# INCOMPLETE - haven't gotten far really
# See https://bazel.build/install/compile-source#build-bazel-using-bazel
# For now, accept that we will install it to build itself. 
# Later on we can think about bootstrapping.

pushd ~/bazel/

# There are also some other approaches (incomplete) to getting JDK and bazel that I will document in the README
curl --location --request GET  https://github.com/bazelbuild/bazel/releases/download/7.0.0-pre.20230330.3/bazel_nojdk-7.0.0-pre.20230330.3-linux-x86_64 -O
mv bazel_nojdk* ~
sudo rm /usr/bin/bazel
sudo ln -s ~/bazel_nojdk* /usr/bin/bazel
sudo chmod +x /usr/bin/bazel


# Given the nojdk in the above name, the following might not be needed.
sudo yum install -y java-11-amazon-corretto-devel


# Approach 2


# Prereqs - https://bazel.build/install/compile-source#bootstrap-unix-prereq
sudo yum install -y python 
sudo yum install -y zip 
sudo yum install -y unzip
sudo yum install -y gcc gcc-c++ kernel-devel make


date > ~/017-bazel-build-output.txt 
nohup bazel build //src:bazel-dev >> ~/017-bazel-build-output.txt &
date >> ~/017-bazel-build-output.txt &

# We can also run the tab completion. On an xlarge it adds about 10 more minutes.
 # bazel build //scripts:bazel-complete.bash


popd

