#!/bin/sh

git submodule init
git submodule update

ln --force -s ~/dotfiles/.vim ~/.vim
ln --force -s ~/dotfiles/.gitconfig ~/.gitconfig
ln --force -s ~/dotfiles/.gitignore ~/.gitignore
ln --force -s ~/dotfiles/.vimrc ~/.vimrc
ln --force -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln --force -s ~/dotfiles/.zshrc ~/.zshrc 
