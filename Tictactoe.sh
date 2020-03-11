#!/bin/bash -x

echo "Welcome to the Tic Tac Toe"

declare -a gameBoard

gameBoard=(_ _ _ _ _ _ _ _ _)


function toss() {

	rno=$((RANDOM%2))

	case $rno in
		0)
			player1=o
			player2=x ;;
		1)
			player1=x
			player2=o ;;
	esac
	echo $player1 $player2
}
#toss

function printBoard() {

	row=0
	count=1
	for ((i=1;i<=3;i++))
	do
		echo "$((count++))| ${gameBoard[$row]} | $((count++))| ${gameBoard[$((row=$row+1))]} | $((count++))| ${gameBoard[$((row=$row+1))]} | "
		row=$(($row+1))
	done
}
#printBoard

function changeTurn() {
	if [ $1 == x ]
	then
		changeTurn=o
	else
		changeTurn=x
	fi
}

function playerMove () {
	flag=ture
	while [[ $flag == ture ]]
	do
		read -p "Enter the position 1 to 9 " pos

		if [[ $pos -le 9 && ${gameBoard[$(($pos-1))]}!=o && ${gameBoaed[$(($pos-1))]}!=x ]]
		then
			gameBoard[$((pos-1))]=$1
			flag=false
		else
			echo "invalid Postion"
		fi
	done
	changeTurn $1
}

function main () {
	printBoard
	read play1 play2 < <( toss )
echo  $play1 $play2
echo "Main function"

	for ((i=1; i<=9; i++))
	do
		if [[ $play1 == $changeTurn ]]
		then
				playerMove $play1
		else
				playerMove $play2
		fi
				printBoard
	done
}
main
