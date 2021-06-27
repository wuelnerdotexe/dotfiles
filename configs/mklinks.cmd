Rem BASH SCRIPT FOR MAKE CONFIG FILES SYMBOLIC LINKS IN WINDOWS WITH CMD. 

:: Symbolic link for Powershell $PROFILE file.
mklink "%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" "%USERPROFILE%\dotfiles\configs\powershell\Microsoft.PowerShell_profile.ps1"

:: Symbolic link for VSCode settings file.
mklink "%APPDATA%\Code\User\settings.json" "%USERPROFILE%\dotfiles\configs\vscode\settings.json"

:: Symbolic link for Neovim file settings.
mklink "%USERPROFILE%\_vimrc" "%USERPROFILE%\dotfiles\configs\vimfiles\_vimrc"
mklink "%USERPROFILE%\vimfiles\coc-settings.json" "%USERPROFILE%\dotfiles\configs\vim\coc-settings.json"

Rem by. @wuelnermartinez
