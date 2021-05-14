#!/bin/bash

mkdir -p AURs

echo '## INSTALAÇÃO FUNCIONAL APENAS NO ARCH LINUX'
echo ''
echo 'PACOTES NECESSARIOS PARA RODAR ESSE SCRIPT:'
echo -e '\t-base-devel'
echo -e '\t-git'

sudo pacman -S i3 dmenu rofi feh lxappearance

cd AURs/
git clone https://aur.archlinux.org/polybar.git

cd polybar/
makepkg -si

cd ../../

mkdir -p ~/.config/i3
cd config-i3/
cp * ~/.config/i3

mkdir -p ~/.config/polybar 
cd ../config-polybar/
cp * ~/.config/polybar

echo ' # SELECIONAR TEMA DO ROFI'
rofi-theme-selector

echo ''
echo ''
echo '  -- ATENÇÃO --'
echo 'Para mudar o tema do sistema e o IconTheme basta executar: lxappearance'

