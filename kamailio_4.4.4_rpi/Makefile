#
# This is a generic Makefile. It use to build Docker images.
#

all: build

build:
	   @docker build -t voipnovatos/kamailio-rpi
quickstart:
	@echo "Quick starting sample"
	@ddocker run -dt -p 5060:5680/udp -e ADVERTISED_IP="10.0.1.93” voipnovatos/kamailio-rpi
