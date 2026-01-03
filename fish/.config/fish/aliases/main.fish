alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="eza -l --icons --git --group-directories-first --time-style=relative"
alias op="opencode"
alias rm="rm -i"
alias rmf="rm -rf"
alias clr="clear"
# tmux
alias t="tmux a || tmux new -s main"
alias ta="tmux a"
alias td="tmux detach"
alias tl="tmux ls"
alias tn="tmux new -s"
alias tk="tmux kill-session -t"
alias tka="tmux kill-server"

# zellij
alias z="zellij attach || zellij -s main"
alias za="zellij attach"
alias zd="zellij action detach"
alias zl="zellij list-sessions"
alias zn="zellij -s"
alias zk="zellij kill-session"
alias zka="zellij kill-all-sessions"
alias zr="zellij run --"
alias zm='zellij action start-or-reload-plugin file:~/.config/zellij/plugins/multitask.wasm --configuration "shell=$SHELL,ccwd=`pwd`"'
