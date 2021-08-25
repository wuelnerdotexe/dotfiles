:: ----------------------------------------------------------------------------
:: Name:     mklinks.cmd
:: Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
:: URL:      https://github.com/wuelnerdotexe/dotfiles
:: License:  MIT
:: About:    Bash script for make symbolic links for config files in Windows.
:: ----------------------------------------------------------------------------

:: Symbolic link for VSCode settings file.
mklink "%APPDATA%\Code\User\settings.json" "%USERPROFILE%\dotfiles\configs\vscode\settings.json"

:: Create dir for Neovim settings.
mkdir "%LOCALAPPDATA%\nvim\"

:: Symbolic link for Neovim file settings.
mklink "%LOCALAPPDATA%\nvim\init.vim" "%USERPROFILE%\dotfiles\configs\vim\init.vim"
mklink "%LOCALAPPDATA%\nvim\ginit.vim" "%USERPROFILE%\dotfiles\configs\vim\ginit.vim"
