if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# rust 相关环境变量配置
. "$HOME/.cargo/env"
