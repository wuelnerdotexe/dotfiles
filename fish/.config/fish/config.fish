#
# Setup config.fish
#
# By Wuelner Martínez. MIT License
#

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Hide init greeting
    set -g fish_greeting

    # Choose and saving one default theme
    fish_config theme choose "Old School"

    if command -q exa
        # Aliases to replace the defaults keybindings for `ls` and `tree` file tools with their similar ones in `exa`
        alias ls="exa --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale"
        alias ll="exa -a -h -l --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale"
        alias tree="exa -T --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale"
    end

    if command -q nvim
        # My default editor
        set -gx EDITOR nvim

        # Aliases to make Neovim (nvim) THE preferred and default editor
        alias n="nvim"; alias v="nvim"; alias vi="nvim"; alias vim="nvim"
    else if command -q vim
        # Else if only THE VI-Mproved (vim) editor exists
        set -gx EDITOR vim; alias vi="vim"; alias v="vim"
    else if command -q vi
        # Else if only VI editor exists
        set -gx EDITOR vi; alias v="vi"
    end
end

if not functions -q fisher
    # Automatic download, source and installation (bootstrapping) of `fisher` plugin manager on a new system, (only if it is not already installed)
    eval (curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher)

    # Installing plugins
    eval (fisher update)
end

# Exports the new directory path for npm
set -gx PATH $HOME/.npm-global/bin $PATH
