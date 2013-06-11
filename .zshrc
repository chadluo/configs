# auto completion
autoload -U compinit

PROMPT="%{$(echo "\a")%}%B%T %2c %#%b "
# PROMPT="%B%T %~ %#%b "

alias lsf='ls -ABbFGlhrt --time-style="+<%y/%m/%d %H:%M>"'
alias lsb='ls -ABbFGlhrt --time-style="+<%y/%m/%d %H:%M>" | tail -15'
alias lsj='ls -ABbFGlhrt --time-style="+<%y/%m/%d %H:%M>" | grep .java'
alias flt='lsf | grep '

alias df="df -h"
alias du="du -ch"
alias dus="du -sch"
alias .="cd -"
alias ..="cd .."
alias subl="subl -n -w"

alias gcc="gcc -g"
alias clang="clang -g"

alias install="yaourt -S"
alias updt="yaourt -Syua"
alias udt="yaourt -Syua"
alias pacsrch="pacman -Qs"
alias pacopti="su -c 'pacman -Sc && pacman-optimize'"

wiki() { dig +short txt $1.wp.dg.cx; }
mkcd() { mkdir $1 && cd $1 }
coc() { clang $1.c -o $1 }
jc() { javac $1.java && java $1 }
lr() { lilypond $1.ly && zathura $1.pdf }

export EDITOR="vim"

# rubygem
PATH=$PATH:/home/yuki/.gem/ruby/2.0.0/bin
export PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# nvm
sed -i 's/^plugins=(/plugins=(nvm-zsh /' ~/.zshrc
source ~/nvm/nvm.sh
