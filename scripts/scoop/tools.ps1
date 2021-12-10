# -----------------------------------------------------------------------------
# Name:     SCOOP TOOLS.
# Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
# URL:      https://github.com/wuelnerdotexe/dotfiles
# License:  MIT (C) Wuelner Martínez.
# About:    Powershell script for install tools with scoop in Windows.
# -----------------------------------------------------------------------------

# Install tools.
scoop install adb bitwarden-cli cowsay neovim-nightly nodejs python starship winfetch

# Add scoop extras bucket.
scoop bucket add extras

# Install extras apps.
scoop install caffeine

# Remove download cache.
scoop cache rm *
