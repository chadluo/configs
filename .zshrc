# auto completion
autoload -U compinit
compinit

PROMPT="%{$(echo "\a")%}%B%2c %#%b "
RPROMPT="%B[%?] %T%b"

bindkey -v # vim mode

# list
alias lsf='ls -ABbFGlhrt --time-style="+<%y/%m/%d %H:%M>"'
alias lsb='lsf | tail -15'
alias flt='lsf | grep '

alias dfh="df -h"
alias dus="du -ch -d 1"
alias ..="cd .."
alias ports="ss --all --numeric --processes"

alias gcc="gcc -g"
alias clang="clang -g"

# package managing
alias updt="yaourt -Syua"
alias udt="yaourt -Syua"
alias pacsrch="pacman -Qs"
alias pacopti="su -c 'pacman -Sc && pacman-optimize'"

# safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'

iki() { dig +short txt $1.wp.dg.cx; }
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

zstyle ':completion:*' menu select

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
