#!/usr/bin/zsh

#
# Setup .zprofile
#
# By Wuelner Martínez. MIT License.
#

# Path for bash users.
typeset -gU path fpath

# Exports the new directory path for npm.
path=($HOME/.npm-global/{,s}bin(N) $path)

# Declare and export the XDG base directory specification.
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}

if command -v nvim &> /dev/null
then
  # My default editor.
  export EDITOR='nvim'
else
  export EDITOR='vi'
fi

# My supersu default editor.
export SUDO_EDITOR="$EDITOR"
