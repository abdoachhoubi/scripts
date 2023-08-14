#!/bin/bash

echo "Installing scripts..."

SCRIPTS=("alias tleaks=\"bash ~/scripts/leaksloop.sh\"" "alias push=\"bash ~/scripts/push.sh\"" "alias code=\"bash ~/scripts/code.sh\"")

if [ -f ~/.bashrc ]; then
	echo "Adding to .bashrc..."
	for i in "${SCRIPTS[@]}"
	do
		if grep -q "$i" ~/.bashrc; then
			echo "$i Already installed."
		else
			echo $i >> ~/.bashrc
		fi
	done
fi

if [ -f ~/.zshrc ]; then
	echo "Adding to .zshrc..."
	for i in "${SCRIPTS[@]}"
	do
		if grep -q "$i" ~/.zshrc; then
			echo "$i Already installed."
		else
			echo $i >> ~/.zshrc
		fi
	done
fi

echo "Done."
