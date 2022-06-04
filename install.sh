#!/bin/bash

HOME="/home/alan"
NVIM_HOME="$HOME/.config/nvim"
NVIM_LUA_HOME="$NVIM_HOME/lua"
TMUX_CONF_HOME="$HOME"

# Install programs
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs python3.9 pip fzf ripgrep

sudo npm install -g yarn prettier

python3.9 -m pip install neovim

# Setup NEOVIM
mkdir -p $NVIM_LUA_HOME
cp init.vim $NVIM_HOME
cp lua/* $NVIM_LUA_HOME
cp .tmux.conf $TMUX_CONF_HOME

# Install packer
PACKER_INSTALL_DIR="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
COPILOT_INSTALL_DIR="$HOME/.config/nvim/pack/github/start/copilot.vim"
TMUX_PLUGIN_MANAGER_INSTALL_DIR="$HOME/.tmux/plugins/tpm"

[[ ! -d $PACKER_INSTALL_DIR ]] && git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKER_INSTALL_DIR
[[ ! -d $COPILOT_INSTALL_DIR ]] && git clone https://github.com/github/copilot.vim.git $COPILOT_INSTALL_DIR
[[ ! -d $TMUX_PLUGIN_MANAGER_INSTALL_DIR ]] && git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_MANAGER_INSTALL_DIR

nvim -c "PackerSync" -c "qa"
nvim -c "CocInstall coc-clangd coc-flutter coc-lua coc-go coc-prettier" -c "qa"
