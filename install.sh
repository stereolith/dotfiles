#!/usr/bin/env bash

## script for setting up new macOS machine

## homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

echo "Installing brew packages"
PACKAGES=(
    fzf
    fd
    wget
    node
    yarn
    jq
)
brew install ${PACKAGES[@]}

## install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## emacs
# install emacs-plus
brew tap d12frosted/emacs-plus
brew install emacs-plus@28 --HEAD

# move doom config
cp .doom.d ~/
~/.emacs.d/bin/doom sync

echo "Done"
