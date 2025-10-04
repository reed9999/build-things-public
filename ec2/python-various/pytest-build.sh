## See ../../output/pytest-summary-on-003.txt
# The sudo below here is suspect; could it be that the 2nd time through it has already claimed dirs 
# inappropriately for root?


pushd ~/pytest
python3 -m venv ~/.virtualenvs/pytestdev
source ~/.virtualenvs/pytestdev/bin/activate
python3 -m pip install --editable .

echo "-- next: setup.py build"
python3 ./setup.py build
echo


# Note that pytest clearly says to use tox instead, and the following doesn't run any tests.
# python3 ./setup.py test

echo "Before tox $(date)"

python3 -m pip install tox
tox
echo "After tox $(date)"
echo "-- next: attempt install of our new libraries"
#
# I don't know why I thought this was a good idea.
# python3 -m pip install --upgrade $(pwd)

# This sudo might be problematic.
# sudo python3 ./setup.py install
python3 ./setup.py install

popd

