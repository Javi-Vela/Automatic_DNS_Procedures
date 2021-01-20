#!/bin/bash

function mostrar_menu(){
	echo " ----------------------------------MENU------------------------------"	
	echo "                  1)        Reverse IP Lookup"
	echo "                  2)        IP History"
	echo "                  3)        IP Location Finder"
	echo "                  4)        IP Whois"
	echo "                  5)        DNS Record Lookup"
	echo "                  6)        Port Scanner"
	echo "                  7)        Traceroute"
	echo "                  8)        DNSSEC Test"
	echo "                  9)        salir"
	read -p "                    elige un opcion: " opcion
	return $opcion
}


function reverse_ip_lookup(){
	while [ -n "$1" ]; do
		domain=`host $1 | cut -d " " -f 5`
		echo "The domain of "$1" is "$domain
		shift
	done
	read -p "waiting......press any key" Wait 
}

function ip_history(){
	domain=$1
	firefox https://viewdns.info/iphistory/?domain="$domain" &
	echo "open a new window"
	read -p "waiting......press any key" Wait
}

function ip_location_finder(){
	while [ -n "$1" ]; do
		location_city=`curl -s https://ipvigilante.com/$1 | jq '.data.city_name'`
		location_country=`curl -s https://ipvigilante.com/$1 | jq '.data.country_name'`
		echo "the location of "$1" is "$location_city", "$location_country
		shift
	done
	read -p "waiting......press any key" Wait
}

function ip_whois(){
	whois $1 | head -n 18
	read -p "waiting......press any key" Wait
}


function dns_record_lookup(){
	dig $1 | tail -10 | head -n 5 > ./temporal.txt
	echo "All DNS records: "
	while read line; do
		line2=`echo $line | cut -d " " -f1`
		if [ "$line2" = "medsbla.com." ]; then
			echo "                 "$line
		fi
	done < ./temporal.txt
	rm ./temporal.txt
	read -p "waiting......press any key" Wait
}


function port_scanner(){
	echo "Wait......"
	while [ -n "$1" ]; do
		nmap $1 | grep '^[0-9]' > ./temporal.txt
		echo "The open ports of "$1" are: "
		while read line; do
			echo "------------------------------------"$line
		done < ./temporal.txt
		shift
		rm ./temporal.txt
	done
	read -p "waiting......press any key" Wait
}

function traceroute(){
	traceroute $1
	#read -p "waiting......" Wait
}


function dnssec(){
	firefox https://dnssec-analyzer.verisignlabs.com/$1 &
	echo "open a new window"
	read -p "waiting......press any key" Wait
}
