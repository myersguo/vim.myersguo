#!/bin/sh
CWD=`pwd`

ln -s $CWD/vimrc  ~/.vimrc
ln -s $CWD/vim  ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ~/.vim/bundle
git clone git://github.com/nvie/vim-flake8.git
