#!/bin/bash

# This directory path
DOTFILES=$(pwd)
# This script name
NAME=$(basename ${0})

# Collect all dotfiles ignoring hidden files and directories, the Makefile,
# and this script
FILES=$(find . \
    ! -name ${NAME} \
    ! -name Makefile \
    ! -path '*/\.*' \
    -type f \( ! -iname ".*" \) \
    -printf '%P\n')

for node in ${FILES}; do
    dest="${HOME}/.${node}"
    src="${DOTFILES}/${node}"
    if [ -e "$dest" ]; then
        continue
    fi

    # Create destination directory path if it does not exist
    DIRNAME=$(dirname "${dest}")
    [ -d ${DIRNAME} ] || mkdir -p ${DIRNAME}

    ln -s "$src" "$dest"
done
