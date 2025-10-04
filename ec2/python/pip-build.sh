# Try building pip from source. Eventually this should build without *needing* pip, 
# so that we can use our built pip for other builds.
#

# Many tests fail when run directly under pytest:  
# 1495 passed, 59 skipped, 16 xfailed, 14 warnings, 866 errors in 48.81s
# Let's see if more tests pass under nox -> pytest.

pushd ~/pip
python3 -m venv ~/.virtualenvs/pipdev
source ~/.virtualenvs/pipdev/bin/activate
# This is "cheating" to use pip to build pip; I could bootstrap if I want
# the challenge, but for now it's plenty interesting to leave it.
python3 -m pip install --editable .

    pushd tests
    python3 -m pip install -r requirements.txt
    python3 -m pip install -r requirements-common_wheels.txt 
    # Why would nox not be included in the requirements?
    python3 -m pip install nox
    popd
echo 
echo "***** BEGIN PIP TESTS $(date)"

nox -s lint
echo "***** END PIP LINT; BEGIN NOX/PYTEST TESTS $(date)"
nox -s test-3.10 -- -n auto

echo "***** END NOX/PYTEST TESTS; BEGIN DOCS $(date)"
echo
echo "Is doc already here?: $(ls docs/build)"
echo
nox -s docs

echo "***** END PIP TESTS $(date)"
echo
python3 ./setup.py install
popd  # from pip
