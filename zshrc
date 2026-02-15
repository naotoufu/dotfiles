##### 基本設定 #######################################################

# ロケール
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# 好きなエディタ
export EDITOR=vim
export VISUAL=vim

# Homebrew (Apple Silicon / Intel 両対応)
if [ -d /opt/homebrew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -d /usr/local/Homebrew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# パス
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

##### 履歴設定 #######################################################

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt APPEND_HISTORY       # 逐次追記
setopt SHARE_HISTORY        # 複数シェルで履歴共有
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY

##### 補完まわり #####################################################

autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list \
  'm:{a-z}={A-Za-z}' \
  'r:|[._-]=* r:|=*'

# 補完時に色付き
if (( $+commands[dircolors] )); then
  eval "$(dircolors -b)"
fi

##### プロンプト (Git 対応) ###########################################

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

setopt PROMPT_SUBST

# 1行目: ユーザー/ホスト/カレントディレクトリ/ブランチ
# 2行目: $ または # （root）
PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %F{magenta}${vcs_info_msg_0_}%f
%F{green}%(!.#.$)%f '

##### シェルオプション ################################################

setopt autocd        # ディレクトリ名だけでcd
setopt correct       # タイプミスをある程度修正
setopt noclobber     # > で上書き防止
setopt notify
setopt nobeep

##### キーバインド (vi モード + 履歴検索) ############################

bindkey -v                  # vi モード

# ↑↓ で「同じプレフィックスの履歴」を検索
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
bindkey "${key[Up]}"   up-line-or-beginning-search
bindkey "${key[Down]}" down-line-or-beginning-search

##### よく使うエイリアス ##############################################

# ls / eza
if command -v eza >/dev/null 2>&1; then
  alias l='eza --icons=auto'
  alias ls='eza --icons=auto'
  alias ll='eza -lh --git --icons=auto'
  alias la='eza -lha --git --icons=auto'
else
  alias ll='ls -alF'
  alias la='ls -A'
fi

alias ..='cd ..'
alias ...='cd ../..'

# git
alias g='git'
alias gst='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gco='git checkout'
alias gb='git branch'
alias gl='git log --oneline --graph --decorate'
alias gp='git push'
alias gpl='git pull --rebase'

# Swift / Xcode 系
alias xc='xed .'
alias xcb='xcodebuild'
alias spm='swift package'
alias srt='swift test'
alias sru='swift run'

# 便利系
alias c='clear'
alias md='mkdir -p'
alias rmf='rm -rf'

##### fzf 連携（入れてたら便利） #####################################

if command -v fzf >/dev/null 2>&1; then
  # Ctrl-R で履歴検索を fzf で
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git" 2>/dev/null || fd || find .'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  # Ctrl-T でファイル選択 → カレントに貼り付け
  # Ctrl-R はデフォルトで履歴
fi

##### vim をデフォルトエディタとして使う ###############################

alias vi='vim'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion"
