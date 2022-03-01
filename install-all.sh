#!/bin/bash

echo 'Qual OS esta executando isso?'
echo -e "[1] Arch Linux \t [2] Debian/Ubuntu\t [3] OpenSuse\t [x] Não baixar nada"
echo -n '>'; read osRunning;

# Instalar todos os programas necessário
function archInstall(){
	echo 'PROGRAMAS PARA INSTALAR'
	echo -e '\t-Vim \n\t-Ranger \n\t-Tmux \n\t-NodeJS \n\t-NPM \n'
	sudo pacman -S git fish gvim ranger tmux nodejs npm curl neovim stow
}
function debianInstall(){
	echo 'PROGRAMAS PARA INSTALAR'
	echo -e '\t-Vim \n\t-Ranger \n\t-Tmux \n\t-Node \n\t-NPM \n'
	sudo apt install vim vim-gtk tmux ranger git curl neovim fish stow
	echo -e 'NodeJs e NPM precisam de uma instalação por fora'
}
function suseInstall(){
	echo 'PROGRAMAS PARA INSTALAR'
	echo -e '\t-Vim \n\t-Ranger \n\t-Tmux \n\t-Node \n\t-NPM \n'
	sudo zypper install vim tmux ranger git curl neovim fish tmux
	echo -e 'NodeJs e NPM precisam de uma instalação por fora'
}

if [ $osRunning = 1 ]; then
	echo '1) Instalar programas'
	archInstall
elif [ $osRunning = 2 ]; then 
	echo '1) Instalar programas'
	debianInstall
elif [ $osRunning = 3 ]; then 
	echo '1) Instalar programas'
	suseInstall
fi

# VIM / NEOVIM - Plugin Manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo ' ## Plugin Manager Vim/Neovim setado'

#Fish
chsh -s /bin/fish
echo ' ## Trocado o Shell pelo Fish'

echo ''
echo '------------------------------------------------------------'
echo ''
echo ' Para setar os dotfiles (inclucido do i3) bastar usar o GNU Stow e executar...'
echo '  >$ stow *'
echo ' ou para instalar apenas de cada programa... '
echo '  >$ stow neovim'
echo ''
