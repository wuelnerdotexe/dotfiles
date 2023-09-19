#!/bin/zsh

#
# Setup .zshenv
#
# By Wuelner Martínez. MIT License.
#

# Path for bash users.
typeset -gU path fpath

# Exports the new directory path for npm.
path=($HOME/.npm-global/{,s}bin(N) $path)

if command -v nvim &> /dev/null
then
  # My default editor.
  export EDITOR='nvim'
else
  export EDITOR='vi'
fi

# My supersu default editor.
export SUDO_EDITOR="$EDITOR"
