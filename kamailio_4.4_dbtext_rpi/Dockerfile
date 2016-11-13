FROM resin/rpi-raspbian:jessie

MAINTAINER Alberto Sagredo <info@voipnovatos.es>

ENV build_date 2016-11-11

ENV DEBIAN_FRONTEND noninteractive

ENV SIP_PORT 5060

ENV TLS_PORT 5061

RUN rm -rf /var/lib/apt/lists/* 

RUN apt-get update && apt-get install --assume-yes joe git gcc automake build-essential flex bison libncurses5-dev xsltproc libssl-dev make libssl-dev libcurl4-openssl-dev libxml2-dev libpcre3-dev uuid-dev libicu-dev libunistring-dev libevent-dev autoconf libtool wget libconfuse-dev iproute expect python

WORKDIR /usr/local/src/kamailio-4.4

RUN mkdir -p /usr/local/src/kamailio-4.4

RUN cd /usr/local/src/kamailio-4.4

RUN git clone --depth 1 --no-single-branch git://git.kamailio.org/kamailio -b 4.4 /usr/local/src/kamailio-4.4

WORKDIR /usr/local/src/kamailio-4.4

RUN  make cfg

RUN make include_modules="presence_dialoginfo pua pua_dialoginfo pua_usrloc db_text dialplan nth presence presence_xml xml tls" cfg && \
    make Q=0 all && \
    make install

ADD conf/etc/* /usr/local/etc/kamailio/

ADD boot_run.sh /etc/

WORKDIR /usr/local/etc/kamailio/

RUN mkdir /usr/local/etc/kamailio/certs

ADD conf/etc/certs/* /usr/local/etc/kamailio/certs/

COPY conf/default/kamailio /etc/default/kamailio

COPY conf/default/kamailio.init /etc/init.d/kamailio  

RUN chmod 755 /etc/init.d/kamailio 

RUN mkdir -p /var/run/kamailio

# Patch to use kamctl to add sip extensiones

COPY conf/etc/subscriber /usr/local/share/kamailio/dbtext/kamailio/subscriber

RUN chmod a+x /usr/local/share/kamailio/dbtext/kamailio/subscriber

EXPOSE $SIP_PORT $SIP_PORT/udp $TLS_PORT

RUN chmod a+x /etc/boot_run.sh

ENTRYPOINT ["/etc/boot_run.sh"]
