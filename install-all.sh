#!/bin/bash

# COISAS QUE VOCE PRECISA INSTALAR ANTES DE RODAR ISSO
# 	- Git
#	- Neovim / VIM
#	- Fish Shell
#	- stow
#	- Tmux
#	- Ranger
#	- nvm (NodeJs) https://github.com/nvm-sh/nvm
#	- Curl
#	- Which


# VIM / NEOVIM - Plugin Manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo ' ## Plugin Manager Vim/Neovim setado'

#Fish
chsh -s $(which fish) || chsh -s /bin/fish
echo ' ## Trocado o Shell pelo Fish'

# instalar o prompt Starship para o Fish
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

#Fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher || (echo ' ## ERRO ao instalar o Fisher' && exit)
fisher install jorgebucaran/nvm.fish || (echo ' ## ERRO ao instalar o NVM pelo Fisher' && exit)

echo ' ## Fisher INSTALADO'
echo ' ## Nvm INSTALADO'

# Tmux plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || (echo ' ## ERRO ao instalar o Tmux Plug Manager' && exit)

echo ''
echo '------------------------------------------------------------'
echo ''
echo ' Para setar os dotfiles (inclucido do i3) bastar usar o GNU Stow e executar...'
echo '  >$ stow *'
echo ' ou para instalar apenas de cada programa... '
echo '  >$ stow neovim'
echo ''
echo '------------------------------------------------------------'
echo ''
echo ' # Para o LSP do Neovim, é necessário instalar via NPM os pacotes...'
echo ' @volar/vue-language-server'
echo ' typescript-language-server'
echo ' typescript'
echo ' vscode-langservers-extracted'
echo ''
echo ' # Para o LSP de C ou C++ é necessário instalar o clang'
echo ''
echo '------------------------------------------------------------'


