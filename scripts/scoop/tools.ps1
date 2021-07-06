# FILE PS1 FOR INSTALL SCOOP TOOLS ON WINDOWS WITH POWERSHELL.

# Install tools:
scoop install cowsay nodejs ntop

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
