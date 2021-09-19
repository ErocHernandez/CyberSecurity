#!/bin/bash

given_date=$1
given_time=$2
twelve_hour=$3

function get_files(){
	ten="/home/sysadmin/Desktop/Homework_3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/0310_Dealer_schedule"
	twelve="/home/sysadmin/Desktop/Homework_3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/0312_Dealer_schedule"
	fifteen="/home/sysadmin/Desktop/Homework_3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/0315_Dealer_schedule"
}

function find_date(){
	
	if [[ $given_date -eq 10 ]];then
		#
		active_date=$ten
	fi

	if [[ $given_date -eq 12 ]];then
                #  
                active_date=$twelve
        fi

	if [[ $given_date -eq 15 ]];then
                #  
                active_date=$fifteen
        fi
	
	#echo $active_date
}

function get_dealers(){
	echo "Roulette dealers for March $given_date'th at $given_time $twelve_hour"
	grep -i $given_time $active_date |grep $twelve_hour | awk -F' ' '{print $5 " " $6}'
}


get_files #get the files loaded into variables for easier use
find_date #find what date was passed in to the sript
get_dealers #find the dealers working during given date


