# 初始化 {{{
# 主题 {{{
# ----------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# }}}
# 环境变量 {{{
# ---

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/go/bin"
#export MANPATH="/usr/local/man:$MANPATH"

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

# Path to your oh-my-zsh installation.
export ZSH=/Users/moore/.oh-my-zsh

export GPG_TTY=$(tty)

# npm
case ":${PATH}:" in
    *:"$HOME/.node_modules/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed rustc needs to be overridden
        export PATH="$HOME/.node_modules/bin:$PATH"
        ;;
esac


# }}}
# 模块 {{{
# -----------
source ~/.token
source $ZSH/oh-my-zsh.sh

# On slow systems, checking the cached .zcompdump file to see if it must be
# regenerated adds a noticable delay to zsh startup.  This little hack restricts
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - '.' matches "regular files"
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;
# }}}
# }}}

# Misc {{{
# ----

# Fix: SSH远程登录Server时的warning: Falling back to the standard locale ("C").错误
# LC_ALL="C"
# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# }}}
# 插件管理 {{{
# --------

source $(brew --prefix)/opt/zinit/zinit.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git history history-substring-search autojump autopep8 celery common-aliases docker docker-compose emacs fabric github gitignore gulp iterm2 node npm pyenv python sublime virtualenv virtualenvwrapper cp web-search last-working-dir catimg encode64 urltools wd)
plugins=(
    wd history
    common-aliases python
    z cp extract zsh_reload safe-paste colored-man-pages
    last-working-dir
    git gitignore github)

zinit snippet OMZP::wd
zinit snippet OMZP::history
zinit snippet OMZP::common-aliases
zinit snippet OMZP::cp
zinit snippet OMZP::safe-paste
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::last-working-dir
zinit snippet OMZP::git
zinit snippet OMZP::gitignore
zinit snippet OMZP::github

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light djui/alias-tips  # 别名提醒

# }}}
# User configuration {{{
# ------------------

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=gray'

# 高亮最长字符限制，避免粘贴长文本过慢
export ZSH_HIGHLIGHT_MAXLENGTH=60

# virtualenvwrapper虚拟环境 {{{
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/Users/moore/.pyenv/shims/python3
# source /usr/local/bin/virtualenvwrapper.sh
# }}}

# added by travis gem
# [ -f /Users/moore/.travis/travis.sh ] && source /Users/moore/.travis/travis.sh

# [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

# }}}
# Alias {{{
# -----

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls='exa'  # 用exa替换ls命令
alias la='l -a'
alias cat='bat'  # 用bat替换cat命令
alias vim='/usr/local/bin/vim'
alias ra='ranger'
alias lg='lazygit'
alias v='nvim'
alias pure_nvim='nvim --noplugin -n -i NONE -u NONE'
# alias proxy="export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;export ALL_PROXY=socks5://127.0.0.1:1080"
# alias unproxy="unset http_proxy https_proxy ALL_PROXY"
alias tm="tmux -2u a -t moore || tmux -2u new -s moore"

# 设置默认编辑器
export EDITOR='nvim'

# 统计当前路径下的文件数、文件夹数、以及递归统计
alias wcd='ls -l | grep "^d" | wc -l'
alias wcf='ls -l | grep "^-" | wc -l'
alias wcdr='ls -lR | grep "^d" | wc -l'
alias wcfr='ls -lR | grep "^-" | wc -l'

# 快速打开收藏的服务列表
alias b="cat ~/handfile/.runtime/favorites_url | fzf --height 40% --layout reverse --info inline --border | awk '{print \"open\", \$1}' | sh"

proxy_ioa () {
	export http_proxy="http://10.42.1.20:1087"
	export https_proxy=$http_proxy
	export all_proxy=$http_proxy
	echo "iOA Proxy on"
}

# v2ray 没有请忽略
proxy () {
	export http_proxy="http://127.0.0.1:1087"
	export https_proxy=$http_proxy
	export HTTP_PROXY=$http_proxy
	export HTTPS_PROXY=$http_proxy
	export socks_proxy="socks5://127.0.0.1:1080"
	export SOCKS_PROXY="socks5://127.0.0.1:1080"
	# export all_proxy="socks5://127.0.0.1:1080"
	echo "HTTP Proxy v2ray on"
}

proxy_v2raya () {
	export http_proxy="http://10.42.1.18:20171"
	export https_proxy=$http_proxy
	export HTTP_PROXY=$http_proxy
	export HTTPS_PROXY=$http_proxy
	export socks_proxy="socks5://10.42.1.18:20170"
	export SOCKS_PROXY=$socks_proxy
	echo "HTTP Proxy v2raya on"
}

proxy_yidu () {
	export all_proxy="http://172.16.96.1:8123"
	echo "HTTP Proxy yidu on"
}

unproxy () {
	unset http_proxy
	unset https_proxy
	unset socks_proxy
	unset HTTP_PROXY
	unset HTTPS_PROXY
	unset SOCKS_PROXY
	unset all_proxy
	echo "Proxy off"
}

# }}}
# 命令补全 {{{
# --------

# pipx
eval "$(register-python-argcomplete pipx)"

# 开启 pipenv 的补全提示
# eval "$(pipenv --completion)"

# zsh 补全
fpath=(/usr/local/share/zsh-completions $fpath)
fpath+=${ZDOTDIR:-~}/.zsh_functions

# 开启 k8s 命令自动补全
# source <(kubectl completion zsh)

# git-extras 命令补全
source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh
# }}}

# 插件配置 {{{
# autojump {{{
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh
# }}}
# percol {{{
function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi
# }}}
# direnv {{{
eval "$(direnv hook zsh)"
# }}}
# pyenv {{{
eval "$(pyenv init -)"
# }}}
# vim: set foldmethod=marker ts=2 sw=2 tw=80 noet foldlevel=0:
