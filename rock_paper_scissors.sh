#!/bin/bash
clear
options=(rock scissors paper)
your_score=0
ai_score=0

echo "Welcome to Rock paper scissors frenzy!"

main_menu(){
	clear
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
		echo -e "
great!
first to $choice"
sleep 1
			game_runner
			;;
		2) choice=3
		echo -e "
great!
first to $choice"
sleep 1
			game_runner
			;;						
		3) choice=5
		echo -e "
great!
first to $choice"
sleep 1
			game_runner
			;;
		4) read -p "first to : " choice 
			echo "game is first to $choice"
			game_runner
			;;
		5) freeplay_runner="1"
			free_play
			;;
		6) exit
			;;
	
	esac
}

game_runner(){
	sleep 1
	for (( i = 1; i <= choice ; i++ )); do
		game
	done
	tie_checker
	clear
	your_score=0
	ai_score=0
	main_menu
	echo "sddsgj"
}

tie_checker(){
	if [[ $your_score == $ai_score ]]; then
			echo "tiebreaker!"
			choice=1
			game
			if [[ $your_score -gt $ai_score ]]; then
				echo "you win!"
				echo -e "your score = $your_score
ai score = $ai_score"
			elif [[ $your_score -lt $ai_score ]]; then
				echo " you lose "
				echo -e "your score = $your_score
ai score = $ai_score"
			elif [[ $your_score == $ai_score ]]; then
			echo "tiebreaker!"
			choice=1
			game
		fi
	fi
		sleep 3
}

free_play(){
	while [[ $freeplay_runner -eq 1 ]]; do
		game
	done
}
game(){
	echo 'To exit at any time, type "e" or "E" to go back to main menu' 
	read -p "pick between rock (r), paper (p), scissors (s) : " selection
	ai_item=$(printf "%s\n" "${options[@]}" | shuf -n 1)

#rock selection outcomes

		if [[ ( $selection == "r" || $selection == "R" ) && $ai_item == "scissors" ]]; then
			echo -e "
			you picked rock
			I picked scissors"
			sleep 1
			echo "You win!"
			((your_score++))
			echo -e "your score = $your_score
ai score = $ai_score"
			sleep 1
		elif [[ ( $selection == "r" || $selection == "R" ) && $ai_item == "rock" ]]; then
			echo -e "you picked rock
			I picked rock"
			echo "Tie!"
			echo -e "your score = $your_score
ai score = $ai_score"
			sleep 1
			game
		elif [[ ( $selection == "r" || $selection == "R" ) && $ai_item == "paper" ]]; then
			echo -e "you picked rock
			I picked paper"
			echo "you lose"
			((ai_score++))
			echo -e "your score = $your_score
ai score = $ai_score"
			sleep 1
#paper selection outcomes

		elif [[ ( $selection == "p" || $selection == "P" ) && $ai_item == "scissors" ]]; then
			echo -e "you picked paper
I picked scissors"
			sleep 1
			echo "You lose"
			((ai_score++))
			echo -e "your score = $your_score
ai score = $ai_score"
			sleep 1
		elif [[ ( $selection == "p" || $selection == "P" ) && $ai_item == "rock" ]]; then
			echo -e "you picked paper
I picked rock"
			echo "You win!"
			((your_score++))
			echo -e "your score = $your_score
ai score = $ai_score"
			sleep 1
		elif [[ ( $selection == "p" || $selection == "P" ) && $ai_item == "paper" ]]; then
			echo -e "you picked paper
I picked paper"
			echo "tie!"
			echo -e "your score = $your_score
ai score = $ai_score"
			sleep 1
			game
#scissors selection outcomes

		elif [[ ( $selection == "s" || $selection == "S" ) && $ai_item == "scissors" ]]; then
			echo -e "you picked scissors
I picked scissors"
			sleep 1
			echo "Tie!"
			echo -e "your score = $your_score
ai score = $ai_score"
			sleep 1
			game
		elif [[ ( $selection == "s" || $selection == "S" ) && $ai_item == "rock" ]]; then
			echo -e "you picked scissors
I picked rock"
			echo "You lose"
			((ai_score++))
			echo -e "your score = $your_score
ai score = $ai_score"
			sleep 1
		elif [[ ( $selection == "r" || $selection == "R" ) && $ai_item == "paper" ]]; then
			echo -e "you picked scissors
I picked paper"
			echo "you win!"
			((your_score++))
			echo -e "your score = $your_score
ai score = $ai_score"
			sleep 1

			#exit outcome

		elif [[ $selection == "e" || $selection == "E" ]]; then
			echo "Going back to main menu"
			freeplay_runner=0
			sleep 1
			main_menu
		fi

}

	main_menu