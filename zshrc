# 初始化命令提示符 {{{
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
# Env {{{
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

# }}}
# Init Module {{{
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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# }}}
# 插件管理 {{{
# --------

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git history history-substring-search autojump autopep8 celery common-aliases docker docker-compose emacs fabric github gitignore gulp iterm2 node npm pyenv python sublime virtualenv virtualenvwrapper cp web-search last-working-dir catimg encode64 urltools wd)
plugins=(
    wd history
    common-aliases python
    z cp extract zsh_reload safe-paste colored-man-pages
    last-working-dir tmux
    git gitignore github)

# zplug "zsh-users/zsh-autosuggestions"
# zplug "zsh-users/zsh-syntax-highlighting"
# zplug "djui/alias-tips"  # 别名提醒

source $(brew --prefix)/opt/zinit/zinit.zsh

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light djui/alias-tips  # 别名提醒

# 模糊搜索
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# }}}
# User configuration {{{
# ------------------

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=gray'

# virtualenvwrapper虚拟环境 {{{
export WORKON_HOME=/Volumes/Develop/.virtualenvs
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
alias vim='/usr/local/bin/vim'
alias ra='ranger'

# 设置默认编辑器
export EDITOR='nvim'

# 统计当前路径下的文件数、文件夹数、以及递归统计
alias wcd='ls -l | grep "^d" | wc -l'
alias wcf='ls -l | grep "^-" | wc -l'
alias wcdr='ls -lR | grep "^d" | wc -l'
alias wcfr='ls -lR | grep "^-" | wc -l'

# }}}
# 命令补全 {{{
# --------

# jenv 初始化
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

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

# hstr 插件配置 {{{
# -------------
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
# }}}
# 插件配置: autojump {{{
# -----------------
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh
# }}}

# vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
