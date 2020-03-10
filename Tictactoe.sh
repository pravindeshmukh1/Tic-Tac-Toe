#!/bin/bash -x

echo "Welcome to the Tic Tac Toe"

declare -a gameBoard

gameBoard=(_ _ _ _ _ _ _ _ _)


<<<<<<< HEAD
case $rno in
	0)
		player=o ;;
	1)
		player=x ;;
esac
=======
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
>>>>>>> UC3_Check_Player_First
