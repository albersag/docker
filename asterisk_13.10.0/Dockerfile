FROM debian:jessie

MAINTAINER Alberto Sagredo <info@voipnovatos.es>

ENV build_date 2016-07-25

ENV DEBIAN_FRONTEND noninteractive

ENV SIP_PORT 5080

ENV RTP_PORT_START 10000

ENV RTP_PORT_END 10150

RUN apt-get update

RUN apt-get install -y build-essential openssl libxml2-dev libncurses5-dev uuid-dev sqlite3 libsqlite3-dev pkg-config curl libjansson-dev wget curl unzip wget 

RUN curl -s http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-13.10.0.tar.gz | tar xvz

WORKDIR /asterisk-13.10.0

RUN ./configure; make; make install; make samples ; make config

COPY conf/config.sh /root/

RUN chmod a+x /root/config.sh

CMD ["/root/config.sh"]

EXPOSE $SIP_PORT/udp

#CMD ["/usr/sbin/asterisk", "-vvvvvvv"]

