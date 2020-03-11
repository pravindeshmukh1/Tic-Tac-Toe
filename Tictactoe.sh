#!/bin/bash -x

echo "Welcome to the Tic Tac Toe"

declare -a gameBoard
changeTurn=x
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


function printBoard() {

	row=0
	count=1
	for ((i=1;i<=3;i++))
	do
		echo "$((count++))| ${gameBoard[$row]} | $((count++))| ${gameBoard[$((row=$row+1))]} | $((count++))| ${gameBoard[$((row=$row+1))]} | "
		row=$(($row+1))
	done
}


function changeTurn() {
	if [[ $1 == x ]]
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
		read -p "Enter the position 1 to 9 : " pos

		if (( $pos <= 9 && ${gameBoard[$pos-1]}!=x && ${gameBoard[$pos-1]}!=o ))
		then
			gameBoard[$(($pos - 1))]=$1
			flag=false
		else
			echo "invalid Postion"
		fi
	done
	changeTurn $1
}

function checkWin() {

row=0
col=0
diag1=0
diag2=2
flag=false

	for ((i=0; i<3;i++))
	do
		if [[ ${gameBoard[$row]} == $1 && ${gameBoard[$((row=$row+1))]} == $1  && ${gameBoard[$((row=$row+1))]} == $1 ]]
		then
			flag=true
			break
		fi
		if [[ ${gameBoard[$col]} == $1 && ${gameBoard[$((col=$col+3))]} == $1 && ${gameBoard[$((col=$col+3))]} == $1 ]]
		then
			flag=true
			break
		fi
		if [[ ${gameBoard[$diag1]} == $1 && ${gameBoard[$((diag1=$diag1+4))]} == $1 && ${gameBoard[$((diag1=$diag1+4))]} == $1 ]]
		then
			flag=true
			break
		fi
		if [[ ${gameBoard[$diag2]} == $1 && ${gameBoard[$((diag2=$diag2+2))]} == $1 && ${gameBoard[$((diag2=$diag2+2))]} == $1 ]]
		then
			flag=true
			break
		fi
		row=$(( ($i+1) * 3 ))
		col=$(( $i+1 ))
	done
	echo $flag
}

function main() {
	printBoard
	status=flag

	read play1 play2 < <( toss )
	echo $player1 $play1 $player2 $play2
	echo "Main function"

	for (( i=1;i<=${#gameBoard[@]};i++ ))
	do
		if [[ $play1 == $changeTurn ]]
		then
				playerMove $play1
				printBoard
				status=$( checkWin $play1 )
				if	[[ $status == true ]]
				then
					echo "Player 1 win"
					break
				fi
		else
				playerMove $play2
				printBoard
				status=$( checkWin $play2 )
				if	[[ $status == true ]]
				then
					echo "Player 2 win"
					break
				fi
		fi
				#printBoard
	done

	if [[ $status == false ]]
	then
			echo "Game Tie"
	fi

}
main

