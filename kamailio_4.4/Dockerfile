FROM debian:jessie

MAINTAINER Alberto Sagredo <info@voipnovatos.es>

ENV build_date 2016-07-20

RUN apt-get update

RUN apt-get install -y vim-nox git gcc automake build-essential flex bison libncurses5-dev unixodbc-dev xsltproc libssl-dev libmysqlclient-dev make libssl-dev libcurl4-openssl-dev libxml2-dev libpcre3-dev uuid-dev libicu-dev libunistring-dev libsnmp-dev libevent-dev autoconf libtool wget libconfuse-dev libpcre3-dev

RUN PATH=$PATH:/usr/local/sbin

RUN export PATH

RUN mkdir -p /usr/local/src/kamailio-4.4 && \


    cd /usr/local/src/kamailio-4.4 && \
    git clone --depth 1 --no-single-branch git://git.kamailio.org/kamailio kamailio && \
    cd kamailio && \
    git checkout -b 4.4 origin/4.4

RUN cd /usr/local/src/kamailio-4.4/kamailio && \ 
    make include_modules="db_mysql dialplan nth presence xml websocket tls" cfg && \
    make Q=0 all && \
    make install

WORKDIR /usr/src/kamailio

COPY conf/* /usr/local/etc/kamailio/

COPY default/kamailio /etc/default/kamailio

COPY default/kamailio.init /etc/init.d/kamailio  

RUN ln -s /usr/local/lib64 /usr/lib64

RUN chmod 755 /etc/init.d/kamailio 

RUN mkdir -p /var/run/kamailio

EXPOSE 5060/udp 5061/udp

CMD ["/usr/local/sbin/kamailio", "-DD","-P", "/var/run/kamailio/kamailio.pid", "-f","/usr/local/etc/kamailio/kamailio.cfg"]
