# -----------------------------------------------------------------------------
# Name:     INSTALL SCOOP.
# Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
# URL:      https://github.com/wuelnerdotexe/dotfiles
# License:  MIT (C) Wuelner Martínez.
# About:    Powershell script for install scoop in Windows.
# -----------------------------------------------------------------------------

# Install scoop.
Set-ExecutionPolicy RemoteSigned -scope AllUsers
iwr -useb get.scoop.sh | iex

# Install scoop dependencies.
scoop install 7zip dark git innounp sudo

# Remove download cache.
scoop cache rm *
