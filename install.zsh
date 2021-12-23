copy_files() {
  local dir=$(pwd)

  [[ -d "${HOME}/.config" ]] || mkdir "${HOME}/.config"

  # Wallpaper
  [[ -f "${HOME}/Pictures/wallpaper.jpg" ]] && mv "${HOME}/Pictures/wallpaper.jpg" "${HOME}/Pictures/wallpaper.jpg.old"
  ln -s "${dir}/wallpaper.jpg" "${HOME}/Pictures/wallpaper.jpg"
  osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"${HOME}/Pictures/wallpaper.jpg\""

  # Amethyst
  [[ -f "${HOME}/.amethyst" ]] && mv "${HOME}/.amethyst" "${HOME}/.amethyst.old"
  ln -s "${dir}/amethyst" "${HOME}/.amethyst"

  # kitty
  [[ -d "${HOME}/.config/kitty" ]] || mkdir "${HOME}/.config/kitty"
  [[ -f "${HOME}/.config/kitty/kitty.conf" ]] && mv "${HOME}/.config/kitty/kitty.conf" "${HOME}/.config/kitty/kitty.conf.old"
  ln -s "${dir}/kitty.conf" "${HOME}/.config/kitty/kitty.conf"

  # Bashtop
  [[ -d "${HOME}/.config/bashtop" ]] || mkdir "${HOME}/.config/bashtop"
  [[ -d "${HOME}/.config/bashtop/user_themes" ]] || mkdir "${HOME}/.config/bashtop/user_themes"
  [[ -f "${HOME}/.config/bashtop/user_themes/nord.theme" ]] && mv "${HOME}/.config/bashtop/user_themes/nord.theme" \
    "${HOME}/.config/bashtop/user_themes/nord.theme.old"
  [[ -f "${HOME}/.config/bashtop/bashtop.cfg" ]] && mv "${HOME}/.config/bashtop/bashtop.cfg" \
    "${HOME}/.config/bashtop/bashtop.cfg.old"
  ln -s "${dir}/nord.theme" "${HOME}/.config/bashtop/user_themes/nord.theme"
  ln -s "${dir}/bashtop.cfg" "${HOME}/.config/bashtop/bashtop.cfg"

  # HTOP
  [[ -d "${HOME}/.config/htop" ]] || mkdir "${HOME}/.config/htop"
  [[ -f "${HOME}/.config/htop/htoprc" ]] && mv "${HOME}/.config/htop/htoprc" "${HOME}/.config/htop/htoprc.old"
  ln -s "${dir}/htoprc" "${HOME}/.config/htop/htoprc"

  # NCSpot
  [[ -d "${HOME}/.config/ncspot" ]] || mkdir "${HOME}/.config/ncspot"
  [[ -f "${HOME}/.config/ncspot/config.toml" ]] && mv "${HOME}/.config/ncspot/config.toml" "${HOME}/.config/ncspot/config.toml.old"
  ln -s "${dir}/ncspot.toml" "${HOME}/.config/ncspot/config.toml"

  # Lynx
  [[ -d "${HOME}/.config/lynx" ]] || mkdir "${HOME}/.config/lynx"
  [[ -f "${HOME}/.config/lynx/lynx.cfg" ]] && mv "${HOME}/.config/lynx/lynx.cfg" "${HOME}/.config/lynx/lynx.cfg.old"
  ln -s "${dir}/lynx.cfg" "${HOME}/.config/lynx/lynx.cfg"

  # ZSH
  [[ -d "${HOME}/.zsh" ]] && mv "${HOME}/.zsh" "${HOME}/.zsh.old"
  [[ -d "${HOME}/.zprezto" ]] && mv "${HOME}/.zprezto" "${HOME}/.zprezto.old"
  [[ -f "${HOME}/.zshrc" ]] && mv "${HOME}/.zshrc" "${HOME}/.zshrc.old"
  [[ -f "${HOME}/.zpreztorc" ]] && mv "${HOME}/.zpreztorc" "${HOME}/.zpreztorc.old"
  [[ -f "${HOME}/.zshenv" ]] && mv "${HOME}/.zshenv" "${HOME}/.zshenv.old"
  [[ -f "${HOME}/.zlogin" ]] && mv "${HOME}/.zlogin" "${HOME}/.zlogin.old"
  [[ -f "${HOME}/.zlogout" ]] && mv "${HOME}/.zlogout" "${HOME}/.zlogout.old"
  [[ -f "${HOME}/.zprofile" ]] && mv "${HOME}/.zprofile" "${HOME}/.zprofile.old"
  ln -s "${dir}/zsh" "${HOME}/.zsh"
  ln -s "${dir}/zsh/prezto" "${HOME}/.zprezto"
  ln -s "${dir}/zshrc" "${HOME}/.zshrc"
  ln -s "${dir}/zpreztorc" "${HOME}/.zpreztorc"
  ln -s "${dir}/zsh/prezto/runcoms/zshenv" "${HOME}/.zshenv"
  ln -s "${dir}/zsh/prezto/runcoms/zlogin" "${HOME}/.zlogin"
  ln -s "${dir}/zsh/prezto/runcoms/zlogout" "${HOME}/.zlogout"
  ln -s "${dir}/zsh/prezto/runcoms/zprofile" "${HOME}/.zprofile"

  # VIM
  [[ -d "${HOME}/.config/nvim" ]] || mkdir "${HOME}/.config/nvim"
  [[ -f "${HOME}/.config/nvim/init.vim" ]] && mv "${HOME}/.config/nvim/init.vim" "${HOME}/.config/init.vim.old"
  [[ -f "${HOME}/.config/nvim/coc-settings.json" ]] && mv "${HOME}/.config/nvim/coc-settings.json" "${HOME}/.config/coc-settings.json.old"
  [[ -d "${HOME}/.vim" ]] && mv "${HOME}/.vim" "${HOME}/.vim.old"
  [[ -f "${HOME}/.vimrc.bundles" ]] && mv "${HOME}/.vimrc.bundles" "${HOME}/.vimrc.bundles.old"
  [[ -f "${HOME}/.vimrc" ]] && mv "${HOME}/.vimrc" "${HOME}/.vimrc.old"
  ln -s "${dir}/init.vim" "${HOME}/.config/nvim/init.vim"
  ln -s "${dir}/vim" "${HOME}/.vim"
  ln -s "${dir}/vimrc.bundles" "${HOME}/.vimrc.bundles"
  ln -s "${dir}/vimrc" "${HOME}/.vimrc"
  ln -s "${dir}/coc-settings.json" "${HOME}/.config/nvim/coc-settings.json"
}

