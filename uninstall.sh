#!/bin/bash

echo "Uninstalling scripts..."

SCRIPTS=("alias tleaks=\"bash ~/scripts/leaksloop.sh\"" "alias push=\"bash ~/scripts/push.sh\"" "alias code=\"bash ~/scripts/code.sh\"")

if [ -f ~/.bashrc ]; then
	echo "Removing from .bashrc..."
	for i in "${SCRIPTS[@]}"
	do
		if grep -q "$i" ~/.bashrc; then
			sed -i "\|$i|d" ~/.bashrc
		fi
	done
fi

if [ -f ~/.zshrc ]; then
	echo "Removing from .zshrc..."
	for i in "${SCRIPTS[@]}"
	do
		if grep -q "$i" ~/.zshrc; then
			sed -i "\|$i|d" ~/.zshrc
		fi
	done
fi

REM="y"
echo "Do you want to remove the scripts folder? (y/n)"
read REM
if [ "$REM" == "y" ]; then
	rm -rf ~/scripts
fi

echo "Done."
