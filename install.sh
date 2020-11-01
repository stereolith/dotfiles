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
$(brew --prefix)/opt/fzf/install

echo "Installing cask..."
CASKS=(
    slack
    spotify
    visual-studio-code
    soundsource
    dash
    1password
)
echo "Installing cask apps..."
brew cask install ${CASKS[@]}

## install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g' | sed 's:chsh -s .*$::g')"

## emacs
# install emacs-plus
brew tap d12frosted/emacs-plus
brew install emacs-plus@28

# install fira coda font
brew tap homebrew/cask-fonts
brew cask install font-fira-code

# install doom
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# copy config
cp -r .doom.d ~/
~/.emacs.d/bin/doom sync

echo "Done"
