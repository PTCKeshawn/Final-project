#!/bin/bash

options=(rock scissors paper)
your_score=0
ai_score=0

echo "Welcome to Rock paper scissors frenzy!"

main_menu(){
	sleep 1
	echo -e "would you like to play: 
	1) best of 1
	2) best of 3
	3) best of 5
	4) custom play (you pick what its up to)
	5) freeplay
	6) exit "

	read -p ":" choice
	check_choice
}

check_choice(){
	case $choice in
		1) choice=1
			game_runner
			;;
		2) choice=3
			game_runner
			;;						
		3) choice=5
			game_runner
			;;
		4) read -p "first to : " choice 
			echo "game is first to $choice"
			game_runner
			;;
		5) free_play
			;;
		6) exit
			;;
	
	esac
}

game_runner(){
	for (( i = 1; i <= choice ; i++ )); do
		game
		if [[ $your_score == $ai_score ]]; then
			echo "tiebreaker!"
			game
	done
	main_menu
	echo "sddsgj"
}


game(){
	read -p "pick between rock (r), paper (p), scissors (s) : " selection
	ai_item=$(printf "%s\n" "${options[@]}" | shuf -n 1)
		if [[ ( $selection == "r" || $selection == "R" ) && $ai_item == "scissors" ]]; then
			echo -e "you picked rock
I picked scissors"
			sleep 1
			echo "You win!"
			((your_score++))
			echo -e "your score = $your_score
ai score = $ai_score"
			echo $your_score
		elif [[ ( $selection == "r" || $selection == "R" ) && $ai_item == "rock" ]]; then
			echo -e "you picked rock
			I picked rock"
			echo "Tie!"
			echo -e "your score = $your_score
ai score = $ai_score"
		elif [[ ( $selection == "r" || $selection == "R" ) && $ai_item == "paper" ]]; then
			echo -e "you picked rock
			I picked paper"
			echo "I win!"
			((ai_score++))
			echo -e "your score = $your_score
ai score = $ai_score"
		fi
		echo "$ai_item"
}

	main_menu