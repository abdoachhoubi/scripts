#!/bin/sh

ARGS_COUNT=$#

RED_BOLD="\033[1;31m"
GRREEN_BOLD="\033[1;32m"
RESET="\033[0m"


if [ $ARGS_COUNT -eq 0 ]; then
	echo -e "$RED_BOLD""Usage: push.sh <file1> <file2> ...$RESET"
	exit 1
fi

for i in "$@"
do
	git add $i
done

echo -n "Enter commit message: "
read MESSAGE

git commit -m "$MESSAGE"

git push
