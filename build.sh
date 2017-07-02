#!/bin/sh
CWD=`pwd`

ln -s $CWD/vimrc  ~/.vimrc
ln -s $CWD/vim  ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
