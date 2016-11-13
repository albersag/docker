#!/bin/bash

MYSQL_PWD=${MYSQL_PWD:-"passwd"}

ADVERTISED_IP=${ADVERTISED_IP:-"127.0.0.1"}

HOST_IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')

SIP_PORT=5060

TLS_PORT=5061

echo "Your IP : ${HOST_IP}"

echo -e "Your Advertised IP : ${ADVERTISED_IP}\n\n"

echo -e "Your Kamailio SIP Port : ${SIP_PORT}\n\n"

# Configure kamailio.cfg

sed -i "s/alias=.*/alias=\"${ADVERTISED_IP}\"/g" /usr/local/etc/kamailio/kamailio.cfg

sed -i "s/listen=udp.*/listen=udp:${HOST_IP}:5060 advertise ${ADVERTISED_IP}:5060/g" /usr/local/etc/kamailio/kamailio.cfg

sed -i "s/listen=tcp.*/listen=tcp:${HOST_IP}:5060 advertise ${ADVERTISED_IP}:5060/g" /usr/local/etc/kamailio/kamailio.cfg

sed -i "s/listen=tls.*/listen=tls:${HOST_IP}:5061 advertise ${ADVERTISED_IP}:5061/g" /usr/local/etc/kamailio/kamailio.cfg

#sed -i "s/port=.*/port=${SIP_PORT}/g" /usr/local/etc/kamailio/kamailio.cfg

sed -i "s/SIP_DOMAIN=.*/SIP_DOMAIN=${ADVERTISED_IP}/g" /usr/local/etc/kamailio/kamctlrc 

#mkdir /var/spool/rtpengine

#rtpengine -p /var/run/rtpengine.pid --interface=127.0.0.1!$ADVERTISED_IP -n 127.0.0.1:60000 -c 127.0.0.1:60001 -m 20000 -M 30000 -E -L 7

# Auto Create Database

kamdbctl create

kamctl add 100 snom

kamctl add 101 snom

kamctl add 102 snom

kamctl add 103 snom

kamctl add 104 snom

kamctl add 105 snom

kamctl add 106 snom

kamctl add 107 snom

kamctl add 108 snom

kamctl add 109 snom

kamctl add 110 snom

kamctl add 200 snom

kamctl add 201 snom

kamctl add 202 snom

# Starting Kamailio process

/usr/local/sbin/kamailio -DD -P/var/run/kamailio/kamailio.pid -f /usr/local/etc/kamailio/kamailio.cfg

/bin/bash