# FILE PS1 FOR INSTALL SCOOP TOOLS ON WINDOWS WITH POWERSHELL.

# Install tools:
scoop install colortool cowsay nodejs ntop https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json

# ---------------------------------------------------------------------------
# Add scoop extras bucket for caffeine and winfetch:
scoop bucket add extras

# Install caffeine:
scoop install caffeine winfetch

# ---------------------------------------------------------------------------
# Add scoop java bucket for openjdk:
scoop bucket add java

# Install openjdk:
scoop install openjdk

# ---------------------------------------------------------------------------
# Remove download cache:
scoop cache rm *

# by. @wuelnermartinez
