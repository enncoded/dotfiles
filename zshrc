#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias c=clear
alias open="xdg-open "
alias ls="ls -a --color=auto --group-directories-first"
alias fetch=neofetch
alias shutdown="sudo poweroff"
alias logoff="sudo pkill -u a"
alias scrot="scrot -q 100"
alias vim="nvim"
alias memcheck="valgrind --leak-check=full --show-reachable=yes"

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# color for less and man 
export MANPAGER='less -s -M +Gg'
export LESS="--RAW-CONTROL-CHARS"
lesscolors=$HOME/bin/.LESS_TERMCAP
[[ -f $lesscolors ]] && . $lesscolors

export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/.gem/ruby/2.5.0/bin
export PATH=$PATH:~/.npm-global/bin

export PATH=$PATH:~/.bar
export PATH=$PATH:~/.toys
export PATH=$PATH:~/.utility
export PATH=$PATH:~/.notify
export PATH=$PATH:~/.executor

export GPG_TTY=$(tty)

fpath=( "$HOME/.zprezto/modules/prompt/functions" $fpath )
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL_COLOR=225
prompt purer

#curl wttr.in/troy\?Q0

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

