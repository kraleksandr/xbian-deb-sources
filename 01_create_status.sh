#!/bin/bash
IFS=$'\n';
DIRS=($(ls -Al | grep "^d" | awk '{print $9}'));
if [ -f status ]; then
	rm status;
fi;
for DIR in ${DIRS[@]}; do
	FILES=($(find $DIR -type f));
	for FILE in ${FILES[@]}; do
		echo -e "A\t$FILE" >> status;
	done;
done;