#!/bin/bash

mkdir AURs

echo '## INSTALAÇÃO FUNCIONAL APENAS NO ARCH LINUX'
echo ''
echo 'PACOTES NECESSARIOS PARA RODAR ESSE SCRIPT:'
echo -e '\t-base-devel'
echo -e '\t-git'

sudo pacman -S i3 dmenu rofi

cd AURs/
git clone https://aur.archlinux.org/polybar.git

cd polybar/
makepkg -si

cd ../config-i3/
cp * ~/.config/i3

cd ../config-polybar/
cp * ~/.config/polybar

echo ' # SELECIONAR TEMA DO ROFI'
rofi-theme-selector
