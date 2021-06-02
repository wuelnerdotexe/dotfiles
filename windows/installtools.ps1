#FILE PS1 FOR INSTALL TOOLS ON WINDOWS WITH POWERSHELL by. @wuelnermartinez

#Install scoop:
Set-ExecutionPolicy RemoteSigned -scope AllUsers
iwr -useb get.scoop.sh | iex

#Add "extras" and "nerd-fonts" buckets:
scoop bucket add extras

#Install tools:
scoop install colortool nodejs winfetch https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json