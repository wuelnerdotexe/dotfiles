#!/usr/bin/env bash

#
# Setup .zshrc
#
# By Wuelner Martínez. MIT License.
#

# Enable the powerlevel10k instant prompt feature on top for fast init.
source /home/wuelnerdotexe/.cache/p10k-instant-prompt-wuelnerdotexe.zsh

# Export $PATH environment variable for bash user.
export PATH="$HOME/bin:$HOME/.npm-global/bin:$PATH"

# Preferred editor.
export EDITOR='nvim'

# Configurations for the `.histfile` file path and size.
HISTFILE='/home/wuelnerdotexe/.histfile'; HISTSIZE='1000'

# Export save hist.
export SAVEHIST='1000'

# Set default options by zsh-newuser-install.
setopt autocd beep extendedglob nomatch notify

# Initializes the zap plugin manager before install.
source /home/wuelnerdotexe/.local/share/zap/zap.zsh

# Keybinds.
bindkey -e

# Install the powerlevel10k theme plugins and load the user promt.
plug 'romkatv/powerlevel10k'; source /home/wuelnerdotexe/.p10k.zsh

# Line added on init by zsh compinstall to update zstyle.
zstyle ':compinstall' filename /home/wuelnerdotexe/.zshrc

# Optimize autocompletions performance.
zstyle ':autocomplete:*' min-delay 0.04
zstyle ':autocomplete:*' min-input 3

# Consistent autocompletions menu size.
zstyle ':autocomplete:*' list-lines 7
zstyle ':autocomplete:history-search:*' list-lines 7
zstyle ':autocomplete:history-incremental-search-*:*' list-lines 7

# Install the zsh-autocomplete and zsh-autopair plugins together.
plug 'marlonrichert/zsh-autocomplete'; plug 'hlissner/zsh-autopair'

# Install pack for zsh-users plugins.
plug 'zsh-users/zsh-autosuggestions'
plug 'zsh-users/zsh-syntax-highlighting'

# Install zap sudo.
plug 'zap-zsh/sudo'

# Aliases to replace the default keybindings of `ls` and `tree` file tools with their similar ones in `exa`.
alias ls='exa --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
alias ll='exa -a -h -l --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
alias tree='exa -T --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
