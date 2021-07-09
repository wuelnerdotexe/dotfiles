# FILE PS1 FOR INSTALL VIM-PLUG IN WINDOWS WITH POWERSHELL.

# Install vim-plug for Neovim in Windows:
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# by. @wuelnermartinez
