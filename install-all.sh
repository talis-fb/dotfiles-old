#!/bin/bash

echo 'OQUE ATUALIZAR?'
echo '/t [1] VIM'
echo '/t [2] FISH TERMINAL'
echo '/t [3] ALL'
echo '/t [x] nothing'
echo -n '>'; read update;
echo ''

current_folder=$( pwd )

function vimInstall(){
	cd $current_folder/VIM/
	bash install.sh
}

function fishInstall(){
	cd $current_folder/FISH/
	bash install.sh
}

if [ $update = 1 ]; then
	vimInstall
elif [ $update = 2 ]; then 
	fishInstall
elif [ $update = 3 ]; then 
	vimInstall
	fishInstall
fi
