Rem BASH SCRIPT FOR MAKE CONFIG FILES SYMBOLIC LINKS IN WINDOWS WITH CMD. 

:: Symbolic link for VSCode settings file.
mklink "%APPDATA%\Code\User\settings.json" "%USERPROFILE%\dotfiles\configs\vscode\settings.json"

:: Symbolic link for Vim file settings.
mklink "%USERPROFILE%\_vimrc" "%USERPROFILE%\dotfiles\configs\vimfiles\_vimrc"
mklink "%USERPROFILE%\vimfiles\coc-settings.json" "%USERPROFILE%\dotfiles\configs\vim\coc-settings.json"

:: Symbolic link for Neovim file settings.
mklink "%LOCALAPPDATA%\nvim\init.vim" "%USERPROFILE%\dotfiles\configs\vimfiles\_vimrc"
mklink "%LOCALAPPDATA%\nvim\coc-settings.json" "%USERPROFILE%\dotfiles\configs\vim\coc-settings.json"

Rem by. @wuelnermartinez
