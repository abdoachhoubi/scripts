#!/bin/bash

echo "Installing scripts..."

mkdir -p ~/scripts

cp * ~/scripts

SCRIPTS=("alias tleaks=\"bash ~/scripts/leaksloop.sh\"" "alias push=\"bash ~/scripts/push.sh\"" "alias code=\"bash ~/scripts/code.sh\"")

if [ -f ~/.bashrc ]; then
	echo "Adding to .bashrc..."
	for i in "${SCRIPTS[@]}"
	do
		# check if there's a param (-y)
		if [ "$1" == "-y" ]; then
			if grep -q "$i" ~/.bashrc; then
				echo "$i Already installed."
			else
				echo $i >> ~/.bashrc
			fi
		else
			INST="y"
			echo "Do you want to install $i? (y/n)"
			read INST
			if [ "$INST" == "y" ]; then
				if grep -q "$i" ~/.bashrc; then
					echo "$i Already installed."
				else
					echo $i >> ~/.bashrc
				fi
			fi
		fi
	done
fi

if [ -f ~/.zshrc ]; then
	echo "Adding to .zshrc..."
	for i in "${SCRIPTS[@]}"
	do
		# check if there's a param (-y)
		if [ "$1" == "-y" ]; then
			if grep -q "$i" ~/.zshrc; then
				echo "$i Already installed."
			else
				echo $i >> ~/.zshrc
			fi
		else
			INST="y"
			echo "Do you want to install $i? (y/n)"
			read INST
			if [ "$INST" == "y" ]; then
				if grep -q "$i" ~/.zshrc; then
					echo "$i Already installed."
				else
					echo $i >> ~/.zshrc
				fi
			fi
		fi
	done
fi

echo "Done."
