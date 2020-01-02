#!/bin/bash

# This script is for people who want to run a persistent website using OnionShare
# via the command line. It installs OnionShare then edits the settings file directly
# so that a persistent address is used and public mode is selected. This is necessary
# for command line users since those options currently can only be selected in the GUI

echo "Installing Python Virtual Environment, Git, and Tor"
sudo apt install python3-venv git tor

echo "Cloning OnionShare"
git clone https://github.com/micahflee/onionshare.git

cd onionshare
mkdir public_html

# Creates a python virtual environment to help prevent dependency or versioning issues
python3 -m venv venv
. venv/bin/activate

echo "Installing requirements"
pip3 install -r install/requirements.txt

# Starts OnionShare in order to create config file, then stops
./dev_scripts/onionshare --auto-stop-timer 1 README.md
cd ..

# Changes the onionshare settings file to keep the same private key so the address persists
# and to put it in public mode so that no password is required from visitors
sed -i 's/"save_private_key": false,/"save_private_key": true,/g' .config/onionshare/onionshare.json
sed -i 's/"public_mode": false,/"public_mode": true,/g' .config/onionshare/onionshare.json

BOLD=$(tput bold)
RESET=$(tput sgr0)
clear
echo
echo -e "Place your ${BOLD}index.html${RESET} file and any other website assets in the ${BOLD}onionshare/public_html${RESET} folder."
echo
echo -e "Once your files are ready, start the ${BOLD}run_onionshare_website.sh${RESET} script to launch your site."
