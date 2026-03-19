if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# NVM 初始化 - 确保非交互式 shell (如 neovim) 也能找到 node
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# 使用与交互式 shell 一致的 node 版本
nvm use v16.19.1 > /dev/null 2>&1

