# Environment
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export CLICOLOR=1

# Setup paths
[[ -d /usr/local/bin ]] && export PATH=/usr/local/bin:$PATH
[[ -d /usr/local/opt/coreutils/libexec/gnubin ]] && export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
[[ -d "${HOME}"/.local/bin ]] && export PATH="${HOME}/.local/bin:$PATH"
[[ -d "${HOME}"/go/bin ]] && export PATH="${HOME}/go/bin:$PATH"
[[ -d /usr/local/opt/gnu-sed ]] && export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

[[ -d /usr/local/opt/coreutils/libexec/gnuman ]] && export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# EDITOR
type nvim 2>&1 >/dev/null && export EDITOR="nvim"
type nvim 2>&1 >/dev/null && export VISUAL="nvim"

# bat
export BAT_THEME="DarkNeon"
