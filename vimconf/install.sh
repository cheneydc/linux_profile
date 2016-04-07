#!/bin/bash

VUNDLE_URL="https://github.com/VundleVim/Vundle.vim.git"
TAGBAR_URL="https://github.com/majutsushi/tagbar.git"
NERDTREE_URL="https://github.com/scrooloose/nerdtree.git"
AIRLINE_URL="https://github.com/bling/vim-airline.git"
FUGITIVE_URL="https://github.com/tpope/vim-fugitive.git"
FONTS_URL="https://github.com/powerline/fonts.git"
YCM_URL="https://github.com/Valloric/YouCompleteMe.git"

AUTOLOAD_DIR="${HOME}/.vim/autoload"
BUNDLE_DIR="${HOME}/.vim/bundle"
VIMRC="${HOME}/.vimrc"

echo "Install vim..."
sudo pacman -S vim
echo 

echo "Install ctags..."
sudo pacman -S ctags
echo

echo "Create vim dir..."
mkdir ${HOME}/.vim
echo 

echo "Install vundle..."
git clone $VUNDLE_URL ${BUNDLE_DIR}/Vundle.vim
echo 

echo "Install tagbar..."
git clone $TAGBAR_URL ${BUNDLE_DIR}/tagbar
echo 

echo "Install nerdtree..."
git clone $NERDTREE_URL ${BUNDLE_DIR}/nerdtree
echo

echo "Install vim-airline..." 
git clone $AIRLINE_URL ${BUNDLE_DIR}/vim-airline
echo

echo "Install vim-fugitive..."
git clone $FUGITIVE_URL ${BUNDLE_DIR}/vim-fugitive
echo

echo "Install YouCompleteMe..."
git clone $YCM_URL ${BUNDLE_DIR}/YouCompleteMe
sudo pacman -S cmake
sudo pacman -S build-essential
sudo pacman -S python-dev
cd ${BUNDLE_DIR}/YouCompleteMe && git submodule update --init --recursive && sudo ./install.py
cd -
echo

echo "Setup vimrc..."
if [ -e $VIMRC ]
then
    mv $VIMRC ${VIMRC}.bak
    echo "Backup old vimrc as ${VIMRC}.bak"
fi
echo "Create vimrc file"
cp ./vimrc $VIMRC
echo

echo "Add tmux configuration..."
cp ./tmux.conf ~/.tmux.conf
echo

echo "Install powerline fonts..."
git clone $FONTS_URL /tmp/fonts 
/tmp/fonts/install.sh
echo "Success deploy vim."


