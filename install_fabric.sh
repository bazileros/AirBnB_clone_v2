#!/usr/bin/env bash

pip3 uninstall -y Fabric
sudo apt-get install -y libffi-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y build-essential
sudo apt-get install -y libpython3-dev
pip3 install -y pyparsing
pip3 install -y appdirs
pip3 install -y setuptools==40.1.0
pip3 install -y cryptography==2.8
pip3 install -y bcrypt==3.1.7
pip3 install -y PyNaCl==1.3.0
pip3 install -y Fabric3==1.14.post1
