#!/bin/bash

roulette_losses="/home/sysadmin/Desktop/Homework_3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/Roulette_Losses"

function find_losses(){
	grep "0310" $roulette_losses | awk -F':| ' '{print $2 ":" $3 ":" $4 " " $5}' | awk -F' ' '{print $1 " " $2 " " $3}' > 0310_losses
	grep "0312" $roulette_losses | awk -F':| ' '{print $2 ":" $3 ":" $4 " " $5}' | awk -F' ' '{print $1 " " $2 " " $3}' > 0312_losses
	grep "0315" $roulette_losses | awk -F':| ' '{print $2 ":" $3 ":" $4 " " $5}' | awk -F' ' '{print $1 " " $2 " " $3}' > 0315_losses
}

function compare_times(){
	losses="0310_losses"
	
	while IFS= read -r line
	do
		echo "$line" > temp
		awk -F' ' '{print $1}' temp > temp_time
		time=$(cat temp_time)
		awk -F' ' '{print $2}' temp > temp_hour
		hour=$(cat temp_hour)
		search_string="$time $hour"
		echo "$search_string"
		#grep -i "$search_string" 0310_Dealer_schedule | awk -F' ' '{print $1 " " $2 " " $5 " " $6}'
	done < "$losses"
}

compare_times


