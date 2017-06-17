# set locale
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# http://journal.mycom.co.jp/column/zsh/001/index.html
autoload -U compinit
compinit

# http://0xcc.net/unimag/3/
# keybind like Emacs
bindkey -e

# http://0xcc.net/unimag/3/
zstyle ':completion:*:default' menu select=1

# customize history
# http://journal.mycom.co.jp/column/zsh/003/index.html

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000
#setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# http://0xcc.net/unimag/3/#foottext-6
setopt extended_history
function history-all { history -E 1 }
function historyall  { history -E 1 }

# http://d.hatena.ne.jp/hayori/20071019/1192785576
# zshのデフォルトでは改行のない文字列を表示しない。
# 混乱のもとになるので無効にする。
unsetopt promptcr

# ディレクトリ名をうつだけでcdできる。
# ..で上へあがれて便利。
setopt auto_cd

# 右側プロンプトはコピペするときに邪魔なのでやめる。
#RPROMPT="[%~]"

# Path
PATH=$PATH:$HOME/bin:/usr/local/bin:/usr/local/mongodb/bin

[ -f ~/.awsrc ] && . ~/.awsrc
## alias

# ls
alias ls='ls -F --show-control-char --color=always'
alias ll='ls -laF --show-control-char --color=always'

# Global Alias
alias -g M='| more'
alias -g C='| colordiff'
alias -g E='| nkf -Ew'
alias -g W='| nkf -w'
alias -g ECM='E C M'
alias -g WCM='W C M'
alias -g L='| less -R'
alias -g WCL='W C L'

# セッション保存先の設定
export SCREENDIR=$HOME/.screens

# aliases for Git
# http://qiita.com/items/1f01aa09ccf148542f21
# http://qiita.com/items/6ebcce530d9530293fec
alias  st='git status --short --branch'
alias g='git'
alias gst='git status'
alias ga='git add'
alias gb='git branch'
alias gci='git commit'
alias gdi='git diff'
alias gd='git diff'
alias gdc="git diff --cached  --word-diff-regex='\\w+|[^[:space:]]'"
alias gdw='git diff --word-diff'
alias gdw-regex="git diff --color-words --word-diff-regex='\\w+|[^[:space:]]'"
alias gbr='git branch -r'
alias gl='git l'
alias gl1='git l -1'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcob=gcb
alias gf='git fetch'
alias gr='git rebase'
alias gp='pr && git push -u >/dev/null &'
alias gpl='git pull --ff-only'
alias gpul='git pull --ff-only'
alias gdnt='git diff --name-only trunk...'
alias amend='git commit --amend'
alias amendc='git commit --amend --reuse-message=HEAD'
alias prune='git remote prune origin'
alias gs='git stash'
alias gsl='git stash list'
# alias的に使う関数群
gcm () { git commit -m "$*" }
gsp () { git stash pop stash@{"$*"} }
review () { git diffw origin/trunk..."$1" }
pr () {
    # "組織名/プロジェクト名"を取得。e.g. sen-corporation/8122
    org_repo_name=$( git config --get remote.origin.url  | sed -e s#git@github.com:## | sed -e s#.git## )

    # カレントブランチ名を取得
    current_branch=$( git branch | grep '^*' | awk '{print $2}' )

    # プルリク用URLを生成
    echo https://github.com/$org_repo_name/pull/new/$current_branch
}

# colordiff
alias cdi='colordiff'
alias cdf='colordiff'

# alias -s 拡張子から実行するコマンドを判断する
# 解凍
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -dc $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract


# for Git
# http://d.hatena.ne.jp/mollifier/20100906/p1
# http://d.hatena.ne.jp/mollifier/20090814/p1
autoload -Uz is-at-least

autoload -Uz vcs_info
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[1]=$vcs_info_msg_0_
}


#PROMPT="%n:%/%1(v|%F{green}%1v%f|)%% "


# プロンプトの色付けは下記記事がわかりやすい
# http://www.sakito.com/2011/11/zsh.html
PROMPT="%n%F{yellow}@%m%f:%/%1(v|%F{green}%1v%f|)%% "

# XOFF を無効化
stty stop undef



# ------------------------------
# alias
# ------------------------------
alias gmtrunk='git checkout trunk && git fetch && git merge origin/trunk --ff-only'
alias gl1p='git log -1 -p W C M'
alias vi='vim'
alias sub='git submodule update'
alias gp='pr && git push &'
alias 9='source ./.zshrc'
alias v9='vim ./.zshrc_d9m'
alias kawaii='echo Thank you!'
alias gl='git vlog -50'
alias gl1='git vlog -1'
alias -g M='| less -r'
alias gd='git diff | colordiff | less -r'
alias sen='ssh senold.8122.jp'
alias gap='git add -p'
alias gdi='git diff | nkf -w | colordiff'
alias gdim='git diff | nkf -w | colordiff | less -r'
alias gss='git stash save'
alias gsp='git stash pop'
alias a='git add .'
alias gsu='(cd $(git rev-parse --show-toplevel) && git submodule update )'
alias gci='git commit -m'
alias grt='git reset'

# ------------------------------
# BASE dir
# ------------------------------
BASE=$HOME/main/

# ------------------------------
# EDITOR
# ------------------------------
export EDITOR=vim

# ------------------------------
# Look And Feel Settings
# ------------------------------
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# 綺麗なコミットだと緑、 汚いと赤
setopt prompt_subst
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    return
  fi
  name=[$name]

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=%F{green}
  elif [[ -n `echo "$st" | grep "^nothing added to commit but untracked files present"` ]]; then
    color=%F{yellow}
  elif [[ -n `echo "$st" | grep "^# Changes to be committed:"` ]]; then
    color=%B%F{red}
  else
     color=%F{magenta}
  fi
  echo "$color$name$action%f%b"
}

# ホスト名
local p_host="%n%F{yellow}"
# カレントディレクトリ
local p_dir="%m%f:%/%1  "
# 直前のコマンドの返り値が trueなら緑、falseなら赤
local p_mark=" %B%(?,%F{green}(*'-') ,%F{red}(*;-;%)?)%(!,#, <)%f%b"
PROMPT='$p_host@$p_dir`rprompt-git-current-branch`$p_mark'

# 時刻更新
RPROMPT="%F{cyan}%D{%Y/%m/%d}[%T]"
TRAPALRM () { zle reset-prompt }
TMOUT=30

# 最後の行のみ右プロンプトを表示
setopt transient_rprompt

# # もしかして時のプロンプト指定
SPROMPT="%F{yellow}(*'～'%)? %F{white}< もしかして %B%r%b かな? [そう!(y), 違う!(n)]: "

# ------------------------------
# 補完
# ------------------------------

# もしかして機能
setopt correct

## 補完方法毎にグループ化する。
## 補完方法の表示方法
##   %B...%b: 「...」を太字にする。
##   %d: 補完方法のラベル
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
## 補完候補に色を付ける。
zstyle ':completion:*:default' list-colors ""
## 補完候補がなければより曖昧に候補を探す。
#### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
#### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'


# -------------------------------
# エンターだけで ls と git status 表示するようにする
# -------------------------------
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls
    # ↓おすすめ
   # ls_abbrev
   if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
       echo
       echo -e "\e[0;33m--- git status ---\e[0m"
       git status -sb
   fi
   zle reset-prompt
   return 0
}
zle -N do_enter
bindkey '^m' do_enter

