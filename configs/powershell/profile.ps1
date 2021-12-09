# -----------------------------------------------------------------------------
# Name:     POWERSHELL PROFILE.
# Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
# URL:      https://github.com/wuelnerdotexe/dotfiles
# License:  MIT (C) Wuelner Martínez.
# About:    Powershell script for config powershell profile in Windows.
# -----------------------------------------------------------------------------

# Enable powershell predictions.
Set-PSReadLineOption -PredictionSource History

# Customize powershell predictions.
Set-PSReadLineOption -PredictionViewStyle ListView

# Init starship prompt.
Invoke-Expression (&starship init powershell)
