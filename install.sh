#!/bin/bash

cd ~
mkdir -p ~/.vim/autoload ~/.vim/bundle

#: install pathogen
git clone https://github.com/tpope/vim-pathogen.git
cp vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/
rm -rf vim-pathogen

#: install nerdtree
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git

#: install taglist
cp -rf taglist_46  ~/.vim/bundle

#: install a
cp -rf a_218 ~/.vim/bundle

#: install cscope
cp -rf cscope ~/.vim/bundle
#: cscope usage
#: 1. enter src dir
#: 2. cscope -R
#: 3. vi

cp .vimrc ~/
