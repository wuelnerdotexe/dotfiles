# Enable the p10k instant prompt. Should stay close to the top of $HOME/.zshrc.
source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-wuelnerdotexe.zsh"

# Export environment variables $PATH and $EDITOR.
export PATH=$HOME/bin:$PATH; export EDITOR='nvim'

# Configurations for the zsh $HOME/.histfile and sizes.
HISTFILE=$HOME/.histfile; HISTSIZE=1000; SAVEHIST=1000

# Set default options by zsh-newuser-install.
setopt autocd beep extendedglob nomatch notify

# Initializes the zap plugin manager.
source "$HOME/.local/share/zap/zap.zsh"

# Keybinds.
bindkey -e

# Install the p10k plugin and loading the user promt.
plug "romkatv/powerlevel10k"; source "$HOME/.p10k.zsh"

# Line added by compinstall for caching the compinit sys.
zstyle :compinstall filename '/home/wuelnerdotexe/.zshrc'

# Optimize autocompletions performance.
zstyle ':autocomplete:*' min-delay 0.04
zstyle ':autocomplete:*' min-input 3

# Consistent autocompletions menu size.
zstyle ':autocomplete:*' list-lines 7
zstyle ':autocomplete:history-search:*' list-lines 7
zstyle ':autocomplete:history-incremental-search-*:*' list-lines 7

# Install the zsh-autocomplete and zsh-autopair plugins together.
plug "marlonrichert/zsh-autocomplete"; plug "hlissner/zsh-autopair"

# Install pack for zsh-users plugins.
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# Install zap sudo.
plug "zap-zsh/sudo"

# Aliases to replace the default keybindings of `ls` and `tree` file tools with their similar ones in `exa`.
alias ls='exa --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
alias ll='exa -a -h -l --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
alias tree='exa -T --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale'
