#!/usr/bin/env bash

#
# Setup .zshrc
#
# By Wuelner Martínez. MIT License.
#

# Enable the powerlevel10k instant prompt feature on top for fast init.
source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# Line added by compinstall to update zstyle.
zstyle ':compinstall' filename "$HOME/.zshrc"

# Export $PATH environment variable for bash user.
export PATH="$HOME/bin:$HOME/.npm-global/bin:$PATH"

# Aliases to replace the default keybindings of `ls` and `tree` file tools with their similar ones in `exa`.
alias ls='exa --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
alias ll='exa -a -h -l --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
alias tree='exa -T --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'

# Preferred editor.
export EDITOR='nvim'

# Configure the `.histfile` location and the history size.
export HISTFILE="$HOME/.histfile"; export HISTSIZE='1000'

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

# Install the zsh autopair.
plug 'hlissner/zsh-autopair'

# Install the zsh autocomplete plugin.
plug 'marlonrichert/zsh-autocomplete'

# Optimize autocompletions performance.
zstyle ':autocomplete:*' min-delay 0.042
zstyle ':autocomplete:*' min-input 3

# Consistent autocompletions menu size.
zstyle ':autocomplete:*' list-lines 7

# Configure autocomplete for accept unambiguous.
zstyle ':autocomplete:*' insert-unambiguous yes

# Install zsh-autosuggestions plugin.
plug 'zsh-users/zsh-autosuggestions'

# Configure highlighters for add rainbow brackets.
export ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )

# Install zsh-syntax-highlighting plugin.
plug 'zsh-users/zsh-syntax-highlighting'
