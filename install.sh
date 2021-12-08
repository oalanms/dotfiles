#!/bin/bash

is_docker(){
  [ ! -z ${DOCKER+x} ]
}

is_docker && apt-get update && apt-get install clang ctags neovim ripgrep git tmux node python3.7 -y
is_docker && pip3.7 install neovim

# Setup Neovim

NVIM_HOME=${HOME}/.config/nvim/
NVIM_SNIPPETS=${HOME}/snippets/

rm -rf ${NVIM_HOME}
mkdir -p ${NVIM_HOME}
mkdir -p ${NVIM_SNIPPETS}

cp init.vim ${NVIM_HOME}
cp coc-settings.json ${NVIM_HOME}
cp cpp.snippets ${NVIM_SNIPPETS}

# Install VimPlug
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
