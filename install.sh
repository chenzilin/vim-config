#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "The installation will take some time, please wait patiently until the installation is complete..."
else
	echo "You don't need root privileges to run this script!"
	exit 1
fi

if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-youcompleteme exuberant-ctags cscope
else
	echo "Your computer system is not Ubuntu or Debian, the installation fails!"
	exit 1
fi

mv ~/.vim ~/.vim-old
mv ~/.vimrc ~/.vimrc-old
mkdir -p ~/.vim/autoload ~/.vim/bundle

#: install pathogen
git clone https://github.com/tpope/vim-pathogen.git
cp vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/
rm -rf vim-pathogen

#: install nerdtree
git clone https://github.com/scrooloose/nerdtree.git
cp -rf nerdtree ~/.vim/bundle
rm -rf nerdtree

#: install taglist
cp -rf taglist_46  ~/.vim/bundle
#: ctags usage
#: 1. enter src dir
#: 2. ctags -R
#: 3. vi
#: 4. Ctrl＋]
#: 5. Ctrl＋T

#: install a
cp -rf a_218 ~/.vim/bundle

#: install cscope
cp -rf cscope ~/.vim/bundle
#: cscope usage
#: 1. enter src dir
#: 2. cscope -Rb
#: 3. vi

#: install .vimrc
cp .vimrc ~/
