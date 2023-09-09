#!/usr/bin/env bash

#
# Setup .zshrc
#
# By Wuelner Martínez. MIT License.
#

# Enable the powerlevel10k instant prompt feature on top for fastest init.
source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# Line added by compinstall to update zstyle.
zstyle ':compinstall' filename "$HOME/.zshrc"

# Aliases to replace the default keybindings of `ls` and `tree` file tools with their similar ones in `exa`.
alias ls='exa --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
alias ll='exa -a -h -l --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
alias tree='exa -T --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'

# Aliases to make Neovim (nvim) THE preferred Vim global editor.
alias n='nvim'; alias vim='nvim'; alias vi="nvim"; alias v='nvim'

# Preferred editor.
export EDITOR='nvim'

# Export $PATH environment variable for bash user.
export PATH="$HOME/bin:$HOME/.npm-global/bin:$PATH"

# Configure the `.histfile` location and the history size.
export HISTFILE="$HOME/.histfile"; export HISTSIZE='1000'

# Export save history.
export SAVEHIST='1000'

# Set default options by zsh-newuser-install.
setopt autocd beep extendedglob nomatch notify

# Keybinds.
bindkey -e

# Zap plugins manager initialization.
source "$HOME/.local/share/zap/zap.zsh"

# Install the powerlevel10k and load the user prompt.
plug 'romkatv/powerlevel10k'; source "$HOME/.p10k.zsh"

# Install zap sudo.
plug 'zap-zsh/sudo'

# Install z plugin.
plug 'agkozak/zsh-z'

# Install the zsh-autopair.
plug 'hlissner/zsh-autopair'

# Install zsh-autosuggestions plugin.
plug 'zsh-users/zsh-autosuggestions'

# Install the z-fast-syntax-highlighting plugin.
plug 'zdharma-continuum/fast-syntax-highlighting'

# Install the z-history-search-multi-word plugin.
plug 'zdharma-continuum/history-search-multi-word'

# Install zsh-history-substring-search plugin.
plug 'zsh-users/zsh-history-substring-search'

# Bind history-substring-search shortcuts.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
