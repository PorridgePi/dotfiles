#!/bin/bash

if ! command -v zsh &> /dev/null; then
    echo 'Installing zsh'
    sudo apt update
    sudo apt install zsh -y
fi

echo 'zsh is installed'

if [ ! $(awk -F: -v user="$USER" '$1 == user {print $NF}' /etc/passwd) = $(which zsh) ]; then
    echo 'zsh is not default shell'
    echo 'Setting zsh as default shell...'
    sudo chsh -s $(which zsh) $(whoami)
fi

echo 'zsh is default shell'
