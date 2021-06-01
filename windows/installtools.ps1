#FILE PS1 FOR INSTALL TOOLS ON WINDOWS WITH POWERSHELL by. @wuelnermartinez

#Install scoop:
Set-ExecutionPolicy RemoteSigned -scope AllUsers
iwr -useb get.scoop.sh | iex

#Add "extras" and "nerd-fonts" buckets:
scoop bucket add extras nerd-fonts

#Install tools:
scoop install CascadiaCode-NF colortool oh-my-posh neovim winfetch