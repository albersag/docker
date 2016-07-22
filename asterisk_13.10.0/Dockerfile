FROM debian:jessie
MAINTAINER Alberto Sagredo <info@voipnovatos.es>
ENV build_date 2016-07-20

RUN apt-get update

RUN apt-get install -y build-essential openssl libxml2-dev libncurses5-dev uuid-dev sqlite3 libsqlite3-dev pkg-config curl libjansson-dev

RUN curl -s http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-13.10.0.tar.gz | tar xvz

WORKDIR /asterisk-13.10.0

RUN ./configure; make; make install; make samples ; make config

EXPOSE 5060/udp

EXPOSE 10000-20000/udp

CMD ["/usr/sbin/asterisk", "-vvvvvvv"]

