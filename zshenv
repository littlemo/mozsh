if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# NVM 初始化 - 确保非交互式 shell (如 neovim) 也能找到 node
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# 使用与交互式 shell 一致的 node 版本
nvm use v16.19.1 > /dev/null 2>&1

# Claude 模型配置 - 确保非交互式 shell 也能生效
export ANTHROPIC_MODEL="doubao-seed-2-0-code-preview-260215"
export ANTHROPIC_BASE_URL="https://ark.cn-beijing.volces.com/api/compatible"
export ANTHROPIC_AUTH_TOKEN="b4ab719b-8a69-4aa4-9107-4e6eaccc3956"

# 模型名称映射（用于提示符显示）
typeset -gA _MODEL_DISPLAY_NAMES
_MODEL_DISPLAY_NAMES=(
  ["doubao-seed-1-8-251228"]="doubao-multi"
  ["doubao-seed-2-0-code-preview-260215"]="doubao-code"
  ["deepseek-v3-2-251201"]="deepseek"
  ["glm-4-7-251222"]="glm"
)

