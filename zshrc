# Load scripts
local zshenv="${HOME}"/.zsh
local city="Toulon"

# Source prezto
[[ -s "${zshenv}"/prezto/init.zsh ]] && source "${HOME}"/prezto/init.zsh 

[ -f "${HOME}/.fzf.zsh" ] && source "${HOME}/.fzf.zsh"

[[ -f "${HOME}/.zshrc.local" ]] && source "${HOME}/.zshrc.local"

[[ -s "${zshenv}/fzf.zsh" ]] && source "${zshenv}/fzf.zsh" # Fuzzy search
[[ -s "${zshenv}/directories.zsh" ]] && source "${zshenv}/directories.zsh" # Paths
[[ -s "${zshenv}/aliases.zsh" ]] && source "${zshenv}/aliases.zsh" # Aliases
[[ -s "${zshenv}/vimode.zsh" ]] && source "${zshenv}/vimode.zsh" # Set vi mode
[[ -s "${zshenv}/environment.zsh" ]] && source "${zshenv}/environment.zsh" # Environment variables
[[ -s "${zshenv}/net.zsh" ]] && source "${zshenv}/net.zsh" # TCP zsh module
[[ -s "${zshenv}/git.zsh" ]] && source "${zshenv}/git.zsh" # Git aliases
[[ -s "${zshenv}/promptline.zsh" ]] && source "${zshenv}/promptline.zsh" # Theme
[[ -s "${zshenv}/zsh-dircolors-nord/zsh-dircolors-nord.zsh" ]] && source "${zshenv}/zsh-dircolors-nord/zsh-dircolors-nord.zsh"

local cols=`tput cols`
local rows=`tput lines`

if [[ $cols -gt 132 && $rows -gt 42 ]]; then
  clear && curl "wttr.in/${city}" 2>/dev/null | grep -v igor | grep -v "${city}"
else
  clear && neofetch
fi
