# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Install prompt theme plugin
plug "romkatv/powerlevel10k"
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# Install zap general plugins
plug "zap-zsh/exa"
plug "zap-zsh/sudo"
plug "zap-zsh/fzf"

# Install zsh completions plugin
plug "zsh-users/zsh-completions"
# Include zsh completions plugin
fpath=($ZAP_PLUGIN_DIR/zsh-completions/src $fpath)
# The following lines were added by compinstall
zstyle :compinstall filename '/home/wuelnerdotexe/.zshrc'
# End of lines added by compinstall
# Install zap completions plugin
plug "zap-zsh/completions"

# Install zsh general plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
# Bind keyboard shorcuts for zsh-history-substring-search
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
# Preferred editor for local and remote sessions
export EDITOR='nvim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
