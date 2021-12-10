# -----------------------------------------------------------------------------
# Name:     INSTALL POWERSHELL MODULES.
# Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
# URL:      https://github.com/wuelnerdotexe/dotfiles
# License:  MIT (C) Wuelner Martínez.
# About:    Powershell script for install powershell modules in Windows.
# -----------------------------------------------------------------------------

# Install PowerShellGet pre-release.
Install-Module -Name PowerShellGet -AllowPrerelease -Force

# Install PSReadLine pre-release.
Install-Module -Name PSReadLine -AllowPrerelease -Force

# Install Terminal-Icons.
Install-Module -Name Terminal-Icons
