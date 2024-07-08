#!/bin/bash
dropbear -R
pip install -r /home/${USERNAME}/personal-env/dev-container/requirements.txt --user
sudo apt-get update -qq
sleep infinity
