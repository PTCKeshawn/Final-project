#!/bin/bash

options=(Rock Scissors Paper)

main_menu(){
	echo "Welcome to Rock paper scissors frenzy!"
	sleep 1
	echo -e "would you like to play: 
	1) first to 1
	2) first to 3
	3) first to 5
	4) custom play (you pick what its up to)
	5) freeplay
	6) exit "

	read -p ":" choice
	check_choice
}

check_choice(){
	case choice in
		1) game_to_1
			;;
		2) game_to_3
			;;
		3) game_to_5
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

#game_runner(){
#	for (( i = 0; i <= choice ; i++ )); do
#		game
#	done
#	echo "sddsgj"
#}

	main_menu