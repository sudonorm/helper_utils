#!/bin/bash
ENV_STEM='venv_'
echo "Please enter a name to give your environment. The name should not have spaces"
read ENV_NAME
ENV_NAME="$ENV_STEM$ENV_NAME"
echo "An environment with the name: $ENV_NAME will be created"
pip install virtualenv
python -m virtualenv $ENV_NAME
echo 'Virtual environment created'
cd $ENV_NAME/Scripts
PWD=`pwd`
echo $PWD
sed -i 's/\r$//' activate ## change windows file to unix file
cd ../../
source $PWD/$ENV_NAME/Scripts/activate
echo 'Virtual environment activated'
python -m ensurepip --upgrade
python -m pip install --upgrade pip
ls
pip list
pip install -r requirements.txt --no-cache
echo 'Packages installed'
pip list
code .