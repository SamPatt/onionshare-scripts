#!/bin/bash

# This script starts the OnionShare GUI

cd onionshare

python3 -m venv venv
. venv/bin/activate

./dev_scripts/onionshare-gui
