# -----------------------------------------------------------------------------
# Name:     apps.ps1
# Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
# URL:      https://github.com/wuelnerdotexe/dotfiles
# License:  MIT
# About:    Powershell script for install apps with chocolatey in Windows.
# -----------------------------------------------------------------------------

# Install apps.
choco install brave google-backup-and-sync spotify tunein-radio wamp-server -y

# Install Android Studio.
choco install androidstudio --execution-timeout=0
