# bash options
shopt -s autocd
# shopt -s autocd globstar

# Load aliases
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi
# see below for future, move .aliases into ~/.sh/d

#in future, put aliases and others in this folder
# and common with .zshrc 
# not activated yet, but to do in future

#for i in ${HOME}/.sh.d/*; do
#	if [ -f $"i" ] ; then
#	. "$i"
#	fi
#done

export TERM="xterm-256color" 
export EDITOR=vim 
export PATH=$HOME/bin:/usr/local/bin:$PATH

#tell ls to be more colorful
# not sure if it works
export CLICOLOR=1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# fasd
# eval "$(fasd --init auto)"
# disabled, because it slowed down the bash in Cygwin; introduces some delay

# z.sh
. ~/bin/z.sh
