source ~/.aliases

export TERM="xterm-256color" 
export EDITOR=vim 
export PATH=$HOME/bin:/usr/local/bin:$PATH

#mac specific
# $preview this.png
alias preview="open -a Preview"

#tell ls to be more colorful
# not sure if it works
export CLICOLOR=1

#tell grep to higlight matches
#export GREP_OPTIONS='--color=auto'
# this is deprecated.

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# fasd
eval "$(fasd --init auto)"
