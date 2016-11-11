	FROM resin/rpi-raspbian:jessie

MAINTAINER Alberto Sagredo <info@voipnovatos.es>

ENV build_date 2016-11-08

ENV DEBIAN_FRONTEND noninteractive

ENV SIP_PORT 5060

RUN rm -rf /var/lib/apt/lists/* 

RUN echo "mysql-server mysql-server/root_password password passwd" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password passwd" | debconf-set-selections 

RUN apt-get update && apt-get install --assume-yes mysql-server joe git gcc automake build-essential flex bison libncurses5-dev unixodbc-dev xsltproc libssl-dev libmysqlclient-dev make libssl-dev libcurl4-openssl-dev libxml2-dev libpcre3-dev uuid-dev libicu-dev libunistring-dev libsnmp-dev libevent-dev autoconf libtool wget libconfuse-dev libjsoncpp-dev iproute expect

WORKDIR /usr/src/kamailio

RUN mkdir -p /usr/local/src/kamailio-4.4

RUN cd /usr/local/src/kamailio-4.4

RUN git clone --depth 1 --no-single-branch git://git.kamailio.org/kamailio -b 4.4 /usr/src/kamailio

WORKDIR /usr/src/kamailio

RUN  make cfg

RUN make include_modules="presence_dialoginfo presence_reginfo pua pua_dialoginfo pua_usrloc pua_reginfo db_mysql dialplan nth presence presence_xml xml websocket tls" cfg && \
    make Q=0 all && \
    make install

ADD conf/etc/* /usr/local/etc/kamailio/

ADD boot_run.sh /etc/

COPY create_database.sh /etc/

COPY create_database_presence.sh /etc/

RUN chmod a+x /etc/create_database.sh

RUN chmod a+x /etc/create_database_presence.sh

RUN mkdir /usr/local/etc/kamailio/certs

ADD conf/etc/certs/* /usr/local/etc/kamailio/certs/

#ADD conf/default/kamailio /etc/default/kamailio/

#COPY conf/default/kamailio.init /etc/init.d/kamailio  

#RUN chmod 755 /etc/init.d/kamailio 

RUN mkdir -p /var/run/kamailio

EXPOSE $SIP_PORT/udp

RUN chmod a+x /etc/boot_run.sh

ENTRYPOINT ["/etc/boot_run.sh"]