preinstall() {
  # Homebrew
  type brew 2>&1 >/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install python3 bat moc neovim osx-cpu-temp bash coreutils gnu-sed git node go ctags fzf fortune golangci-lint\
    golang-migrate lynx neofetch ripgrep subversion tmate tmux ncspot defaultbrowser lynx htop
  brew install --cask kitty
  brew install --cask amethyst
  brew install --cask min

  # Python modules
  pip3 install psutil
  pip3 install neovim

  # Bashtop
  mkdir -pv "${HOME}/Dev/github.com/aristocratos"
  git clone https://github.com/aristocratos/bashtop.git "${HOME}/Dev/github.com/aristocratos/bashtop"
  cd "${HOME}/Dev/github.com/aristocratos/bashtop"
  sudo make install

  # FiraCode font
  curl -L https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip -o /tmp/Fira_Code_v6.2.zip
  mkdir /tmp/fira
  cd /tmp/fira
  unzip /tmp/Fira_Code_v6.2.zip
  open -b com.apple.FontBook ttf/*.ttf variable_ttf/*.ttf
}

postinstall() {
  # zprezto
  cd "${HOME}/.zprezto"
  git pull
  git submodule sync --recursive
  git submodule update --init --recursive

  # NeoVim plugins
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  nvim -c "PlugInstall|qa"
  nvim -c "CocInstall coc-python coc-fzf-preview coc-golines coc-highlight coc-markdownlint coc-markdown-preview-enhanced coc-prettier coc-sh coc-yaml coc-viml coc-git coc-json coc-go coc-haskell coc-solargraph|qa"

  # zshrc
  source "${HOME}/.zshrc"

  # default browser
  defaultbrowser min
}

read -p "Do you want to install prerequisites? [y/n]" -n 1 -r
echo
if [[ ${REPLY} = "y" ]]; then
  preinstall
fi

read -p "Do you want to copy files? [y/n]" -n 1 -r
echo
if [[ ${REPLY} = "y" ]]; then
  copy_files
fi

read -p "Do you want to run post install hooks? [y/n]" -n 1 -r
echo
if [[ ${REPLY} = "y" ]]; then
  postinstall
fi
