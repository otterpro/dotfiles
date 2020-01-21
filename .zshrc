# zmodload zsh/zprof
#=============== UTF-8 support ==========================
# --- Setting for the new UTF-8 terminal support in Lion
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

#================== OH-my-ZSH ===================================

#------------------- OH-My-ZSH themes --------------------
# --- Set name of the theme to load.
# --- Look in ~/.oh-my-zsh/themes/
# --- Optionally, if you set this to "random", it'll load a random theme each # time that oh-my-zsh is loaded.
# --- ZSH_THEME="robbyrussell"  # <-- default theme
# ZSH_THEME="fishy"    # my favorite

#------------------- OH-My-ZSH options -------------------------
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# ------------ load Oh-My-ZSH here ------------------------------------
# -- Path to your oh-my-zsh installation.
# -- uncomment these two lines to enable Oh-my-zsh
# export ZSH=$HOME/.oh-my-zsh
# source $ZSH/oh-my-zsh.sh

# ----------- oh-my-zsh plugins --------------------------------------
# --- Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# --- Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# --- Add wisely, as too many plugins slow down shell startup.
# --- plugins=(fasd)  #disabled for now due to cygwin's performance issue, using z for now
plugins=(git z)

#================ Shell configuration ========================================
export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="vi ~/.zshrc"
# alias ohmyzsh="vi ~/.oh-my-zsh"
#
# load my own aliases (and functions), and in future, put them in .sh.d
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi
# source ~/.aliases

# for future, use this instead and common with .bash_profile
# for i in ${HOME}/.sh.d/*; do
# 	if [ -f $"i" ] ; then
# 	. "$i"
# 	fi
# done

# imagemagick resize script from Smashing
# source ~/.dotfiles/smartresize.sh

stty -ixon #turn-off XOFF, so that vim can use Ctrl-S. 

# ============== MISC func =========================================
# see http://msol.io/blog/tech/2014/03/10/work-more-efficiently-on-your-mac-for-developers/
# function f() { find . -iname "*$1*" ${@:2} }
#	f png   # finds all png files
#
# function r() { grep "$1" ${@:2} -R . })}
#	r xyz  # grep for xyz 

# ========================== less ==================================
# -- less.  -x4=tab 4space,R=ansi color, N=show line S=don't wrap text#
# -- LESS="-x4NR"
# -- LESSOPEN handles colorized less using pygment. Make sure .lessfilter is +x
export LESS="-x4R"
export LESSOPEN='|~/.lessfilter.sh %s'

# ============== z.sh ===============================================
# -- https://github.com/rupa/z.git
. ~/bin/z.sh

# ============== fasd ===============================================
# -- fasd - replacing z.sh for now, as it was too slow on cygwin
# eval "$(fasd --init auto)"

# ================== virtualenv in tmux ============================
if [ -n "$VIRTUAL_ENV" ]; then
    . "$VIRTUAL_ENV/bin/activate"
fi


# ============== Settings =======================================
export TERM="xterm-256color"
export EDITOR=vim
export VISUAL=gvim

# must explicitly say emac style or it will use it based on $EDITOR 
bindkey -e    # emac style

# ============== OS Specific Settings ===================================
case "$OSTYPE" in
        darwin*) # mac-specific
                # fix iTerm2 - show pwd in Tab
                function precmd {
                        echo -ne "\033]0;$PWD\007"
                }
				export EDITOR=mvim
				export VISUAL=mvim
				# PROMPT_EMOJI='%{$reset_color%}' # unicode - apple logo
				# PROMPT_EMOJI='%{$reset_color%}⚛ '
				# PROMPT_EMOJI='%{$reset_color%}⚛  '
				PROMPT_EMOJI=''
				#PROMPT_EMOJI='%{$reset_color%}%F{white}%f' # unicode - apple logo
				#PROMPT_EMOJI='🍎'  # emoji-red apple
				# PROMPT='%F{white}%f' # unicode - apple logo
				# Opt out of Homebrew analytics
				export HOMEBREW_NO_ANALYTICS=1
                ;;      
        linux*) # linux-specific
				PROMPT_EMOJI='🐧 '  # emoji penguin
				# PROMPT_EMOJI='%{$reset_color%}⚛ '
                ;;

        cygwin) # linux-specific
				PROMPT_EMOJI='©'  # copyright symbol to represent Cygwin
                ;;
        *)      # all other OS
				PROMPT_EMOJI='😜'	# emoji smiley tongue 
                ;;
esac

# ======================= oh-my-zsh PROMPT with emoji ===================
# Longer version with emoji smiley
	# [otter ottermbp] ~$  
	# PROMPT='[%{$fg[yellow]%}%n${PROMPT_EMOJI} %{$fg[red]%}%m%{$fg[white]%}] %{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#.$) '
# shortened version [] ~$  , override above
	# PROMPT='[%{$fg[yellow]%}%n${PROMPT_EMOJI}] %{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#.$) '

# OLD PROMPT -- default, in case no emoji
# override fishy theme's prompt. Replace > with $
	# default PROMPT just in case we don't use emoji
	# Note: it won't work if it is in multiple lines
# PROMPT='[%{$fg[yellow]%}%n%{$fg[red]%}@%m%{$fg[white]%}] %{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#.$) '
	# PROMPT='%n@%m %{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#.>) '
	# PROMPT='%F{red}%[%n@%m] %{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#.$) '
	#

# ==================== DropBox ==========================
# run app from dropbox from terminal
export PATH="$PATH:/Volumes/Samsung128/Dropbox/app"


# ============== RVM =========================================
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# ============== NVM =========================================
# This is too slow
# export NVM_DIR="$HOME/.nvm"   # modeled after RVM
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# alternative
# [Lazy load nvm for faster shell start : node](https://www.reddit.com/r/node/comments/4tg5jg/lazy_load_nvm_for_faster_shell_start/)
declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)

NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

load_nvm () {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

for cmd in "${NODE_GLOBALS[@]}"; do
    eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done

# ============== GREP
# temporary fix for grep_options deprecated bug
# which is still in Oh-My-ZSH
unset GREP_OPTIONS

# ============== FZF =========================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ============== Pure Prompt ==================================
# Requires installing pure prompt first!!!
# TODO: test to see if pure prompt is installed...
autoload -U promptinit; promptinit
# PURE_PROMPT_SYMBOL="$PROMPT_EMOJI ❯"
PURE_PROMPT_SYMBOL="${PROMPT_EMOJI} $"
# user-defined colors
zstyle :prompt:pure:prompt:success color green
prompt pure
# optional additional prompt setting
# PROMPT='%F{white}%* '$PROMPT

# Right side Prompt
RPROMPT="%F{8}%n@%m%f"   # user@server
# zprof

source /Users/otter/Library/Preferences/org.dystroy.broot/launcher/bash/br
