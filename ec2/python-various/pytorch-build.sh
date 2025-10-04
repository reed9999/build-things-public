# Pytorch is better treated as its own thing. 
# It requires Anaconda, so use an Anaconda ec2 instance to build.
echo "##### PYTORCH"
pushd ~/pytorch
python3 -m venv ~/.virtualenvs/pytorchdev
source ~/.virtualenvs/pytorchdev/bin/activate
python3 -m pip install setuptools
python3 -m pip install --editable .

python3 ./setup.py build
python3 ./setup.py test
popd

## This failed with `error: metadata-generation-failed` 
