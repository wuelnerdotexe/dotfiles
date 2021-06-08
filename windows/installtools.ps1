# FILE PS1 FOR INSTALL TOOLS ON WINDOWS WITH POWERSHELL by. @wuelnermartinez

#---------------------------------------------------------------------------
# Install scoop:
Set-ExecutionPolicy RemoteSigned -scope AllUsers
iwr -useb get.scoop.sh | iex

# Add "extras" and "java" buckets:
scoop bucket add extras
scoop bucket add java

# Install tools:
scoop install colortool cowsay nodejs openjdk winfetch https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json

# --------------------------------------------------------------------------
# Install vim-plug:
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# --------------------------------------------------------------------------
# Install pynvim:
C:\Python39\python.exe -m pip install --upgrade pip
python -m pip install --user --upgrade pynvim

# --------------------------------------------------------------------------
# Install npm neovim:
npm install -g neovim

# --------------------------------------------------------------------------
# Install spicetify-cli:
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression

# Init spicetify-cli:
spicetify

# Backup spotify original status:
spicetify backup apply enable-devtool

# Set Nord Theme to Spotify:
spicetify config color_scheme nord-dark

# Apply the changes:
spicetify apply

# Update the changes:
spicetify update