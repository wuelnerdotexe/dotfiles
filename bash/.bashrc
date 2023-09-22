#!/bin/bash

#
# Setup .bashrc
#
# By Wuelner Martínez. MIT License.
#

if [ -f /etc/bashrc ]
then
	# Get system.
	. /etc/bashrc
fi

if [ "$(hostname)" = "toolbox" ] && command -v zsh &> /dev/null && [ "$ZSH_VERSION" = "" ]
then
  # SHELL to zsh.
  SHELL=/bin/zsh

  # Run it.
  exec zsh
fi
