#!/bin/bash

# This script runs OnionShare on the command line in the website mode,
# hosting the index.html file and any other website assests in the
# onionshare/public_html folder. If you instead want to use the
# OnionShare GUI, use the run_onionshare_gui.sh script instead

cd onionshare

python3 -m venv venv
. venv/bin/activate

./dev_scripts/onionshare --website ./public_html
