#!/bin/bash

#
# Setup .bash_profile
#
# By Wuelner Martínez. MIT License.
#

if [ -f $HOME/.bashrc ]
then
	# Get user conf.
	. $HOME/.bashrc
fi
