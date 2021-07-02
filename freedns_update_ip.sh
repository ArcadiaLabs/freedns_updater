#!/bin/sh
#FreeDNS updater script

DOMAIN="MY_DOMAIN"
USER="FREEDNS_USERNAME"
PASSWORD="FREEDNS_PASSWORD"

OLDIP=$(cat /tmp/oldip)
echo "OLD IP : "$OLDIP
IP=$(wget -q -O - http://checkip.dyndns.org|sed s/[^0-9.]//g)
echo "IP : "$IP

if [ "$IP" != "$OLDIP" ]
then
	echo "New IP dedected"
	UPDATEURL="https://"$USER":"$PASSWORD"@freedns.afraid.org/nic/update?hostname="$DOMAIN"&myip="$IP
	echo "URL : "$UPDATEURL

	wget -q -O /dev/null $UPDATEURL

	LOG=$(date +'%d/%m/%Y')" - "$(date +"%T")" : "$UPDATEURL 
	echo $LOG >> /tmp/freedns.log
	
	echo $IP > /tmp/oldip
else
	echo "IP has not changed"
fi
