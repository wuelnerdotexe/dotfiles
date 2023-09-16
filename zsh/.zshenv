#!/bin/zsh

#
# Setup .zshenv
#
# By Wuelner Martínez. MIT License.
#

# Use `.zprofile` to set env vars for non-login, non-interactive shells.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "$HOME/.zprofile" ]]; then
  source "$HOME/.zprofile"
fi
