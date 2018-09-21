#!/bin/bash
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/vundle
cp -r colors $HOME/.vim
cp .vimrc $HOME
sed -i "s/filetype off/filetype on/g" $HOME/.vimrc
