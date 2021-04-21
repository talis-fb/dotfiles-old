#!/bin/bash

echo 'Qual OS esta executando isso?'
echo -e "[1] Arch Linux \t [2] Debian/Ubuntu\t[x] Não baixar"
echo -n '>'; read osRunning;


if [ $osRunning = 1 ]; then
	echo '1) Instalar FISH'
	sudo pacman -S fish
	chsh -s /bin/fish
elif [ $osRunning = 2 ]; then 
	echo '1) Instalar FISH'
	sudo apt install fish
	chsh -s /usr/bin/fish
fi

echo 'Atualizar alias?'
echo -n '[s/n] '; read res;

if [ $res = "s" ]; then
	cp config.fish ~/.config/fish
	echo ' config.fish --> ~/.config/fish/config.fish'
fi
	
