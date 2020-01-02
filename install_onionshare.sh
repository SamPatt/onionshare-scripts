#!/bin/bash

# This script is for people who want to install OnionShare, but not modify
# the default settings. If you want to run a persistent website using
# OnionShare, you should run the install_onionshare_website.sh script

echo "Installing Python Virtual Environment, Git, and Tor"
sudo apt install python3-venv git tor

echo "Cloning OnionShare"
git clone https://github.com/micahflee/onionshare.git

cd onionshare

# Creates a python virtual environment to help prevent dependency or versioning issues
python3 -m venv venv
. venv/bin/activate

echo "Installing requirements"
pip3 install -r install/requirements.txt

clear
echo
echo "To start OnionShare, run the run_onionshare_gui.sh script."
