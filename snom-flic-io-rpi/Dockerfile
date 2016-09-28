FROM resin/rpi-raspbian

MAINTAINER Alberto Sagredo <info@voipnovatos.es>

ENV build_date 2016-09-27

ENV SNOMIP 10.0.1.37

ENV SNOMUSER snom

ENV SNOMPASS flicio

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update 

RUN apt-get update && apt-get install -y wget libsqlite3-0 libglib2.0-0 libical1a libudev1 libjson-glib-1.0-0 libc6 libncurses5 libncurses5-dbg libtinfo5 libtinfo5-dbg libstdc++6 libpcrecpp0 libselinux1 libffi6 libsoup2.4-1 libglib2.0-dev libdbus-1-dev libudev-dev automake libtool libical-dev libreadline-dev git make dbus

WORKDIR /home/snom/

RUN cd /home/snom  && wget http://www.kernel.org/pub/linux/bluetooth/bluez-5.37.tar.xz && tar xvf bluez-5.37.tar.xz

RUN cd /home/snom/bluez-5.37 && ./configure --enable-experimental --enable-library

RUN cd /home/snom/bluez-5.37 && make

RUN cd /home/snom/bluez-5.37 && make install

RUN mkdir /home/snom/flic && cd /home/snom/flic && wget --no-check-certificate https://github.com/50ButtonsEach/fliclib-linux-dist/releases/download/1-beta3/fliclib-linux.tar.gz

WORKDIR /home/snom/flic

RUN tar -zxvf fliclib-linux.tar.gz

COPY /boot.sh /home/snom

RUN chmod a+x /home/snom/boot.sh

ENTRYPOINT ["/home/snom/boot.sh"]
