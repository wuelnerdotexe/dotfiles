:: ----------------------------------------------------------------------------
:: Name:     SYMBOLIC LINKS.
:: Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
:: URL:      https://github.com/wuelnerdotexe/dotfiles
:: License:  MIT (C) Wuelner Martínez.
:: About:    Bash script for make symbolic links for config files in Windows.
:: ----------------------------------------------------------------------------

:: Symbolic link for Neovim file settings.
mklink /J "%LOCALAPPDATA%\nvim\" "%USERPROFILE%\dotfiles\configs\neovim\"
