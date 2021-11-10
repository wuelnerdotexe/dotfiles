# -----------------------------------------------------------------------------
# Name:     SCOOP TOOLS.
# Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
# URL:      https://github.com/wuelnerdotexe/dotfiles
# License:  MIT (C) Wuelner Martínez.
# About:    Powershell script for install tools with scoop in Windows.
# -----------------------------------------------------------------------------

# Install tools.
scoop install adb bitwarden-cli nano neovim-nightly nodejs python ziglang

# Add scoop extras bucket.
scoop bucket add extras

# Install extras apps.
scoop install caffeine

# Add scoop java bucket for openjdk.
scoop bucket add java

# Install openjdk.
scoop install openjdk

# Remove download cache.
scoop cache rm *
