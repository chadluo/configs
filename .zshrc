# Path to your oh-my-zsh configuration.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="yuki"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh nvm-zsh git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# auto completion
autoload -U compinit
compinit

# PROMPT="
# %{$(echo "\a")%}%B[%2c] %#%b "
# RPROMPT="%B[%?][%T]%b"

bindkey -v # vim mode
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward

# list
alias ll='ls -ABbFGlhrt --time-style="+<%y/%m/%d %H:%M>"'
alias lsb='ll | tail -15'
alias flt='ll | egrep '

alias dfh="df -h"
alias dus="du -ch -d 1 | sort -h"
alias ..="cd .."
alias ports="ss --all --numeric --processes"

alias gcc="gcc -g"
alias clang="clang -g"

# pacman
alias updt="yaourt -Syua"
alias udt="yaourt -Syua --noconfirm"
alias pacsrch="pacman -Qs"
alias pacopti="su -c 'pacman -Sc && pacman-optimize'"

# safety
alias cp='cp -iv'
alias mv='mv -i'
alias rm='rm -I'

# grep
alias grep='grep -iE --color=always'

# vi...
alias vi='vim'

# glances
alias glances='glances -e'

# UNSW CSE
alias csessh="ssh xluo086@login.cse.unsw.edu.au"
csescp() { scp $@ xluo086@login.cse.unsw.edu.au:~ }

# hexo
alias hexogd='hexo generate --deploy'

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

zstyle ':completion:*' menu select

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/home/yuki/perl5";
export PERL_MB_OPT="--install_base /home/yuki/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/yuki/perl5";
export PERL5LIB="/home/yuki/perl5/lib/perl5:$PERL5LIB";
export PATH="/home/yuki/perl5/bin:$PATH";
