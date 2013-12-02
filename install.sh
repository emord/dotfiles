#!/bin/sh

repodir=`pwd`
mkdir olddotfiles
backupdir="./olddotfiles"
files="Xresources gitconfig vimrc zshrc vim zsh tmux.conf"

for file in $files; do
    echo "Backing up $file to $backupdir"
    mv ~/.$file $backupdir
    echo "Creating symlink to $file in home directory"
    ln -s $repodir/$file ~/.$file
done
