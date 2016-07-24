FROM debian:jessie

MAINTAINER Alberto Sagredo <info@voipnovatos.es>

ENV build_date 2016-07-22

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get -y install apt-utils

RUN apt-get -y upgrade

RUN apt-get install -y unzip screen curl wget 

RUN mkdir -p /root/consul_0.6.4

RUN mkdir -p /tmp/consul

RUN cd /root/consul_0.6.4

WORKDIR /root/consul_0.6.4

RUN wget https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip 

RUN unzip consul_0.6.4_linux_amd64.zip 

EXPOSE 8300
EXPOSE 8301
EXPOSE 8302
EXPOSE 8400
EXPOSE 8500
EXPOSE 8600


CMD ["/root/consul_0.6.4/consul","agent","-server","-bootstrap","-data-dir","/tmp/consul"]