# FILE PS1 FOR INSTALL TOOLS FOR NEOVIM IN WINDOWS WITH POWERSHELL.

# Install neovim with scoop:
scoop install neovim

# --------------------------------------------------------------------------
# Install pynvim with python:
scoop install python

# Upgrade pip:
python -m pip install --upgrade pip

# Install pynvim:
python -m pip install --user --upgrade pynvim

# --------------------------------------------------------------------------
# Install neovim with npm:
scoop install nodejs

# Install npm neovim:
npm install -g neovim

# --------------------------------------------------------------------------
# Install vim-plug:
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# by. @wuelnermartinez