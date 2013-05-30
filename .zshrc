PROMPT="%{$(echo "\a")%}%B%T %~ %#%b "

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

alias Instl="yaourt -S"
alias updt="yaourt -Syua"
alias udt="yaourt -Syua"
alias pacsrch="pacman -Qs"

alias csessh="ssh xluo086@login.cse.unsw.edu.au"

wiki() { dig +short txt $1.wp.dg.cx; }
mkcd() { mkdir $1 && cd $1 } 
coc() { clang $1.c -o $1 }
jc() { javac $1.java && java $1 } 
lr() { lilypond $1.ly && zathura $1.pdf }
