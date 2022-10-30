# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/go/bin"
export MANPATH="/usr/local/man:$MANPATH"

# 添加当前用户路径下的.bin到PATH
export PATH=$PATH:$HOME/.bin

# 设置GO语言PATH
export GOPATH=$HOME/Documents/workspace/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$GOPATH/bin

# icu4c 路径
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# 额外的PATH路径
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# gettext 路径
export PATH="/usr/local/opt/gettext/bin:$PATH"

# 键盘固件刷写工具
export PATH="$PATH:/Users/moore/Downloads/tkg-toolkit-master/mac/bin"

# handfile 的萌萌哒模式
export HANDFILE_MMD_MODE=1

# 根据 VIRTUAL_ENV 环境变量初始化 Python 虚拟环境
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# jenv 初始化
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

# Created by `userpath` on 2020-09-07 09:44:23
export PATH="$PATH:/Users/moore/.local/bin"

# 设置pyenv环境
eval "$(pyenv init --path)"
