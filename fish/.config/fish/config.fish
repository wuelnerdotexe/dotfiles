#
# Setup config.fish
#
# By Wuelner Martínez. MIT License.
#

if not test -f $XDG_CONFIG_HOME/fish/functions/fisher.fish
    # Automatic installation (bootstrap) of Fisher plugin manager on a new system only if it is not already installed.
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Remove greeting.
    set -g fish_greeting

    if type -q exa
        # Aliases to replace the default keybindings of `ls` and `tree` file tools with their similar ones in `exa`.
        alias ls='exa --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
        alias ll='exa -a -h -l --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
        alias tree='exa -T --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
    end

    if type -q nvim
        # Aliases to make Neovim (nvim) THE preferred Vim global editor.
        alias n='nvim'; alias v='nvim'; alias vi='nvim'; alias vim='nvim'

        # Preferred editor.
        set -gx EDITOR nvim
    end
end

# Export the new directory path for npm.
set -gx PATH $HOME/.npm-global/bin $PATH
