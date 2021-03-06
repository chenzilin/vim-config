#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "The installation will take some time, please wait patiently until the installation is complete..."
else
	echo "You don't need root privileges to run this script!"
	exit 1
fi

#: install base debs
if which apt >/dev/null; then
	sudo apt install -y vim exuberant-ctags cscope
else
	echo "Your computer system is not Ubuntu or Debian, the installation fails!"
	exit 1
fi

#: backup origin data
if [ -d ~/.vim ]; then
	rm -rf ~/.vim-old
	mv ~/.vim ~/.vim-old
fi
if [ -f ~/.vimrc ]; then
	rm -rf ~/.vimrc-old
	mv ~/.vimrc ~/.vimrc-old
fi

#: create new dirs to config vim
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/ctags-list

#: install .vimrc
cp .vimrc ~/

#: install extra debs
if which apt >/dev/null; then
	sudo apt install -y vim-pathogen vim-bitbake vim-syntax-docker vim-youcompleteme
fi

#: install nerdtree
git clone https://github.com/scrooloose/nerdtree.git
mv nerdtree ~/.vim/bundle/

#: install echofunc
git clone https://github.com/mbbill/echofunc.git
cp -rf echofunc/after ~/.vim/bundle/echofunc
rm -rf echofunc

#: install qml syntax highlighting
git clone https://github.com/peterhoeg/vim-qml.git
mv vim-qml ~/.vim/bundle/

#: install nerdcommenter
git clone https://github.com/scrooloose/nerdcommenter.git
mv nerdcommenter ~/.vim/bundle/

#: install taglist
cp -rf taglist_46  ~/.vim/bundle

#: install a
cp -rf a_218 ~/.vim/bundle


cd /usr/include/
ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q  -f ~/.vim/ctags-list/usr-include .

echo "The installation is complete!"
