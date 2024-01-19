# bash options
# shopt -s autocd globstar
#if [ -n "$BASH" ]; then
  # see http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#The-Shopt-Builtin
	shopt -s autocd globstar
	#shopt -s cdspell                  # fix minor cd errors
	shopt -s checkhash                # check that a command exists in the hash table before executing it
	shopt -s checkwinsize             # update LINES and COLUMNS after each command to detect window size changes
	#shopt -s expand_aliases           # expand aliases when not interactive
	#shopt -s hostcomplete             # attempt hostname completion (on words containing '@')
	shopt -s nocaseglob               # case-insensitive filename match
	shopt -s no_empty_cmd_completion  # don't search PATH for command completion if the line is empty
#fi

# Load aliases
[ -s ~/.aliases ] && . ~/.aliases
# below script fails if it is symlink?
# if [ -f ~/.aliases ]; then
# 	. ~/.aliases
# fi

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


# ============= starship ====================================================
# -- set win title for zsh/bash
# other to use $HOST, $HOSTNAME
function set_win_title(){
    #echo -ne "\033]0; $PWD \007"
    echo -ne "\033]0; $(basename "$PWD")/ \007"    # only basename of pwd
	#echo -ne "\033]0;$(basename "$PWD")/ ${BASH_COMMAND} \007"  # need to fix
}
## precmd_functions+=(set_win_title) # zsh
starship_precmd_user_func="set_win_title" # bash

# -- launch starship
eval "$(starship init bash)"

# ========= z.sh ===========================================================
. ~/bin/z.sh
. "$HOME/.cargo/env"

# ========== show neofetch =========================
if command -v neofetch >/dev/null 2>&1; then
	neofetch
fi
