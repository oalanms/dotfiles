#!/bin/bash

is_docker(){
  [ ! -z ${DOCKER+x} ]
}

is_docker && apt-get update && apt-get install clang ctags neovim ripgrep git tmux node python3.7 -y
is_docker && pip3.7 install neovim

# Setup Neovim

rm -rf ${HOME}/.config/nvim/
mkdir -p ${HOME}/.config/nvim/
mkdir -p ${HOME}/.config/nvim/snippets/

cp init.vim ${HOME}/.config/nvim/
cp coc-settings.json ${HOME}/.config/nvim/
cp cpp.snippets ${HOME}/.config/nvim/snippets/

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c "PlugInstall" -c "qa"

# Setup TMUX

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp .tmux.conf ${HOME}/

cd ~/.tmux/plugins/tpm/bin/
TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins/ ./install_plugins
TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins/ ./install_plugins
cd -

cp .bashrc_extra ${HOME}

if ! grep -q bashrc_extra "${HOME}/.bashrc"; then
  echo "source ${HOME}/.bashrc_extra" >> ${HOME}/.bashrc
fi
