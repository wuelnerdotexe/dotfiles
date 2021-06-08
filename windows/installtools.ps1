#FILE PS1 FOR INSTALL TOOLS ON WINDOWS WITH POWERSHELL by. @wuelnermartinez

#Install scoop:
Set-ExecutionPolicy RemoteSigned -scope AllUsers
iwr -useb get.scoop.sh | iex

#Add "extras" and "java" buckets:
scoop bucket add extras
scoop bucket add java

#Install tools:
scoop install colortool cowsay nodejs openjdk winfetch https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json