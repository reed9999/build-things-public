# Steps to prepare us to build various Python tools
# This is a fairly scattershot selection of items i think would be fun to build
# from source.

# git should already be installed by now as a bootstrap


# AWS installs Python 3.9 by default, and yum also installs 3.9 by default. Django requires >=3.10
sudo yum install -y python311
sudo yum install -y pip
sudo pip install --upgrade build
sudo pip install --upgrade setuptools

pushd ~
git clone https://github.com/pytest-dev/pytest.git
git clone --depth 1 https://github.com/django/django.git
git clone https://github.com/qutebrowser/qutebrowser.git
git clone --depth 1 https://github.com/pytorch/pytorch
popd
