#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "The uninstallation will take some time, please wait patiently until the uninstallation is complete..."
else
	echo "You don't need root privileges to run this script!"
	exit 1
fi

#: remove config info
if [ -d ~/.vim ]; then
	rm -rf ~/.vim
fi
if [ -f ~/.vimrc ]; then
	rm -rf ~/.vimrc
fi

#: restore config info
if [ -d ~/.vim-old ]; then
	mv ~/.vim-old ~/.vim
fi
if [ -f ~/.vimrc-old ]; then
	mv ~/.vimrc-old ~/.vimrc
fi

echo "The uninstallation is complete!"
