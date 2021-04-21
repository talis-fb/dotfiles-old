#!/bin/bash

echo 'Qual OS esta executando isso?'
echo -e "[1] Arch Linux \t [2] Debian/Ubuntu\t[x] Não baixar nada"
echo -n '>'; read osRunning;

function archInstall(){
	echo 'PROGRAMAS PARA INSTALAR'
	echo -e '\t-Vim \n\t-Ranger \n\t-Tmux \n\t-NodeJS \n\t-NPM \n'
	sudo pacman -S gvim ranger tmux nodejs npm git curl
}
function debianInstall(){
	echo 'PROGRAMAS PARA INSTALAR'
	echo -e '\t-Vim \n\t-Ranger \n\t-Tmux \n\t-Node \n\t-NPM \n'
	sudo apt install vim vim-gtk tmux ranger git curl
	echo -e 'NodeJs e NPM precisam de uma instalação por fora'
}

function pluginManager(){
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	echo 'Plugin setado'
}


if [ $osRunning = 1 ]; then
	echo '1) Instalar programas'
	archInstall
	pluginManager
elif [ $osRunning = 2 ]; then 
	echo '1) Instalar programas'
	debianInstall
	pluginManager
fi

echo -e '\nMOVENDO .vimrc'
cp .vimrc ~/.vimrc
echo ' .vimrc --> ~/.vimrc'
