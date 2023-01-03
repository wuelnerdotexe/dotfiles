#       ____      ____
#      / __/___  / __/
#     / /_/_  / / /_
#    / __/ / /_/ __/
# . /_/   /___/_/ .zsh
#
# - $FZF_DEFAULT_COMMAND
# - $FZF_CTRL_P_COMMAND
# - $FZF_CTRL_F_COMMAND

if command -v fd &> /dev/null
then
  export FZF_DEFAULT_COMMAND="fd -I -H -E '{.git,.svn,.hg,CSV,.DS_Store,Thumbs.db,node_modules,bower_components,*.code-search}' -t f"
fi

# Key bindings
# ------------

'emulate' 'zsh' '-o' 'no_aliases'

{

[[ -o interactive ]] || return 0

# CTRL-P - find and open selected file with $EDITOR
fzf-fe-widget() {
  IFS=$'\n' files=($(fzf-tmux --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}
zle     -N            fzf-fe-widget
bindkey '^P' fzf-fe-widget

# CTRL-F - find word and open selected with $EDITOR
fzf-ff-widget() {
  RG_DEFAULT_COMMAND="rg -i -l --hidden --no-ignore-vcs"

  selected=$(
  FZF_DEFAULT_COMMAND="rg --files" fzf \
    -m \
    -e \
    --ansi \
    --disabled \
    --reverse \
    --bind "ctrl-a:select-all" \
    --bind "f12:execute-silent:(subl -b {})" \
    --bind "change:reload:$RG_DEFAULT_COMMAND {q} || true" \
    --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2
  )

  [[ -n $selected ]] && ${EDITOR:-nvim} $selected # open multiple files in editor
}
zle     -N            fzf-ff-widget
bindkey '^F' fzf-ff-widget

}
