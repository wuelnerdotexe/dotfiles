#!/bin/zsh

#
# Setup .zshrc
#
# By Wuelner Martínez. MIT License.
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]
then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]
then
  # Auto download and full installation (bootstrapping) of `zinit` plugin manager on a new system (only if it isn't already installed).
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

# Source and auto loading of `zinit` plugin manager.
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Annexes for `zinit`.
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Install `powerlevel10k` prompt theme, this should be the first plugin to install.
zinit ice atload'[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh' nocd depth=1
zinit light romkatv/powerlevel10k

# Line added by compinstall to update zstyle.
zstyle ':compinstall' filename "$HOME/.zshrc"

# Editor aliases.
alias v="$EDITOR"

if command -v eza &> /dev/null
then
  # Aliases to replace the default keybindings of `ls` and `tree` file tools with their similar ones in `exa`.
  alias ls='eza --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
  alias ll='eza -a -h -l --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
  alias tree='eza -T --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
fi

# Configure the `.histfile` path location and the save/history sizes.
typeset -g HISTSIZE='1000' SAVEHIST='1000' HISTFILE="$HOME/.histfile"

# Set default options by `zsh-newuser-install`.
setopt autocd beep extendedglob nomatch notify

# Keybinds.
bindkey -e

# Remove HSS keys.
bindkey -r '^[[A'
bindkey -r '^[[B'

__bindkeys_for_history_substring_search()
{
  # Define a function for bindkeys for HSS.
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}

# Install plugins on very lazy.
zinit wait lucid light-mode for \
    zap-zsh/sudo \
    agkozak/zsh-z \
  atinit"zstyle :zshzoo:magic-enter command ls -a ." \
    zshzoo/magic-enter \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    hlissner/zsh-autopair \
    zdharma-continuum/fast-syntax-highlighting \
  atload"__bindkeys_for_history_substring_search" \
    zsh-users/zsh-history-substring-search \
  atinit"zstyle :plugin:history-search-multi-word reset-prompt-protect 1" \
    zdharma-continuum/history-search-multi-word

# Finally finalize `powerlevel10k` functions.
(( ! ${+functions[p10k]} )) || p10k finalize
