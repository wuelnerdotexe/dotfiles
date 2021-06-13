# FILE PS1 FOR INSTALL SPICETIFY-CLI WITH SCOOP IN POWERSHELL.

# Add scoop bucket for spotify:
scoop bucket add spotify https://github.com/TheRandomLabs/Scoop-Spotify.git

# Install spicetify-cli with scoop:
scoop install spicetify-cli

# Remove download cache:
scoop cache rm spicetify-cli

# ---------------------------------------------------------------------------
# Init spicetify-cli:
spicetify

# Backup spotify original status:
spicetify backup apply enable-devtool

# Set Nord Theme to spotify:
spicetify config color_scheme nord-dark

# Apply the changes:
spicetify apply

# Update the changes:
spicetify update

# by. @wuelnermartinez