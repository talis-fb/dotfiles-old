#!/bin/bash

echo 'OQUE ATUALIZAR?'
echo '/t [1] VIM'
echo '/t [2] FISH TERMINAL'
echo '/t [x] nothing'
echo -n '>'; read update;
echo ''

if [ $update = 1 ]; then
	cd VIM/
	bash install.sh
elif [ $update = 2 ]; then 
	cd FISH/
	bash install.sh
fi

