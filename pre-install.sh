#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "You need root privileges to run this script"
	exit 1
fi

sudo apt-get install exuberant-ctags
sudo apt-get install cscope
