#!/usr/bin/env bash
set -eux

if [ -n "$(command -v yum)" ]; then
    sudo yum install -y git
elif [ -n "$(command -v apt-get)" ]; then
    sudo apt-get update >/dev/null
    sudo apt-get install -y git
fi

DOTFILE_PATH=$HOME/dotfiles
if [ ! -e $DOTFILE_PATH ]; then
     git clone https://github.com/d9magai/dotfiles.git $DOTFILE_PATH
fi

$DOTFILE_PATH/init.sh

