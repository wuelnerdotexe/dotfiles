#!/usr/bin/env bash

#
# Setup .zshrc
#
# By Wuelner Martínez. MIT License.
#

# Enable the powerlevel10k instant prompt feature on top for fast init.
source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# Export $PATH environment variable for bash user.
export PATH="$HOME/bin:$HOME/.npm-global/bin:$PATH"

# Aliases to replace the default keybindings of `ls` and `tree` file tools with their similar ones in `exa`.
alias ls='exa --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
alias ll='exa -a -h -l --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
alias tree='exa -T --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'

# Preferred editor.
export EDITOR='nvim'

# Configure the `.histfile` path and size.
HISTFILE="$HOME/.histfile"; HISTSIZE='1000'

# Export save hist.
export SAVEHIST='1000'

# Set default options by zsh-newuser-install.
setopt autocd beep extendedglob nomatch notify

# Zap plugins manager initialization.
source "$HOME/.local/share/zap/zap.zsh"

# Keybinds.
bindkey -e

# Install the powerlevel10k and load the user prompt.
plug 'romkatv/powerlevel10k'; source "$HOME/.p10k.zsh"

# Install zap sudo.
plug 'zap-zsh/sudo'

# Line added by compinstall to update zstyle.
zstyle ':compinstall' filename "$HOME/.zshrc"

# Optimize autocompletions performance.
zstyle ':autocomplete:*' min-delay 0.04
zstyle ':autocomplete:*' min-input 3

# Consistent autocompletions menu size.
zstyle ':autocomplete:*' list-lines 7
zstyle ':autocomplete:history-search:*' list-lines 7
zstyle ':autocomplete:history-incremental-search-*:*' list-lines 7

# Install the zsh-autocomplete and zsh-autopair plugins together.
plug 'marlonrichert/zsh-autocomplete'; plug 'hlissner/zsh-autopair'

# Install zsh-autosuggestions plugin.
plug 'zsh-users/zsh-autosuggestions'

# Install zsh-syntax-highlighting plugin.
plug 'zsh-users/zsh-syntax-highlighting'
