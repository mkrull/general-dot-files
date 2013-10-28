#!/bin/sh

DOTFILES=$(pwd)
NAME=$(basename ${0})

for file in $(ls -I ${NAME} ${DOTFILES}); do
    if [ -f "${HOME}/.${file}" ]; then
        echo "mv ${HOME}/.${file} ${HOME}/dot_${file}.bak"
        mv "${HOME}/.${file}" "${HOME}/dot_${file}.bak"
    fi

    echo "ln -s ${DOTFILES}/${file} ${HOME}/.${file}"
    ln -s "${DOTFILES}/${file}" "${HOME}/.${file}"
done

