# FILE PS1 FOR INSTALL APPS ON WINDOWS WITH POWERSHELL by. @wuelnermartinez

# Install chocolatey:
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install apps:
choco install androidstudio firefox-dev --pre git google-backup-and-sync googlechrome microsoft-windows-terminal --pre neovim --pre python spotify tunein-radio vscode wamp-server -y