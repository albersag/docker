#
# This is a generic Makefile. It use to build Docker images.
#

all: build

build:
	   @docker build -t voipnovatos/kamailio-rpi-dbtext 
quickstart:
	@echo "Quick starting sample"
	@docker run -dt -p 5060:5060 -p 5060:5060/udp -p 5061:5061 -e ADVERTISED_IP="10.0.200.94" voipnovatos/kamailio-rpi-dbtext
