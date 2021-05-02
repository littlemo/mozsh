# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export GITSTATUS_LOG_LEVEL=DEBUG

# Path to your oh-my-zsh installation.
export ZSH=/Users/moore/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="amuse"
# ZSH_THEME="bullet-train"
#ZSH_THEME="spaceship"
#ZSH_THEME="random"

# 为 bullet-train 主题配置提示符顺序&样式
# BULLETTRAIN_PROMPT_ORDER=(
#     time
#     status
#     custom
#     # screen
#     # perl
#     # ruby
#     virtualenv
#     # nvm
#     # aws
#     # go
#     # rust
#     # elixir
#     git
#     # hg
#     dir
#     cmd_exec_time
# )
# BULLETTRAIN_VIRTUALENV_BG=black

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git history history-substring-search autojump autopep8 celery common-aliases docker docker-compose emacs fabric github gitignore gulp iterm2 node npm pyenv python sublime virtualenv virtualenvwrapper cp web-search last-working-dir catimg encode64 urltools wd)
plugins=(
    last-working-dir wd history
    common-aliases python
    github docker docker-compose)


# 使用 zplug 插件管理器，该插件使用 homebrew 安装
source ~/.zplug/init.zsh

# 安装 git 相关插件
zplug "plugins/git", from:oh-my-zsh, if:'which git'
zplug "plugins/gitignore", from:oh-my-zsh, if:'which git'

# 常用工具相关插件
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/cp", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/safe-paste", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/pre-directory-history", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "djui/alias-tips"  # 别名提醒

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# zplug 插件管理器配置完毕

# User configuration
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=gray'

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/go/bin"
#export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# some more ls aliases
# alias ll='ls -alFh'
# alias la='ls -Ah'
# alias l='ls -CFh'

# source ~/.completion/.git-completion.zsh
fpath=(/usr/local/share/zsh-completions $fpath)

# 用ec来快速启动emacs client
alias ec='env TERM=xterm emacsclient -t -a ""'

alias vim='/usr/local/bin/vim'

# 设置默认编辑器
export EDITOR='nvim'

# 统计当前路径下的文件数、文件夹数、以及递归统计
alias wcd='ls -l | grep "^d" | wc -l'
alias wcf='ls -l | grep "^-" | wc -l'
alias wcdr='ls -lR | grep "^d" | wc -l'
alias wcfr='ls -lR | grep "^-" | wc -l'

source ~/.token

# Fix: SSH远程登录Server时的warning: Falling back to the standard locale ("C").错误
# LC_ALL="C"
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# 设置virtualenvwrapper环境
export WORKON_HOME=/Volumes/Develop/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/Users/moore/.pyenv/shims/python3
source /usr/local/bin/virtualenvwrapper.sh

export GPG_TTY=$(tty)

# added by travis gem
[ -f /Users/moore/.travis/travis.sh ] && source /Users/moore/.travis/travis.sh

# 开启 pipenv 的补全提示
eval "$(pipenv --completion)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

# Created by `userpath` on 2020-09-07 09:44:23
export PATH="$PATH:/Users/moore/.local/bin"

autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh
