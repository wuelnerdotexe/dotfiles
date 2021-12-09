# -----------------------------------------------------------------------------
# Name:     POWERSHELL PROFILE.
# Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
# URL:      https://github.com/wuelnerdotexe/dotfiles
# License:  MIT (C) Wuelner Martínez.
# About:    Powershell script for config powershell profile in Windows.
# -----------------------------------------------------------------------------

# Customize powershell predictions.
Set-PSReadLineOption -PredictionViewStyle ListView

# Enable powershell predictions.
Set-PSReadLineOption -PredictionSource History

# Enable terminal icons.
Import-Module -Name Terminal-Icons

# Init starship prompt.
Invoke-Expression (&starship init powershell)
