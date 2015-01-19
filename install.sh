#!/bin/bash

cd ~
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

cp .vimrc ~/
