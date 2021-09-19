#!/bin/bash

ip_list=$(cat server_list | awk -F'/' '{print $1}' > ip_list)


for ip in $(cat ip_list)
do
	fping $ip
done
