#!/bin/bash
clear
options=(rock scissors paper)
game_values=(1 3 5 0)
your_score=0
ai_score=0

echo "Welcome to Rock paper scissors frenzy!"

main_menu(){
	sleep 1
	echo -e "would you like to play: 
	1) best of 1
	2) best of 3
	3) best of 5
	4) custom play (you pick what its best of)
	5) freeplay
	6) exit "

	read -p ":" choice
	check_choice
}

custom_play(){
	while true; do 
		read -p "best of : " choice 
		if [[ $choice =~ ^-?[0-9]+$ ]]; then
		echo -e "
				great!
				best of $choice"
				sleep 1
				game_runner
		else
			echo "invalid choice. try again"
			sleep 1
		fi
	done	
}

choice_message(){
	if [[ $choice =~ ^-?[0-9]+$ ]]; then
		echo -e "
				great!
				best of $choice"
				sleep 1
				game_runner
		else
			echo "invalid choice. try again"
			sleep 1
		fi
}
error_choice_message(){
		echo -e "
			invalid choice.
			best of $choice"
			sleep 1
			game_runner
}


check_choice(){
	case $choice in
		1) 	choice=$(printf "%s\n" "${game_values[0]}")
			choice_message
			;;
		2) choice=$(printf "%s\n" "${game_values[1]}")
			choice_message
			;;						
		3) choice=$(printf "%s\n" "${game_values[2]}")
			choice_message
			;;
		4)custom_play
			;;
		5) freeplay_runner="1"
			free_play
			;;
		6) 	echo "exiting..."
			sleep 1
			exit
			;;
		*) choice=3
			error_choice_message


	
	esac
}

game_runner(){
	for (( i = 1; i <= choice ; i++ )); do
		game
	done
	tie_checker
	clear
	your_score=0
	ai_score=0
	main_menu
}

tie_checker(){
	if [[ $your_score == $ai_score && $your_score -gt 0 && $ai_score -gt 0 ]]; then
			echo "tiebreaker!"
			choice=1
			game
			if [[ $your_score -gt $ai_score ]]; then
				echo "you win!"
				echo -e "
				your score = $your_score
				ai score = $ai_score"
				sleep 1
			elif [[ $your_score -lt $ai_score ]]; then
				echo " you lose "
				echo -e "
				your score = $your_score
				ai score = $ai_score"
				sleep 1
			elif [[ $your_score == $ai_score ]]; then
			echo "tiebreaker!"
			choice=1
			game
		fi
	fi
		sleep 1
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
			echo -e "
			You win!"
			((your_score++))
			echo -e "
			your score = $your_score
			ai score = $ai_score
			"
			sleep 1
		elif [[ ( $selection == "r" || $selection == "R" ) && $ai_item == "rock" ]]; then
			echo -e "
			you picked rock
			I picked rock"
			echo -e "
			Tie!"
			echo -e "
			your score = $your_score
			ai score = $ai_score
			"
			sleep 1
			game
		elif [[ ( $selection == "r" || $selection == "R" ) && $ai_item == "paper" ]]; then
			echo -e "
			you picked rock
			I picked paper"
			echo -e "
			you lose"
			((ai_score++))
			echo -e "
			your score = $your_score
			ai score = $ai_score
			"
			sleep 1
#paper selection outcomes

		elif [[ ( $selection == "p" || $selection == "P" ) && $ai_item == "scissors" ]]; then
			echo -e "
			you picked paper
			I picked scissors"
			echo -e "
			You lose"
			((ai_score++))
			echo -e "
			your score = $your_score
			ai score = $ai_score
			"
			sleep 1
		elif [[ ( $selection == "p" || $selection == "P" ) && $ai_item == "rock" ]]; then
			echo -e "
			you picked paper
			I picked rock"
			echo -e "
			You win!"
			((your_score++))
			echo -e "
			your score = $your_score
			ai score = $ai_score
			"
			sleep 1
		elif [[ ( $selection == "p" || $selection == "P" ) && $ai_item == "paper" ]]; then
			echo -e "
			you picked paper
			I picked paper"
			echo -e "
			tie!"
			echo -e "
			your score = $your_score
			ai score = $ai_score
			"
			sleep 1
			game
#scissors selection outcomes

		elif [[ ( $selection == "s" || $selection == "S" ) && $ai_item == "scissors" ]]; then
			echo -e "
			you picked scissors
			I picked scissors"
			echo -e "
			Tie!"
			echo -e "
			your score = $your_score
			ai score = $ai_score
			"
			sleep 1
			game
		elif [[ ( $selection == "s" || $selection == "S" ) && $ai_item == "rock" ]]; then
			echo -e "
			you picked scissors
			I picked rock"
			echo -e "
			You lose"
			((ai_score++))
			echo -e "
			your score = $your_score
			ai score = $ai_score
			"
			sleep 1
		elif [[ ( $selection == "s" || $selection == "S" ) && $ai_item == "paper" ]]; then
			echo -e "
			you picked scissors
			I picked paper"
			echo -e "
			you win!"
			((your_score++))
			echo -e "
			your score = $your_score
			ai score = $ai_score
			"
			sleep 1

			#exit outcome

		elif [[ $selection == "e" || $selection == "E" ]]; then
			echo -e "
			Going back to main menu"
			freeplay_runner=0
			sleep 1 
			clear
			main_menu

		#if user types any other letter or number
	else
		echo "ivalid. try again."
		sleep 1 
		game
		fi

}

	main_menu