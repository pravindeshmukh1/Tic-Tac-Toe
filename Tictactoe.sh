#!/bin/bash -x

echo "Welcome to the Tic Tac Toe"

declare -a gameBoard

gameBoard=(_ _ _ _ _ _ _ _ _)

rno=$((RANDOM%2))

case $rno in
	0)
		player=o ;;
	1)
		player=x ;;
esac
