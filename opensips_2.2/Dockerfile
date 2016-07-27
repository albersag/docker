FROM debian:jessie

MAINTAINER "Alberto Sagredo info@voipnovatos.es"

USER root

RUN apt-get update && \
    echo "mysql-server mysql-server/root_password password passwd" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password passwd" |  debconf-set-selections && \
    apt-get install -y mysql-server git make bison flex libmysqlclient-dev \
    libncurses5 libncurses5-dev mysql-client expect libxml2-dev libcurl4-gnutls-dev tcpdump libmicrohttpd10 wget curl joe vim ngrep

RUN git clone https://github.com/OpenSIPS/opensips.git -b 2.2 ~/opensips_2_2 && \
    sed -i 's/include_modules?=/include_modules?= presence presence_dialoginfo presence_mwi presence_xml xcap db_mysql pua pua_bla pua_dialoginfo/g' ~/opensips_2_2/Makefile.conf.template && \
    cd ~/opensips_2_2 && \
    make all && make install && \
    cd .. && rm -rf ~/opensips_2_2

RUN export DEBIAN_FRONTEND=noninteractive && \
    git clone https://github.com/sipwise/rtpengine.git ~/rtpengine && \
    cd ~/rtpengine && \
    ./debian/flavors/no_ngcp && \
    apt-get install -qqy dpkg-dev debhelper libevent-dev iptables-dev libcurl4-openssl-dev libglib2.0-dev libhiredis-dev libpcre3-dev libssl-dev libxmlrpc-core-c3-dev markdown zlib1g-dev module-assistant dkms gettext libbencode-perl libcrypt-rijndael-perl libdigest-hmac-perl libio-socket-inet6-perl libsocket6-perl netcat libpcap0.8-dev libpcap-dev && \
    dpkg-buildpackage  && \
    dpkg -i ../*.deb && \
    rm -rf rtpengine

RUN apt-get purge -y bison build-essential ca-certificates flex git m4 pkg-config && \
    apt-get autoremove -y && \
    apt-get clean

RUN chmod 777 /var

RUN chmod 777 /var/run

RUN chmod 755 /usr/local/etc/opensips/opensips.cfg

COPY conf/opensipsctlrc /usr/local/etc/opensips/opensipsctlrc

COPY conf/opensips.cfg /usr/local/etc/opensips/opensips.cfg

COPY boot_run.sh /etc/boot_run.sh

RUN chown root.root /etc/boot_run.sh && chmod 700 /etc/boot_run.sh

EXPOSE 5060/udp

ENTRYPOINT ["/etc/boot_run.sh"]

