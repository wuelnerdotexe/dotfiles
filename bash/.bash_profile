#!/bin/bash

#
# Setup .profile
#
# By Wuelner Martínez. MIT License.
#

if [ $(hostname) = "toolbox" ] && command -v zsh &> /dev/null
then
  # Set SHELL to zsh.
  SHELL=$(which zsh)

  # Run it.
  exec zsh
fi
