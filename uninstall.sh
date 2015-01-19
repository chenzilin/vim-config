#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "The uninstallation will take some time, please wait patiently until the uninstallation is complete..."
else
	echo "You don't need root privileges to run this script!"
	exit 1
fi

rm -rf ~/.vim
rm -rf ~/.vimrc
mv ~/.vim-old ~/.vim
mv ~/.vimrc-old ~/.vimrc
