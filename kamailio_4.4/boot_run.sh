#!/bin/bash
# Program:
#       This program is install boot run script.

MYSQL_PWD=${MYSQL_PWD:-"passwd"}
ADVERTISED_IP=${ADVERTISED_IP:-"127.0.0.1"}
HOST_IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')
SIP_PORT=5080

echo "Your IP : ${HOST_IP}"
echo -e "Your Advertised IP : ${ADVERTISED_IP}\n\n"
echo -e "Your Kamailio SIP Port : ${SIP_PORT}\n\n"

# Starting MySQL

service mysql start

# Auto Create Database

/etc/create_database.sh

# Configure kamailio.cfg

sed -i "s/alias=.*/alias=\"${ADVERTISED_IP}\"/g" /usr/local/etc/kamailio/kamailio.cfg

sed -i "s/listen=.*/listen=udp:${HOST_IP}:5080 advertise ${ADVERTISED_IP}:5080/g" /usr/local/etc/kamailio/kamailio.cfg

sed -i "s/port=.*/port=${SIP_PORT}/g" /usr/local/etc/kamailio/kamailio.cfg

mkdir /var/spool/rtpengine

rtpengine -p /var/run/rtpengine.pid --interface=127.0.0.1!$ADVERTISED_IP -n 127.0.0.1:60000 -c 127.0.0.1:60001 -m 20000 -M 30000 -E -L 7

# Starting Kamailio process

/usr/local/sbin/kamailio -DD -P/var/run/kamailio/kamailio.pid -f /usr/local/etc/kamailio/kamailio.cfg

/bin/bash