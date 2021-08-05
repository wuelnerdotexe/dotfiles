# FILE PS1 FOR INSTALL SCOOP IN WINDOWS WITH POWERSHELL.

# Install scoop:
Set-ExecutionPolicy RemoteSigned -scope AllUsers
iwr -useb get.scoop.sh | iex

# Install scoop dependencies:
scoop install 7zip dark git innounp sudo

# Remove download cache:
scoop cache rm *

# by. @wuelnerdotexe
