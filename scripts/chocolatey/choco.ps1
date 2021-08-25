# -----------------------------------------------------------------------------
# Name:     choco.ps1
# Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
# URL:      https://github.com/wuelnerdotexe/dotfiles
# License:  MIT
# About:    Powershell script for install chocolatey in Windows.
# -----------------------------------------------------------------------------

# Install chocolatey.
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
