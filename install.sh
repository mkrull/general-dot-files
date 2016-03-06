#!/bin/bash

DOTFILES=$(pwd)
NAME=$(basename ${0})

for node in $(ls -I ${NAME} -I Makefile ${DOTFILES}); do
    dest="${HOME}/.${node}"
    src="${DOTFILES}/${node}"
    if [ -e "$dest" ]; then
        continue
    fi

    ln -s "$src" "$dest"
done
