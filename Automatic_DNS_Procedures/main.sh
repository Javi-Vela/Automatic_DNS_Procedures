#!/bin/bash
. functions.sh
Ips=(13.224.119.86 13.224.119.33 13.224.119.7 13.224.119.102)
domain=medsbla.com
opcion=0
while !([ $opcion -eq 9 ]); do
	mostrar_menu
	opcion=$?
	case $opcion in
		1)
			reverse_ip_lookup ${Ips[0]} ${Ips[1]} ${Ips[2]} ${Ips[3]}
		;;
		2)
			ip_history $domain
		;;
		3)
			ip_location_finder ${Ips[0]} ${Ips[1]} ${Ips[2]} ${Ips[3]}
		;;
		4)
			ip_whois $domain
		;;
		5)
			dns_record_lookup $domain
		;;
		6)
			port_scanner ${Ips[0]} ${Ips[1]} ${Ips[2]} ${Ips[3]}
		;;
		7)
			traceroute $domain
		;;
		8)
			dnssec medsbla.com
		;;
		9)
			echo "estas saliendo..."
			read espera
		;;
		*)
			echo "opcion invalida"
	esac
done



