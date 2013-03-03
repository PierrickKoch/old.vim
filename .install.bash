#!/bin/bash

# we suppose you already cloned ~/.vim
[[ ! -e ~/.vim/bundle/vundle ]] && git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

[[ -f ~/.vimrc ]] && mv ~/.vimrc ~/.vimrc.bak
echo "source ~/.vim/vimrc" > ~/.vimrc

mkdir -p ~/.vim/spell # install dict
[[ -z "$(ls ~/.vim/spell/)" ]] && wget -q --directory-prefix=$HOME/.vim/spell/ \
    http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl \
    http://ftp.vim.org/vim/runtime/spell/fr.utf-8.sug \
    http://ftp.vim.org/vim/runtime/spell/en.utf-8.spl \
    http://ftp.vim.org/vim/runtime/spell/en.utf-8.sug

mkdir -p ~/.vim/backup

echo "Patch font for Powerline. You might need to install 'python-fontforge'."
mkdir -p ~/.fonts
cd ~/.fonts
# powerline patch DejaVuSansMono
~/.vim/bundle/vim-powerline/fontpatcher/fontpatcher /usr/share/fonts/truetype/ttf-dejavu/DejaVuSansMono.ttf

vim +BundleInstall +qall

echo "Install Command T"
cd ~/.vim/bundle/Command-T/ruby/command-t/
ruby extconf.rb
make
echo "Done. You might need to install 'vim-nox' for Ruby support"
