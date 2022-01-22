# ----------------------------------------------------------------------------
# Name:     SYMBOLIC LINKS.
# Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
# URL:      https://github.com/wuelnerdotexe/dotfiles
# License:  MIT (C) Wuelner Martínez.
# About:    PowerShell script for make symlinks for config files in Windows.
# ----------------------------------------------------------------------------

# Symbolic link for PowerShell profile.
New-Item -ItemType SymbolicLink -Path "$Env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Target "$Env:USERPROFILE\dotfiles\configs\powershell\profile.ps1"

# Symbolic link for git config file.
New-Item -ItemType SymbolicLink -Path "$Env:USERPROFILE\.gitconfig" -Target "$Env:USERPROFILE\dotfiles\.gitconfig"

# Symbolic link for Vim folder settings.
New-Item -ItemType SymbolicLink -Path "$Env:USERPROFILE\.vimrc\" -Target "$Env:USERPROFILE\dotfiles\configs\neovim\init.vim"

# Symbolic link for Vim folder settings.
New-Item -ItemType SymbolicLink -Path "$Env:USERPROFILE\vimfiles\coc-settings.json" -Target "$Env:USERPROFILE\dotfiles\configs\neovim\coc-settings.json"

# Symbolic link for Neovim folder settings.
New-Item -ItemType SymbolicLink -Path "$Env:LOCALAPPDATA\nvim\" -Target "$Env:USERPROFILE\dotfiles\configs\neovim\"
