FROM debian:jessie

MAINTAINER Alberto Sagredo <info@voipnovatos.es>

ENV build_date 2016-07-20

ENV DEBIAN_FRONTEND noninteractive

ENV SIP_PORT 5080

USER root

RUN apt-get update && \
    echo "mysql-server mysql-server/root_password password passwd" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password passwd" | debconf-set-selections && \
    apt-get install -y mysql-server git make bison flex libmysqlclient-dev \
    libncurses5 libncurses5-dev mysql-client expect libxml2-dev tcpdump libmicrohttpd10 wget curl joe vim ngrep vim-nox git gcc automake build-essential flex bison libncurses5-dev unixodbc-dev xsltproc libssl-dev libmysqlclient-dev make libssl-dev libcurl4-openssl-dev libxml2-dev libpcre3-dev uuid-dev libicu-dev libunistring-dev libsnmp-dev libevent-dev autoconf libtool wget libconfuse-dev libpcre3-dev

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

RUN export DEBIAN_FRONTEND=noninteractive && \
    git clone https://github.com/sipwise/rtpengine.git ~/rtpengine && \
    cd ~/rtpengine && \
    ./debian/flavors/no_ngcp && \
    apt-get install -qqy dpkg-dev debhelper libevent-dev iptables-dev libcurl4-openssl-dev libglib2.0-dev libhiredis-dev libpcre3-dev libssl-dev libxmlrpc-core-c3-dev markdown zlib1g-dev module-assistant dkms gettext libbencode-perl libcrypt-rijndael-perl libdigest-hmac-perl libio-socket-inet6-perl libsocket6-perl netcat libpcap0.8-dev libpcap-dev && \
    dpkg-buildpackage  && \
    dpkg -i ../*.deb && \
    rm -rf rtpengine


WORKDIR /usr/src/kamailio

COPY conf/* /usr/local/etc/kamailio/

COPY boot_run.sh /etc/

COPY create_database.sh /etc/

RUN chmod a+x /etc/create_database.sh

COPY default/kamailio /etc/default/kamailio

COPY default/kamailio.init /etc/init.d/kamailio  

RUN ln -s /usr/local/lib64 /usr/lib64

RUN chmod 755 /etc/init.d/kamailio 

RUN mkdir -p /var/run/kamailio

EXPOSE 5080/udp 5081/udp

ENTRYPOINT ["/etc/boot_run.sh"]

