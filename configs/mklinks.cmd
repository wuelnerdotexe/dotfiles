:: ----------------------------------------------------------------------------
:: Name:     mklinks.cmd
:: Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
:: URL:      https://github.com/wuelnerdotexe/dotfiles
:: License:  MIT
:: About:    Bash script for make symbolic links for config files in Windows.
:: ----------------------------------------------------------------------------

:: Symbolic link for Neovim file settings.
mklink /J "%LOCALAPPDATA%\nvim\" "%USERPROFILE%\dotfiles\configs\neovim\"
