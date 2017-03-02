########################################
#
# Sample .zshrc file
# initial selias ls='ls -F' l'ls -a' ll='ls -la'tup file for only interactive zsh
# This file is read after .zshenv file is read.
#
########################################

###
# Set Shell variable
# WORDCHARS=$WORDCHARS's,/,,
HISTSIZE=10000 HISTFILE=~/.zsh_history SAVEHIST=10000
PROMPT='%m{%n}%% '
RPROMPT='[%~]'

# Set shell options
setopt auto_cd auto_remove_slash auto_name_dirs
setopt auto_pushd
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt hist_save_no_dups
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys pushd_ignore_dups
setopt autonamedirs
#setopt auto_menu correct rm_star_silent sun_keyboard_hack
setopt share_history inc_append_history
setopt appendhistory

# Alias and functions
alias copy='cp -ip' del='rm -i' move='mv -i'
alias fullreset='echo "\ec\ec"'
h () {history $* | less}
alias ja='LANG=jaJP.UTF8 XMODIFIERS=@im=kinput2'
#alias l=ls ls='ls -F' la='ls -a' ll='ls -lFa --color=auto' ltr='ls -ltr --color=auto' l.='ls -ld'
alias l=ls ls='ls -FG' la='ls -a' ll='ls -lFaG ' ltr='ls -ltrG ' l.='ls -ld'
mdcd  () {mkdir -p "$@" && cd "$*[-1]"}
mdpu  () {mkdir -p "$@" && pushd "$*[-1]"}
alias pu=pushd po=popd dir='dirs -v'

# Suffix aliases
alias -s pdf=acroread dvi=xdvi
alias -s {odt,ods,odp,doc,xls,ppt}=soffice
alias -s {tgz,lzh,zip,zrc}=file-roller

# global aliases
alias -g N='> /dev/null 2>&1'
alias -g L='| less'

# binding keys
bindkey -v

bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward


autoload -U compinit && compinit
