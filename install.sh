#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "The installation will take some time, please wait patiently until the installation is complete..."
else
	echo "You don't need root privileges to run this script!"
	exit 1
fi

if which apt-get >/dev/null; then
	sudo apt-get install -y vim exuberant-ctags cscope
else
	echo "Your computer system is not Ubuntu or Debian, the installation fails!"
	exit 1
fi

mv ~/.vim ~/.vim-old
mv ~/.vimrc ~/.vimrc-old
mkdir -p ~/.vim/autoload ~/.vim/bundle

#: install .vimrc
cp .vimrc ~/

#: install pathogen
git clone https://github.com/tpope/vim-pathogen.git
cp vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/
rm -rf vim-pathogen

#: install nerdtree
git clone https://github.com/scrooloose/nerdtree.git
mv -rf nerdtree ~/.vim/bundle

#: install echofunc
git clone https://github.com/mbbill/echofunc.git
cp -rf echofunc/after ~/.vim/bundle/echofunc
rm -rf echofunc

#: install omnicppcomplete
git clone https://github.com/FromtonRouge/OmniCppComplete.git
mv OmniCppComplete ~/.vim/bundle/

#: install taglist
cp -rf taglist_46  ~/.vim/bundle

#: install cscope
cp -rf cscope ~/.vim/bundle

#: install a
cp -rf a_218 ~/.vim/bundle

echo "The installation is complete!"
