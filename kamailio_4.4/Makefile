#
# This is a generic Makefile. It use to build Docker images.
#

all: build

build:
	   @docker build -t voipnovatos/kamailio
quickstart:
	@echo "Quick starting sample"
	@ddocker run -dt -p 5080:5080/udp -e ADVERTISED_IP="10.0.100.26" voipnovatos/kamailio
