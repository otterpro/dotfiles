
#PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%}' # default prompt
PROMPT='%F{magenta}%~%f$ ' # default prompt
RPROMPT='%F{magenta}[%n@%m]%f' # right prompt

# path

export PATH=$PATH:~/bin

#uses emacs
bindkey -e

# uses vi key binding. 
#export EDITOR="vi"
# either export or bindkey -v 
#bindkey -v
# However, using vi binding breaks Ctrl-R
# Fix:
# bindkey -M viins '^r' history-incremental-search-backward
# bindkey -M vicmd '^r' history-incremental-search-backward
# OR
# bindkey '^r' history-incremental-search-backward

source ~/.aliases

#less.  -x4=tab 4space,R=ansi color, N=show line S=don't wrap text#
# 
# LESS="-x4NR"
# LESSOPEN handles colorized less using pygment. Make sure .lessfilter is +x
export LESS="-x4R"
export LESSOPEN='|~/.lessfilter.sh %s'

# https://github.com/rupa/z.git
. ~/bin/z.sh

# OS Specific 
case "$OSTYPE" in
	darwin*) # mac-specific
		# fix iTerm2 - show pwd in Tab
		function precmd {
			echo -ne "\033]0;$PWD\007"
		}
		;;	
	linux*)	# linux-specific
		;;
	*)	# all other OS
		;;
esac

