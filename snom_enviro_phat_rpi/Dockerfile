FROM alexellis2/python-gpio:armv6

MAINTAINER Alberto Sagredo <info@voipnovatos.es>

ENV build_date 2016-09-26

ENV IP 10.0.1.153

ENV PORT 8888

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -qy install python-smbus i2c-tools git python-pip python-dev net-tools iproute

#RUN apt-get install python-rpi.gpio

WORKDIR /home/snom/

RUN git clone https://github.com/pimoroni/enviro-phat.git

COPY /snom_xmlserver.py /home/snom

COPY /boot.sh /home/snom

RUN chmod a+x /home/snom/boot.sh

RUN pip install envirophat

RUN pip install RPi.GPIO

ENTRYPOINT ["/home/snom/boot.sh"]
