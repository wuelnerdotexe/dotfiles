# -----------------------------------------------------------------------------
# Name:     ginit.vim
# Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
# URL:      https://github.com/wuelnerdotexe/dotfiles
# License:  MIT
# About:    Powershell script for install tools with scoop in Windows.
# -----------------------------------------------------------------------------

# Install tools.
scoop install adb bitwarden-cli cowsay nano neovim nodejs ntop

# Add scoop extras bucket.
scoop bucket add extras

# Install extras apps.
scoop install caffeine winfetch

# Add scoop java bucket for openjdk.
scoop bucket add java

# Install openjdk.
scoop install openjdk

# Remove download cache.
scoop cache rm *
