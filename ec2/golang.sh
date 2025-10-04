#!/usr/bin/sh
# GO LANGUAGE
# Script partially from Bing AI

BVT_INSTALLER=yum
sudo ${BVT_INSTALLER} update -y
sudo ${BVT_INSTALLER} install -y git gcc
# Go requires itself to build now
sudo ${BVT_INSTALLER} install -y golang

pushd ~ || exit 255
git clone https://go.googlesource.com/go
cd go/src
./all.bash
popd
