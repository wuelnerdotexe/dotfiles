#!/bin/bash

if command -v fd &> /dev/null
then
  export FZF_DEFAULT_COMMAND="fd -I -H -E '{.git,.svn,.hg,CSV,.DS_Store,Thumbs.db,node_modules,bower_components,*.code-search}' -t f"
fi

##
# Directories Find.
# Usage: `df`
#
df() {
  local dir
  dir=$(find "${1:-.}" -type d 2> /dev/null | fzf +m) && cd "$dir" || exit
}

##
# Files Find.
# Usage: `ff`
#
ff() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

##
# Words Find.
# Usage: `wf` or `wf <folder>`.
#
wf() {
  [[ -n $1 ]] && cd $1 # go to provided folder or noop
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

##
# History Find.
# Usage: `hf`
#
hf() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
