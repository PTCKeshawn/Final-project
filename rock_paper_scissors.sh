#!/bin/bash

options = ["Rock", "Scissors", "Paper" ]

main_menu(){
	echo "Welcome to Rock paper scissors frenzy!"
	sleep 1
	play_options
}


play_options(){
	echo -e "would you like to play: 
	1) first to 1
	2) first to 3
	3) first to 5
	4) custom play (you pick what its up to)
	5) freeplay"

	read -p ":" choice
}