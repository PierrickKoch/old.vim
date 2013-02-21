#!/bin/bash

# we suppose you already cloned ~/.vim
git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

[[ -f ~/.vimrc ]] && mv ~/.vimrc ~/.vimrc.bak
echo "source ~/.vim/vimrc" > ~/.vimrc

mkdir -p ~/.vim/spell # install dict
[[ -z "$(ls ~/.vim/spell/)" ]] && wget -q --directory-prefix=$HOME/.vim/spell/ \
    http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl \
    http://ftp.vim.org/vim/runtime/spell/fr.utf-8.sug \
    http://ftp.vim.org/vim/runtime/spell/en.utf-8.spl \
    http://ftp.vim.org/vim/runtime/spell/en.utf-8.sug

mkdir -p ~/.vim_backup
cp -r ~/.vim/.fonts ~ # powerline patched DejaVuSansMono

vim +BundleInstall +qall

