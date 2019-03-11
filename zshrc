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
#alias open="xdg-open "
#alias la="ls -la"
alias fetch=neofetch
alias shutdown="sudo poweroff"
alias logoff="sudo pkill -u a"
alias scrot="scrot -q 100"
alias vi="nvim"
alias vim="nvim"
alias memcheck="valgrind --leak-check=full --show-reachable=yes"
alias mpd="mpd ~/.config/mpd/mpd.conf"
alias memcheck="valgrind --leak-check=full --show-reachable=yes"
alias wrpi="mpv http://icecast1.wrpi.org:8000/mp3-256.mp3"
alias psoft="cd ~/School/Programming/PSoft/homeworks/"
alias pro="cd ~/School/Programming"

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export VISUAL='nvim'
export EDITOR=$VISUAL
export PAGER='less'

# color for less and man 
export MANPAGER='less -s -M +Gg'
export LESS="--RAW-CONTROL-CHARS"
lesscolors=$HOME/bin/.LESS_TERMCAP
[[ -f $lesscolors ]] && . $lesscolors

export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/bin
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
export PATH=$PATH:~/Library/Python/3.7/bin
export PATH=$PATH:/Library/TeX/texbin
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/home/aquamarine/.gem/ruby/2.6.0/bin
export PATH=$PATH:~/.npm-global/bin
export PATH=$PATH:~/.cache/yay/spotifyd/pkg/spotifyd-dbus-mpris/usr/bin

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

PATH="/Users/aquamarine/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/aquamarine/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/aquamarine/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/aquamarine/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/aquamarine/perl5"; export PERL_MM_OPT;

#curl wttr.in/troy\?Q0

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

