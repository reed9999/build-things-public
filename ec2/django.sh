#https://docs.djangoproject.com/en/4.2/intro/contributing/
# Modified quite a bit for phase 2 (August 2023)
# Note that failure to build pywatchman (see below) was causing the test suite
# to just die prematurely. An interesting research project would be to
# reverse the fix below (comment install of `python3.11-dev`) and see why the
# tests fail.

source ~/scripts/ubuntu/setup-python.sh
echo "Linux distribution: $BVT_DISTRO"
echo "Selected installer: $BVT_INSTALLER"
echo
echo "***** BEGIN DJANGO BUILD SCRIPT $(date) *****"

git clone --depth 1 https://github.com/django/django.git
pushd ~/django
  if [[ "$BVT_DISTRO" == "ubuntu" ]]; then
    # This doesn't appear to be needed for amazon-linux
    sudo ${BVT_INSTALLER} install python3.11-venv

    # Possibly needed to fix KeyError: 'unix_user'
    # https://github.com/pypa/setuptools/issues/2938#issuecomment-1239769624
    # No idea if helpful apart from ubuntu
    sudo ${BVT_INSTALLER} purge -y python3-setuptools
  fi
  rm -rf ~/.virtualenvs/djangodev


  python3.11 -m venv ~/.virtualenvs/djangodev
  source ~/.virtualenvs/djangodev/bin/activate
  python3 -m pip install --editable .
  python3 -m pip install tblib # Without this, the test suite might crash on a failure.
#  python3 -m pip install --editable .   # doubtful we need a second one?

  if [[ "$BVT_DISTRO" == "amazon-linux" ]]; then
    # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/compile-software.html
    # May not be helpful though.
    sudo ${BVT_INSTALLER} groupinstall -y "Development Tools"

    # added python311-devel to the Python setup. However, pywatchman wheel build still can't find
    # Python.h.
    # https://stackoverflow.com/questions/66254702/python-h-no-such-file-or-directory-on-amazon-linux-lambda-container

  elif [[ "$BVT_DISTRO" == "ubuntu" ]]; then
    # This is critical so that pip can build the pywatchman wheel via gcc.
    # Without it, Python.h won't be found.
    # It's now redundantly in setup-python.sh and can be removed from here.
    sudo ${BVT_INSTALLER} install -y python3.11-dev
  fi

  pushd tests
    python -m pip install -r requirements/py3.txt
    echo
    echo "***** BEGIN DJANGO TESTS $(date)"
    ./runtests.py
    echo "***** END DJANGO TESTS $(date)"
    echo
  popd # from tests
  deactivate
popd # from django
