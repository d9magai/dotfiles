#!/usr/bin/env bash
set -eux
cd $(dirname $0)

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -snf $(pwd)/$f $HOME/$f
done

ln -snf $(pwd)/bin $HOME/bin

touch $HOME/.zshrc_local

