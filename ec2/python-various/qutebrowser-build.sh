# TODO - should use tox
echo "##### QUTEBROWSER"
pushd ~/qutebrowser
python3 -m venv ~/.virtualenvs/qutebrowserdev
source ~/.virtualenvs/qutebrowserdev/bin/activate
python3 -m pip install setuptools
python3 -m pip install tox
python3 -m pip install --editable .

python3 ./setup.py build
tox
deactivate
popd
