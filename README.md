# onionshare-scripts

**This is a work in progress.** _These scripts are still being tested. I don't recommend using them on your main machine yet._

A collection of scripts to make the installation of OnionShare on Ubuntu simpler, especially for command-line users who wish to host a website.

This repo is not affiliated with the official OnionShare development team.

# OnionShare

[OnionShare](https://github.com/micahflee/onionshare) is an amazing tool that allows people to send and receive files - and even host websites - over the Tor network.

# Who needs these scripts?

I discovered two issues when using OnionShare myself. The first is that there are dependency problems when installing on Ubuntu. This is a [known issue](https://github.com/micahflee/onionshare/issues/1052), and the [official workaround](https://github.com/micahflee/onionshare/wiki/How-Do-I-Install-Onionshare#problem-installing-due-to-python3-flask-httpauth-package-dependency) requires cloning the git repo, creating a python virtual environment, and installing the requirements via pip. A script makes this process simpler.

The second issue is that OnionShare's excellent website hosting feature requires some changes to settings if you want to host a persistent website, and those changes are primarily intended to be made via the GUI. This means command line users who wish to host a persistent website (VPS users most likely) are forced to modify the onionshare.json file directly. I've created a script which will install OnionShare and make those modifications to settings, and another script to run OnionShare once the installation is completed.

Full descriptions of each script are below. These scripts assume OnionShare is _not_ already installed on your machine

# Installation

Intended for Ubuntu users. 

Open your terminal. Clone this repository:

`git clone https://github.com/SamPatt/onionshare-scripts.git`

Change into the directory:

`cd onionshare-scripts`

Choose which script you need below.

## install_onionshare.sh

This script is for users who want to install OnionShare on their own computer and plan on using the GUI. This doesn't change any of the default OnionShare settings. This installs OnionShare, but does not start it.

In the directory where you cloned this repo, run this command:

`bash install_onionshare.sh`

## run_onionshare_gui.sh

This script is for users who installed via the above script and want to start the OnionShare GUI.

In the directory where you cloned this repo, run this command:

`bash run_onionshare_gui.sh`

## install_onionshare_website.sh

This script is for people who want to run a persistent website using OnionShare via the command line. It installs OnionShare then edits the settings file directly so that a persistent address is used and public mode is selected.

In the directory where you cloned this repo, run this command:

`bash install_onionshare_website.sh`

Please note this script will take a few minutes to run. This installs OnionShare and starts it temporarily to create and then edit the settings files, then shuts OnionShare down. To start it again, use the run_onionshare_website.sh script.

## run_onionshare_website.sh

This script is for users who installed OnionShare via the above script. It runs OnionShare on the command line in the website mode, hosting the index.html file and any other website assests in the onionshare/public_html folder.

In the directory where you cloned this repo, run this command:

`bash run_onionshare_website.sh`
