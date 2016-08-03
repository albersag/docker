#!/bin/bash

set -e

if [ -z "$ENV SIP_PORT" ]; then
    echo "Default SIP PORT"
else
    echo "SIP Port changed"
    sed -i "s/udpbindaddr=0.0.0.0/udpbindaddr=0.0.0.0:$SIP_PORT/g" /etc/asterisk/sip.conf
fi

if [ -z "$ENV RTP_PORT_START" ]; then
    echo "Default RTP Port Start"
else                   
    echo "SIP RTP Start changed"
    sed -i "s/rtpstart=10000/rtpstart=$RTP_PORT_START/g" /etc/asterisk/rtp.conf
fi  

if [ -z "$ENV RTP_PORT_END" ]; then 
    echo "Default RTP Port End"
else    
    echo "SIP RTP END changed"
    sed -i "s/rtpend=20000/rtpend=$RTP_PORT_END/g" /etc/asterisk/rtp.conf
fi 	

/usr/sbin/asterisk -vvvvvvv

