#!/bin/bash -x

echo "Welcome to the Tic Tac Toe"

declare -a gameBoard

gameBoard=(_ _ _ _ _ _ _ _ _)


function toss() {

	rno=$((RANDOM%2))

	case $rno in
		0)
			player=o
			computer=x ;;
		1)
			player=x
			computer=o ;;
	esac
	echo $player $computer
}
toss
