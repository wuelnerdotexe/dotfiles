# FILE PS1 FOR INSTALL TOOLS ON WINDOWS WITH POWERSHELL by. @wuelnermartinez

#---------------------------------------------------------------------------
# Install scoop:
Set-ExecutionPolicy RemoteSigned -scope AllUsers
iwr -useb get.scoop.sh | iex

# Add "extras" and "java" buckets:
scoop bucket add extras
scoop bucket add java
scoop bucket add spotify https://github.com/TheRandomLabs/Scoop-Spotify.git

# Install tools:
scoop install caffeine colortool cowsay dark git innounp windows-terminal neovim nodejs openjdk python sudo winfetch https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json

# Remove download cache:
scoop cache rm *

# --------------------------------------------------------------------------
# Install vim-plug:
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# --------------------------------------------------------------------------
# Install pynvim:
python -m pip install --upgrade pip
python -m pip install --user --upgrade pynvim

# --------------------------------------------------------------------------
# Install npm neovim:
npm install -g neovim

# --------------------------------------------------------------------------
# Config spicetify-cli:
spicetify

# Backup spotify original status:
spicetify backup apply enable-devtool

# Set Nord Theme to Spotify:
spicetify config color_scheme nord-dark

# Apply the changes:
spicetify apply

# Update the changes:
spicetify update